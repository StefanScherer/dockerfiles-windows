package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	fmt.Println("Proudly serving content on port", port)
	panic(http.ListenAndServe(fmt.Sprintf(":%s", port), http.FileServer(http.Dir("."))))
}
