/*
The MIT License (MIT)

Copyright (c) 2016 Joseph Spurrier

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

ORIGINAL PROJECT CODE AVAILABLE AT: https://github.com/josephspurrier/gowebapi
*/
package response

import (
	"encoding/json"
	"net/http"
)

// Core Response
type Core struct {
	Status  http.ConnState `json:"status"`
	Message string         `json:"message"`
}

// Change Response
type Change struct {
	Status   http.ConnState `json:"status"`
	Message  string         `json:"message"`
	Affected int            `json:"affected"`
}

// Retrieve Response
type Retrieve struct {
	Status  http.ConnState `json:"status"`
	Message string         `json:"message"`
	Count   int            `json:"count"`
	Results interface{}    `json:"results"`
}

// SendError calls Send by without a count or results
func SendError(w http.ResponseWriter, status http.ConnState, message string) {
	Send(w, status, message, 0, nil)
}

// Send writes struct to the writer using a format
func Send(w http.ResponseWriter, status http.ConnState, message string, count int, results interface{}) {

	var i interface{}

	// Determine the best format
	if count < 1 {
		i = &Core{
			Status:  status,
			Message: message,
		}
	} else if results == nil {
		i = &Change{
			Status:   status,
			Message:  message,
			Affected: count,
		}
	} else {
		i = &Retrieve{
			Status:  status,
			Message: message,
			Count:   count,
			Results: results,
		}
	}

	js, err := json.Marshal(i)
	if err != nil {
		http.Error(w, "JSON Error: "+err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(int(status))
	w.Write(js)
}

// SendJSON writes a struct to the writer
func SendJSON(w http.ResponseWriter, i interface{}) {
	js, err := json.Marshal(i)
	if err != nil {
		http.Error(w, "JSON Error: "+err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(js)
}