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
package server

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

// Server stores the hostname and port number
type Server struct {
	Hostname  string `json:"Hostname"`  // Server name
	UseHTTP   bool   `json:"UseHTTP"`   // Listen on HTTP
	UseHTTPS  bool   `json:"UseHTTPS"`  // Listen on HTTPS
	HTTPPort  int    `json:"HTTPPort"`  // HTTP port
	HTTPSPort int    `json:"HTTPSPort"` // HTTPS port
	CertFile  string `json:"CertFile"`  // HTTPS certificate
	KeyFile   string `json:"KeyFile"`   // HTTPS private key
}

// Run starts the HTTP and/or HTTPS listener
func Run(http_handler http.Handler, https_handler http.Handler) {

	var server Server
	var port int
	var error error

	server.Hostname = os.Getenv("HOSTNAME")
	server.UseHTTP = true
	server.UseHTTPS = false
	
	port, error = strconv.Atoi(os.Getenv("HTTP_PORT"))
	if error != nil {
		log.Println("Config file does not specify a listener to start")
	}

	server.HTTPPort = port
	if server.HTTPPort == 0 {
		server.HTTPPort = 8000
	}

	port, error = strconv.Atoi(os.Getenv("HTTPS_PORT"))
	if error != nil  {
		log.Println("Config file does not specify a listener to start")
	}

	server.HTTPSPort = port
	if server.HTTPSPort == 0 {
		server.HTTPSPort = 8443
	}
	server.CertFile = os.Getenv("SSL_CERTIFICATE_FILE")
	server.KeyFile = os.Getenv("SSL_KEY_FILE")

	if server.UseHTTP && server.UseHTTPS {
		go func() {
			start_HTTPS(https_handler, server)
		}()

		start_HTTP(http_handler, server)
	} else if server.UseHTTP {
		start_HTTP(http_handler, server)
	} else if server.UseHTTPS {
		start_HTTPS(https_handler, server)
	} else {
		log.Println("Config file does not specify a listener to start")
	}
}

// start_HTTP starts the HTTP listener
func start_HTTP(handler http.Handler, server Server) {
	fmt.Println(time.Now().Format("2006-01-02 03:04:05 PM"), "Running HTTP "+get_http_address(server))

	// Start the HTTP listener
	log.Fatal(http.ListenAndServe(get_http_address(server), handler))
}

// start_HTTPS starts the HTTPS listener
func start_HTTPS(handler http.Handler, server Server) {
	fmt.Println(time.Now().Format("2006-01-02 03:04:05 PM"), "Running HTTPS "+get_https_address(server))

	// Start the HTTPS listener
	log.Fatal(http.ListenAndServeTLS(get_https_address(server), server.CertFile, server.KeyFile, handler))
}

// get_http_address returns the HTTP address
func get_http_address(server Server) string {
	return server.Hostname + ":" + fmt.Sprintf("%d", server.HTTPPort)
}

// get_https_address returns the HTTPS address
func get_https_address(server Server) string {
	return server.Hostname + ":" + fmt.Sprintf("%d", server.HTTPSPort)
}