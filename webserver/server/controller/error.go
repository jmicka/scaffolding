package controller

import (
	"net/http"

	"scaffolding/server/shared/response"
	"scaffolding/server/shared/router"
)

func init() {
	// This does not work for routes where the path matches, but the method does not (on HEAD and OPTIONS need to check)
	// https://github.com/julienschmidt/httprouter/issues/13
	var e405 http.HandlerFunc = Error405
	router.Instance().HandleMethodNotAllowed = true
	router.Instance().MethodNotAllowed = e405

	// 404 Page
	var e404 http.HandlerFunc = Error404
	router.Instance().NotFound = e404
}

// Error404 - Page Not Found
func Error404(writer http.ResponseWriter, request *http.Request) {
	response.SendError(writer, http.StatusNotFound, "not found")
}

// Error405 - Method Not Allowed
func Error405(writer http.ResponseWriter, request *http.Request) {
	response.SendError(writer, http.StatusMethodNotAllowed, "method not allowed")
}

// Error500 - Internal Server Error
func Error500(writer http.ResponseWriter, request *http.Request) {
	response.SendError(writer, http.StatusInternalServerError, "internal server error")
}