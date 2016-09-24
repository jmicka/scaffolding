package logrequest

import (
	"fmt"
	"net/http"
	"time"
)

// Handler will log the HTTP requests
func Handler(next http.Handler) http.Handler {
	return http.HandlerFunc(func(writer http.ResponseWriter, request *http.Request) {
		fmt.Println(time.Now().Format("2006-01-02 03:04:05 PM"), request.RemoteAddr, request.Method, request.URL)
		next.ServeHTTP(writer, request)
	})
}