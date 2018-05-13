package main

import (
	"fmt"
	"kaiyan/data"
	"kaiyan/utils"

	"net/http"
)

//黑名单管理接口文档
//

//获取黑名单列表

func blackList(w http.ResponseWriter, r *http.Request) {
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

	ewysj := r.FormValue("ewysj")
	ewysj_ := utils.Decode(ewysj)
	uwyhe := r.FormValue("uwyhe")
	uwyhe_ := utils.Decode(uwyhe)

	result := data.BlackList_(ewysj_, uwyhe_)
	fmt.Fprintf(w, result)
}

//加入黑名单

func blackAdd(w http.ResponseWriter, r *http.Request) {
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

	cjrhw := r.FormValue("cjrhw")
	cjrhw_ := utils.Decode(cjrhw)
	chewj := r.FormValue("chewj")
	chewj_ := utils.Decode(chewj)

	result := data.BlackAdd_(cjrhw_, chewj_)
	fmt.Fprintf(w, result)
}

//移除黑名单用户

func blackDelete(w http.ResponseWriter, r *http.Request) {
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

	cjnek := r.FormValue("cjnek")
	cjnek_ := utils.Decode(cjnek)

	result := data.BlackDelete_(cjnek_)
	fmt.Fprintf(w, result)
}
