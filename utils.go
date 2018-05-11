package main

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"time"

	jwt "github.com/dgrijalva/jwt-go"
)

var hmacSampleSecret = []byte("Welcome to kaiyan")

type Configuration struct {
	Address      string
	ReadTimeout  int64
	WriteTimeout int64
	Static       string
}

var config Configuration
var logger *log.Logger

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

// 版本
func version() string {
	return "0.4"
}

//base64解密

func decode(encodeString string) string {
	decodeBytes, err := base64.StdEncoding.DecodeString(encodeString)
	if err != nil {
		log.Println(err)
	}
	return string(decodeBytes)
}

//base64加密

func encode(decodeString string) string {
	decodeBytes := []byte(decodeString)
	encodeString := base64.StdEncoding.EncodeToString(decodeBytes)
	return encodeString
}

//查找目录是否存在
func pathExists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return false, err
}

//创建目录
func createDir(dir string) {
	var err error
	exist, err := pathExists(dir)
	if err != nil {
		log.Println(err)
	}
	if exist {
		log.Println(err)
	}
	// 创建文件夹
	err = os.MkdirAll(dir, os.ModePerm)
	if err != nil {
		log.Println(err)
	}
}

func createToken(info string) string {
	hmacSampleSecret := []byte(info)

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"name": info,
		"nbf":  time.Date(2015, 10, 10, 12, 0, 0, 0, time.UTC).Unix(),
	})

	tokenString, err := token.SignedString(hmacSampleSecret)
	if err != nil {
		log.Println(err)
	}

	return tokenString
}

func authenticToken(tokenString string) bool {

	token, _ := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}

		return hmacSampleSecret, nil
	})

	if _, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		return true
	} else {
		return false
	}
}
