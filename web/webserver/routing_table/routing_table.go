package routing_table

import (
	"scaffolding/webserver/router"

	"scaffolding/webserver/handlers/error_handler"
	"scaffolding/webserver/handlers/index_handler"
	"scaffolding/webserver/handlers/sample_handler"
	"scaffolding/webserver/handlers/static_handler"
)

func init() {
	// This does not work for routes where the path matches, but the method does not (on HEAD and OPTIONS need to check)
	// https://github.com/julienschmidt/httprouter/issues/13
//	var 405_response http.HandlerFunc = error_handler.Generate(405)
	router.Instance().HandleMethodNotAllowed = true
	router.Instance().MethodNotAllowed = error_handler.Generate(405)

//	var 404_response http.HandlerFunc = error_handler.Generate(404)
	router.Instance().NotFound = error_handler.Generate(404)

	// Required so the trailing slash is not redirected
	router.Instance().RedirectTrailingSlash = false

	// Serve static files, no directory browsing
}

func Load() {
	router.Get("/", index_handler.Get)
	router.Get("/api/v1/sample", sample_handler.Get)
	router.Get("/static/*filepath", static_handler.Get_File)
}