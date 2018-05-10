package main

import (
	"fmt"
	"kaiyan/data"
	"net/http"
)

//黑名单管理接口文档
//

//获取黑名单列表

func blackList(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ewysj := r.FormValue("ewysj")
	ewysj_ := decode(ewysj)
	uwyhe := r.FormValue("uwyhe")
	uwyhe_ := decode(uwyhe)

	var result string
	result = data.BlackList_(ewysj_, uwyhe_)
	fmt.Fprintf(w, result)
}

//加入黑名单

func blackAdd(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	cjrhw := r.FormValue("cjrhw")
	cjrhw_ := decode(cjrhw)
	chewj := r.FormValue("chewj")
	chewj_ := decode(chewj)

	var result string
	result = data.BlackAdd_(cjrhw_, chewj_)
	fmt.Fprintf(w, result)
}

//移除黑名单用户

func blackDelete(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	cjnek := r.FormValue("cjnek")
	cjnek_ := decode(cjnek)

	var result string
	result = data.BlackDelete_(cjnek_)
	fmt.Fprintf(w, result)
}
