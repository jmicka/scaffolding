package sample_handler

import (
	"log"
	"net/http"

	"scaffolding/webserver/handlers"
	"scaffolding/webserver/models/sample"
	"scaffolding/webserver/response"
)

func Get(writer http.ResponseWriter, request *http.Request) {
	results, error := sample.Get()

	if error == sample.ErrorNoResult {
		response.Send(writer, http.StatusOK, handlers.ItemNotFound, 0, nil)
		return
	} else if error != nil {
		log.Println(error)
		response.SendError(writer, http.StatusInternalServerError, handlers.InternalServerError)
		return
	}

	if len(results) == 0 {
		response.Send(writer, http.StatusOK, handlers.EmptySet, len(results), results )
	} else {
		response.Send(writer, http.StatusOK, handlers.ItemFound, len(results), results )
	}
}
