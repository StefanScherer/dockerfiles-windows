package main

import (
	"fmt"
	"time"

	"github.com/StefanScherer/go-winio"
)

func main() {
	namedPipePath := "\\\\.\\pipe\\docker_engine"
	timeout := 5000 * time.Millisecond
	conn1, err1 := winio.DialPipe(namedPipePath, &timeout)
	fmt.Println("err1", err1)
	conn2, err2 := winio.DialPipe(namedPipePath, &timeout)
	fmt.Println("err2", err2)
	if conn1 != nil {
		conn1.Close()
	}
	if conn2 != nil {
		conn2.Close()
	}
}
