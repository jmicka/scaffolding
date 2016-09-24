package route

import (
	"net/http"

	"scaffolding/server/route/middleware/cors"
	"scaffolding/server/route/middleware/logrequest"
	"scaffolding/server/shared/router"

	"github.com/gorilla/context"
)

// Load the HTTP routes and middleware
func LoadHTTPS() http.Handler {
	//return middleware(routes())
	return middleware(router.Instance())
}

// Load the HTTPS routes and middleware
func LoadHTTP() http.Handler {
	//return middleware(routes())
	return middleware(router.Instance())

	// Uncomment this and comment out the line above to always redirect to HTTPS
	//return http.HandlerFunc(redirectToHTTPS)
}

// Optional method to make it easy to redirect from HTTP to HTTPS
func redirectToHTTPS(writer http.ResponseWriter, request *http.Request) {
	http.Redirect(writer, request, "https://"+request.Host, http.StatusMovedPermanently)
}

// *****************************************************************************
// Middleware
// *****************************************************************************

func middleware(handler http.Handler) http.Handler {
	// Log every request
	handler = logrequest.Handler(handler)

	// Cors for swagger-ui
	handler = cors.Handler(handler)

	// Clear handler for Gorilla Context
	handler = context.ClearHandler(handler)

	return handler
}
