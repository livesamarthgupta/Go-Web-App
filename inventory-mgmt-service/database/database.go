package database

import (
	"database/sql"
	"fmt"
	"log"
	"time"
)

var DBConn *sql.DB

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	dbname   = "samarth"
  )

func SetupDatabase() {

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s dbname=%s sslmode=disable",
    host, port, user, dbname)
	
	var err error
	DBConn, err = sql.Open("postgres", psqlInfo)
	if err != nil {
		log.Fatal(err)
	}
	DBConn.SetMaxIdleConns(4)
	DBConn.SetMaxOpenConns(4)
	DBConn.SetConnMaxLifetime(60 * time.Second)
	err = DBConn.Ping()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Connection Successful!")
}