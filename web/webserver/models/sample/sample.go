package sample

import (
	"scaffolding/webserver/database"
)

func Get() () {
	database.Acquire_Connection()
}
