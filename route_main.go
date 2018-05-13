package main

import (
	"fmt"
	"kaiyan/data"
	"kaiyan/utils"
	"net/http"
)

//主页

func index(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Token")
	w.Header().Set("content-type", "application/json")
	w.Header().Set("Access-Control-Allow-Methods", "GET POST PUT DELETE")

	if r.Method == "OPTIONS" {
		return
	}
	token := r.Header.Get("Token")

	if !utils.AuthenticToken(token) {
		result := data.SuccessFail_("0", "Token验证失败")
		fmt.Fprintf(w, result)
		return
	}

}

//错误处理

func err(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Token")
	w.Header().Set("content-type", "application/json")
	w.Header().Set("Access-Control-Allow-Methods", "GET POST PUT DELETE")

	if r.Method == "OPTIONS" {
		return
	}
	token := r.Header.Get("Token")

	if !utils.AuthenticToken(token) {
		result := data.SuccessFail_("0", "Token验证失败")
		fmt.Fprintf(w, result)
		return
	}
}
