package main

import (
	"github.com/gin-gonic/gin"
	"goapi/controller"
	"goapi/usecase"
	"goapi/db"
	"goapi/repository"
)

func main() {
	server := gin.Default()

	dbConnection, err := db.ConnectDB()
	if err != nil {
		panic(err)
	}

	//repository layer
	ProductRepository := repository.NewProductRepository(dbConnection)

	//usecase layer
	ProductUsecase := usecase.NewProductUsecase(ProductRepository)

	//controllers layer
	ProductController := controller.NewProductController(ProductUsecase)

	server.GET("/ping", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H {
			"message": "pong",
			
		})
	})

	server.GET("/products", ProductController.GetProducts)
	server.POST("/product", ProductController.CreateProduct)
	server.GET("/product/:productId", ProductController.GetProductById)

	server.Run(":8000")

}