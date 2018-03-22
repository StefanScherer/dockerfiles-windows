package main

import (
	"fmt"
	"os/user"
)

func main() {
	fmt.Println("Hello")
	current, err := user.Current()
	if err == nil {
		fmt.Printf("Current user %+v\n", current)
	} else {
		fmt.Println("Error", err)
	}
}
