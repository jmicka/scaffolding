package sample

import (
	"errors"

	"scaffolding/webserver/database"
)

// Entity information
type Entity struct {
	String string
}

type Results []Entity

// Errors
var (
	ErrorNoResult = errors.New("no result")
	ErrorExists   = errors.New("already exists")
	ErrorNotExist = errors.New("does not exist")
)

func Get() (Entity, error) {
	var statement string = "SELECT * FROM sp_sample_sproc(_auth_token := uuid_generate_v4());"
	var return_value Entity
	rows, error := database.Execute_Query(statement)

	if rows != nil {
		for rows.Next() {
			var string string
			error := rows.Scan(&string)

			if error != nil {
				return return_value, error
			}
			return_value.String = string;
		}

		return return_value, error
	} else {
		return return_value, error
	}
}
