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
)

// Delete is a shortcut for router.Handle("DELETE", path, handle)
func Delete(path string, fn http.HandlerFunc) {
	r.Router.DELETE(path, HandlerFunc(fn))
}

// Get is a shortcut for router.Handle("GET", path, handle)
func Get(path string, fn http.HandlerFunc) {
	r.Router.GET(path, HandlerFunc(fn))
}

// Head is a shortcut for router.Handle("HEAD", path, handle)
func Head(path string, fn http.HandlerFunc) {
	r.Router.HEAD(path, HandlerFunc(fn))
}

// Options is a shortcut for router.Handle("OPTIONS", path, handle)
func Options(path string, fn http.HandlerFunc) {
	r.Router.OPTIONS(path, HandlerFunc(fn))
}

// Patch is a shortcut for router.Handle("PATCH", path, handle)
func Patch(path string, fn http.HandlerFunc) {
	r.Router.PATCH(path, HandlerFunc(fn))
}

// Post is a shortcut for router.Handle("POST", path, handle)
func Post(path string, fn http.HandlerFunc) {
	r.Router.POST(path, HandlerFunc(fn))
}

// Put is a shortcut for router.Handle("PUT", path, handle)
func Put(path string, fn http.HandlerFunc) {
	r.Router.PUT(path, HandlerFunc(fn))
}

