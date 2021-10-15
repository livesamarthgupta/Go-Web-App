package product

import (
	"context"
	"log"
	"time"

	"github.com/inventoryservice/database"
)


func getProduct(productID int) (*Product, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 15 * time.Second)
	defer cancel()
	result := database.DBConn.QueryRowContext(ctx, `SELECT productId, 
		manufacturer, 
		sku, 
		upc, 
		pricePerUnit, 
		quantityOnHand, 
		productName 
		FROM inventorydb.products
		WHERE productId = $1;`, productID)

	product := &Product{}
	err := result.Scan(&product.ProductID, 
		&product.Manufacturer, 
		&product.Sku, 
		&product.Upc, 
		&product.PricePerUnit, 
		&product.QuantityOnHand,
		&product.ProductName,
	)
	if err != nil {
		return nil, err
	}

	return product, nil
}

func getProductList() ([]Product, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 15 * time.Second)
	defer cancel()
	results, err := database.DBConn.QueryContext(ctx, `SELECT productId, 
		manufacturer, 
		sku, 
		upc, 
		pricePerUnit, 
		quantityOnHand, 
		productName 
		FROM inventorydb.products;
	`)
	if err != nil {
		return nil, err
	}
	defer results.Close()
	products := make([]Product, 0)
	for results.Next() {
		var product Product
		results.Scan(&product.ProductID, 
			&product.Manufacturer, 
			&product.Sku, 
			&product.Upc, 
			&product.PricePerUnit, 
			&product.QuantityOnHand,
			&product.ProductName,
		)
		products = append(products, product)
	}

	return products, nil
}

func updateProduct(product Product) error {
	ctx, cancel := context.WithTimeout(context.Background(), 15 * time.Second)
	defer cancel()
	_, err := database.DBConn.ExecContext(ctx, `UPDATE inventorydb.products SET
		manufacturer=$1,
		sku=$2,
		upc=$3, 
		pricePerUnit=$4, 
		quantityOnHand=$5, 
		productName=$6
		WHERE productId=$7`,
		product.Manufacturer,
		product.Sku,
		product.Upc,
		product.PricePerUnit,
		product.QuantityOnHand,
		product.ProductName,
		product.ProductID,
	)
	if err != nil {
		return err
	}
	return nil
}

func insertProduct(product Product) error {
	ctx, cancel := context.WithTimeout(context.Background(), 15 * time.Second)
	defer cancel()
	_, err := database.DBConn.ExecContext(ctx, `INSERT INTO inventorydb.products 
		(manufacturer,
		sku,
		upc, 
		pricePerUnit, 
		quantityOnHand, 
		productName)
		VALUES ($1, $2, $3, $4, $5, $6)`,
		product.Manufacturer,
		product.Sku,
		product.Upc,
		product.PricePerUnit,
		product.QuantityOnHand,
		product.ProductName,
	)
	if err != nil {
		return err
	}
	return nil
}

func removeProduct(productID int) error {
	ctx, cancel := context.WithTimeout(context.Background(), 15 * time.Second)
	defer cancel()
	_, err := database.DBConn.ExecContext(ctx, `DELETE FROM inventorydb.products WHERE productId = $1`, productID)
	if err != nil {
		return err
	}
	return nil
}

func GetTopTenProducts() ([]Product, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()
	results, err := database.DBConn.QueryContext(ctx, `SELECT 
	productId, 
	manufacturer, 
	sku, 
	upc, 
	pricePerUnit, 
	quantityOnHand, 
	productName 
	FROM inventorydb.products ORDER BY quantityOnHand DESC LIMIT 10;
	`)
	if err != nil {
		log.Println(err.Error())
		return nil, err
	}
	defer results.Close()
	products := make([]Product, 0)
	for results.Next() {
		var product Product
		results.Scan(&product.ProductID,
			&product.Manufacturer,
			&product.Sku,
			&product.Upc,
			&product.PricePerUnit,
			&product.QuantityOnHand,
			&product.ProductName)

		products = append(products, product)
	}
	return products, nil
}