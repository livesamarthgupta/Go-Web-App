package main

import (
	"net/http"

	"github.com/inventoryservice/database"
	"github.com/inventoryservice/product"
	"github.com/inventoryservice/receipt"
	_ "github.com/lib/pq"
)

// // Handler
// type fooHandler struct {
// 	message string
// }
// func (f *fooHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
// 	w.Write([]byte(f.message))
// }

// // FunctionHandler
// func handlerFunc(w http.ResponseWriter, r *http.Request) {
// 	w.Write([]byte("Hello World from function!"))
// }

const apiBasePath = "/api"
func main() {
	// http.Handle("/foo", &fooHandler{message: "Hello World from handler!"})
	// http.HandleFunc("/bar", handlerFunc)
	database.SetupDatabase()
	receipt.SetupRoutes(apiBasePath)
	product.SetupRoutes(apiBasePath)
	http.ListenAndServe(":5000", nil) // this must come after all handlers are assigned
}