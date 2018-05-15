package utils

import (
	"encoding/base64"
	"fmt"
	"log"
	"os"
	"time"

	jwt "github.com/dgrijalva/jwt-go"
)

var hmacSampleSecret = []byte("Welcome to kaiyan")

//base64解密

func Decode(encodeString string) string {
	decodeBytes, err := base64.StdEncoding.DecodeString(encodeString)
	if err != nil {
		log.Println(err)
	}
	return string(decodeBytes)
}

//base64加密

func Encode(decodeString string) string {
	decodeBytes := []byte(decodeString)
	encodeString := base64.StdEncoding.EncodeToString(decodeBytes)
	return encodeString
}

//查找目录是否存在
func PathExists(path string) (bool, error) {
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
func CreateDir(dir string) {
	var err error
	exist, err := PathExists(dir)
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

//创建Token

func CreateToken() string {

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"nbf": time.Date(2015, 10, 10, 12, 0, 0, 0, time.UTC).Unix(),
	})

	tokenString, err := token.SignedString(hmacSampleSecret)
	if err != nil {
		log.Println(err)
	}

	return tokenString
}

func AuthenticToken(tokenString string) bool {

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
