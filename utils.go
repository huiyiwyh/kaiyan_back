package main

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	_ "github.com/go-sql-driver/mysql"
)

type Configuration struct {
	Address      string
	ReadTimeout  int64
	WriteTimeout int64
	Static       string
}

var config Configuration
var logger *log.Logger

// Convenience function for printing to stdout
func p(a ...interface{}) {
	fmt.Println(a)
}

func init() {
	file, err := os.Open("etc/config.json")
	defer file.Close()
	data, err := ioutil.ReadAll(file)
	if err != nil {
		logger.Fatalln("Failed to ReadFile", err)
	}

	config = Configuration{}
	err = json.Unmarshal(data, &config)
	if err != nil {
		logger.Fatalln("Failed to Unmarshal log file", err)
	}
}

// Convenience function to redirect to the error message page
// func error_message(writer http.ResponseWriter, request *http.Request, msg string) {
// 	url := []string{"/err?msg=", msg}
// 	http.Redirect(writer, request, strings.Join(url, ""), 302)
// }

// Checks if the user is logged in and has a session, if not err is not nil
// func session(writer http.ResponseWriter, request *http.Request) (sess data.Session, err error) {
// 	cookie, err := request.Cookie("_cookie")
// 	if err == nil {
// 		sess = data.Session{Uuid: cookie.Value}
// 		if ok, _ := sess.Check(); !ok {
// 			err = errors.New("Invalid session")
// 		}
// 	}
// 	return
// }

// for logging
func info(args ...interface{}) {
	logger.SetPrefix("INFO ")
	logger.Println(args...)
}

func danger(args ...interface{}) {
	logger.SetPrefix("ERROR ")
	logger.Println(args...)
}

func warning(args ...interface{}) {
	logger.SetPrefix("WARNING ")
	logger.Println(args...)
}

// version
func version() string {
	return "0.3"
}

//decode

func decode(encodeString string) string {
	decodeBytes, err := base64.StdEncoding.DecodeString(encodeString)
	if err != nil {
		log.Println(err)
	}
	return string(decodeBytes)
}

//encode

func encode(decodeString string) string {
	decodeBytes := []byte(decodeString)
	encodeString := base64.StdEncoding.EncodeToString(decodeBytes)
	return encodeString
}
