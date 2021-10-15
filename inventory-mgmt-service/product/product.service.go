package product

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"
	"strings"

	"github.com/inventoryservice/cors"
	"golang.org/x/net/websocket"
)

const productsPath = "products"

// SetupRoutes :
func SetupRoutes(apiBasePath string) { 
	handleProducts := http.HandlerFunc(productsHandler)
	handleProduct := http.HandlerFunc(productHandler)
	http.Handle("/websocket", websocket.Handler(productSocket))
	http.Handle(fmt.Sprintf("%s/%s", apiBasePath, productsPath), cors.Middleware(handleProducts))
	http.Handle(fmt.Sprintf("%s/%s/", apiBasePath, productsPath), cors.Middleware(handleProduct))
}

func productsHandler(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
		case http.MethodGet: 
			productsList, err := getProductList()
			if err != nil {
				w.WriteHeader(http.StatusInternalServerError)
				return
			}
			productsJson, err := json.Marshal(productsList)
			if err != nil {
				w.WriteHeader(http.StatusInternalServerError)
				return
			}
			w.Write(productsJson)
		case http.MethodPost:
			var newProduct Product
			bodyBytes, err := ioutil.ReadAll(r.Body)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				return
			}
			err = json.Unmarshal(bodyBytes, &newProduct)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				return 
			}
			if newProduct.ProductID != 0 {
				w.WriteHeader(http.StatusBadRequest)
				return
			}
			err = insertProduct(newProduct)
			if err != nil {
				w.WriteHeader(http.StatusInternalServerError)
				return
			}
			w.WriteHeader(http.StatusCreated)
			return
		case http.MethodOptions:
			return
	}
}

func productHandler(w http.ResponseWriter, r *http.Request) {
	pathVariable := strings.TrimPrefix(r.URL.Path, "/api/products/")
	productID, err := strconv.Atoi(pathVariable)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}
	
	product, err := getProduct(productID)
	if err != nil {
		switch err {
			case sql.ErrNoRows:
				w.WriteHeader(http.StatusNotFound)
			default:
				w.WriteHeader(http.StatusInternalServerError)
		}
		return
	}
	if product == nil {
		w.WriteHeader(http.StatusNotFound)
		return
	}

	switch r.Method {
		case http.MethodGet: 
			productJSON, err := json.Marshal(product)
			if err != nil {
				w.WriteHeader(http.StatusInternalServerError)
				return
			}
			w.Write(productJSON)
		case http.MethodPut:
			var updatedProduct Product
			bodyBytes, err := ioutil.ReadAll(r.Body)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				return
			}
			err = json.Unmarshal(bodyBytes, &updatedProduct)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
			}
			if updatedProduct.ProductID != productID {
				w.WriteHeader(http.StatusBadRequest)
				return
			}
			err = updateProduct(updatedProduct)
			if err != nil {
				w.WriteHeader(http.StatusInternalServerError)
				return
			}
			w.WriteHeader(http.StatusOK)
			return
		case http.MethodDelete:
			removeProduct(productID)
		case http.MethodOptions:
			return
		default:
			w.WriteHeader(http.StatusMethodNotAllowed)
			return
	}
}