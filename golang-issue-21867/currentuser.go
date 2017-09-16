package main

import (
	"fmt"
	"os/user"
)

func main() {
	fmt.Println("Hello")
	currentuser, err := user.Current()
	if err == nil {
		fmt.Println("Current user", currentuser)
	} else {
		fmt.Println("Error", err)
	}
}
