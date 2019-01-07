package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"
	"time"
)

var (
	libkernel32                  = syscall.MustLoadDLL("kernel32")
	procGenerateConsoleCtrlEvent = libkernel32.MustFindProc("GenerateConsoleCtrlEvent")
)

func main() {
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs)
	go func() {
		s := <-sigs
		log.Printf("Got signal %v", s)
		os.Exit(0)
	}()

	r, _, err := procGenerateConsoleCtrlEvent.Call(syscall.CTRL_C_EVENT, uintptr(0))
	if r == 0 {
		log.Fatalf("Error sending CTRL_C_EVENT: %v", err)
	}

	time.Sleep(time.Second)
	log.Printf("Exiting normally")
}
