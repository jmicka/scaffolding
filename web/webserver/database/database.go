package database

import (
	"fmt"
	"os"

	"github.com/jackc/pgx" // Postgres driver
)

var pool *pgx.ConnPool

func Acquire_Connection() error{
	conn, error := pool.Acquire()
	if error != nil {
		fmt.Fprintln(os.Stderr, "Error acquiring connection:", error)
		os.Exit(1)
	}
	defer pool.Release(conn)

	rows, _ := conn.Query("SELECT * FROM sp_sample_sproc(_auth_token := uuid_generate_v4());")

	for rows.Next() {
		var string string
		error := rows.Scan(&string)
		if error != nil {
			return error
		}
		fmt.Printf("%s\n", string)
	}

	return rows.Err()
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