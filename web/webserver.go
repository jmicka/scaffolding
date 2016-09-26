package main

import (
	"log"
	"runtime"

	"scaffolding/webserver/route"
	"scaffolding/webserver/routing_table"
	"scaffolding/webserver/database"
	"scaffolding/webserver/server"
)

func init() {
	log.SetFlags(log.Lshortfile)
	runtime.GOMAXPROCS(runtime.NumCPU())
}

func main() {

	// Connect to database
	database.Establish_Connection_Pool()

	// Load the routing table
	routing_table.Load()

	// Start the listener
	server.Run(route.Load_HTTP(), route.Load_HTTPS())
}
