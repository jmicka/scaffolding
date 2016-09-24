package controller

import (
	"net/http"

	"scaffolding/server/shared/response"
	"scaffolding/server/shared/router"
)

func init() {
	router.Get("/", Index)
}

func Index(writer http.ResponseWriter, request *http.Request) {
	response.Send(writer, http.StatusOK, "Go Server", 0, nil)
}