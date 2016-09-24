package controller

import (
	"net/http"
	"strings"

	"scaffolding/server/shared/router"
)

func init() {
	// Required so the trailing slash is not redirected
	router.Instance().RedirectTrailingSlash = false

	// Serve static files, no directory browsing
	router.Get("/static/*filepath", Static)
}

// Static maps static files
func Static(writer http.ResponseWriter, request *http.Request) {
	// Disable listing directories
	if strings.HasSuffix(request.URL.Path, "/") {
		Error404(writer, request)
		return
	}
	http.ServeFile(writer, request, request.URL.Path[1:])
}