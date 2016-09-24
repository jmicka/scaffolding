package controller

import (
	"net/http"

	"scaffolding/server/shared/response"
	"scaffolding/server/shared/router"
)

// Routes
func init() {
	router.Get("/api/v1/sample", get_sample)
}

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

func get_sample(writer http.ResponseWriter, request *http.Request) {
	response.Send(writer, http.StatusOK, ItemFound, 0, nil)
}
