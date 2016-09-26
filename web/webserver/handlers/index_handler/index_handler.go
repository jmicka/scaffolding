package index_handler

import (
	"net/http"

	"scaffolding/webserver/response"
)

func Get(writer http.ResponseWriter, request *http.Request) {
	response.Send(writer, http.StatusOK, "Go Server is live and accepting connections!", 0, nil)
}