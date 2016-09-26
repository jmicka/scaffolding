package sample

import (
	"errors"
	"fmt"

	"scaffolding/webserver/database"
)

// Entity information
type Entity struct {
	Property string
}

type Results []Entity

// Errors
var (
	ErrorNoResult = errors.New("no result")
	ErrorExists   = errors.New("already exists")
	ErrorNotExist = errors.New("does not exist")
)

func Get() (Results, error) {
	var statement string = fmt.Sprintf("SELECT * FROM sp_sample_sproc(_auth_token := %v);", "uuid_generate_v4()")
	results := Results{}

	rows, error := database.Execute_Query(statement)
	if error != nil {
		return results, error
	}

	if rows != nil {
		for rows.Next() {
			var column string
			error := rows.Scan(&column)

			if error != nil {
				return results, error
			}

			row := Entity{ Property: column }
			results = append(results, row)
		}

		return results, error
	} else {
		return results, error
	}
}
