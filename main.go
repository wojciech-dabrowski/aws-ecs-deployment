package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello %s!", r.URL.Path[1:])
	fmt.Println("HTTP call, Controller:", r.URL.Path[1:])
}

func main() {
	port := ":80"
	http.HandleFunc("/", handler)
	fmt.Println("Starting Restful services...")
	fmt.Printf("Using port:%s\n", port)
	err := http.ListenAndServe(port, nil)
	log.Print(err)
	errorHandler(err)
}

func errorHandler(err error) {
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
