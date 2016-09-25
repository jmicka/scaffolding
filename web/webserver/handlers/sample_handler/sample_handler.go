package sample_handler

import (
	"log"
	"net/http"

	"scaffolding/webserver/models/sample"
	"scaffolding/webserver/response"
)

const (
	ItemCreated      = "item created"
	ItemExists       = "item already exists"
	ItemNotFound     = "item not found"
	ItemFound        = "item found"
	ItemsFound       = "items found"
	ItemsFindEmpty   = "no items to find"
	ItemUpdated      = "item updated"
	ItemDeleted      = "item deleted"
	ItemsDeleted     = "items deleted"
	ItemsDeleteEmpty = "no items to delete"

	FriendlyError = "an error occurred, please try again later"
)

func Get(writer http.ResponseWriter, request *http.Request) {
	results, error := sample.Get()

	if error == sample.ErrorNoResult {
		response.Send(writer, http.StatusOK, ItemNotFound, 0, nil)
		return
	} else if error != nil {
		log.Println(error)
		response.SendError(writer, http.StatusInternalServerError, FriendlyError)
		return
	}

	response.Send(writer, http.StatusOK, ItemFound, 1, sample.Results{results} )
}
