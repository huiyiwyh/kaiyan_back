package main

import (
	"fmt"
	"time"
)

func update() {
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	fmt.Println(tm)

}
