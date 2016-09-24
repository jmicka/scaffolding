package main

import (
	"encoding/json"
    "log"
    "os"
	"runtime"

    "scaffolding/server/controller"
	"scaffolding/server/route"
    "scaffolding/server/shared/jsonconfig"
	"scaffolding/server/shared/server"
)

func init() {
	log.SetFlags(log.Lshortfile)
	runtime.GOMAXPROCS(runtime.NumCPU())
}

func main() {
	// Load the configuration file
	jsonconfig.Load("config"+string(os.PathSeparator)+"config.json", config)

	// Load the controller routes
	controller.Load()

	// Start the listener
	server.Run(route.LoadHTTP(), route.LoadHTTPS(), config.Server)
}

// *****************************************************************************
// Application Settings
// *****************************************************************************

var config = &configuration{}

type configuration struct {
	Server   server.Server  `json:"Server"`
}

// ParseJSON unmarshals bytes to structs
func (c *configuration) ParseJSON(b []byte) error {
	return json.Unmarshal(b, &c)
}