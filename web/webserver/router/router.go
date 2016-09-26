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
package router

import (
	"net/http"

	"github.com/gorilla/context"
	"github.com/julienschmidt/httprouter"
	"github.com/justinas/alice"
)

var (
	r RouterInfo
)

const (
	params = "params"
)

// RouteInfo is the details
type RouterInfo struct {
	Router *httprouter.Router
}

// Set up the router
func init() {
	r.Router = httprouter.New()
}

// ReadConfig returns the information
func ReadConfig() RouterInfo {
	return r
}

// Instance returns the router
func Instance() *httprouter.Router {
	return r.Router
}

// Context returns the URL parameters
func Params(r *http.Request) httprouter.Params {
	return context.Get(r, params).(httprouter.Params)
}

// Chain returns handle with chaining using Alice
func Chain(fn http.HandlerFunc, c ...alice.Constructor) httprouter.Handle {
	return Handler(alice.New(c...).ThenFunc(fn))
}