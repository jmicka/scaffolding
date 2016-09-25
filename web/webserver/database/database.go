package database

import (
	"fmt"
	"os"

	"github.com/jackc/pgx" // Postgres driver
)

var pool *pgx.ConnPool

func Execute_Query(statement string) (*pgx.Rows, error) {
	conn, error := pool.Acquire()
	if error != nil {
		fmt.Fprintln(os.Stderr, "Error acquiring connection:", error)
		return nil, error
	}
	defer pool.Release(conn)

	rows, _ := conn.Query(statement)

	return rows, nil
}

// Connect to the database
func Establish_Connection_Pool() {

	var error error
	pool, error = pgx.NewConnPool(read_db_configuration())
	if error != nil {
		fmt.Fprintf(os.Stderr, "Unable to establish connection pool to database: %v\n", error)
		os.Exit(1)
	}
}

func read_db_configuration() pgx.ConnPoolConfig {
	var config pgx.ConnPoolConfig

	config.Host = os.Getenv("PG_HOST")
	if config.Host == "" {
		config.Host = "localhost"
	}
	config.User = os.Getenv("PG_USER")
	config.Password = os.Getenv("PG_PASSWORD")
	config.Database = os.Getenv("PG_DATABASE")

	return config
}