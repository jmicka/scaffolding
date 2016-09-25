package error_handler

import (
	"net/http"

	"scaffolding/webserver/response"
)

func Generate(code int) http.HandlerFunc {
	switch(code) {
		case 404: // Page Not Found
			return func (writer http.ResponseWriter, request *http.Request) { response.SendError(writer, http.StatusNotFound, "not found") };
		case 405: // Method Not Allowed
			return func (writer http.ResponseWriter, request *http.Request) { response.SendError(writer, http.StatusMethodNotAllowed, "method not allowed") };
		case 500: // Internal Server Error
			return func (writer http.ResponseWriter, request *http.Request) { response.SendError(writer, http.StatusInternalServerError, "internal server error") };
	}
	// unable to find a matching error, so fall back to 500
	return func (writer http.ResponseWriter, request *http.Request) { response.SendError(writer, http.StatusInternalServerError, "internal server error") };
}
