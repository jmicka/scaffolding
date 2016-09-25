package sample_handler

import (
	"net/http"

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
	response.Send(writer, http.StatusOK, ItemFound, 0, nil)
}
