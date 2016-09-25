package database

import (
	"fmt"
	"os"

	"github.com/jackc/pgx" // Postgres driver
)

var pool *pgx.ConnPool

// Connect to the database
func Connect() {

	var err error
	pool, err = pgx.NewConnPool(read_db_configuration())
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to establish connection pool to database: %v\n", err)
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