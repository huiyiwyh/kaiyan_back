package main

import (
	"fmt"
	"kaiyan/data"
	"net/http"
)

//搜索接口文档
//

//获取热门搜索

func searchPopular(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	var result string
	result = data.SearchPopular_()
	fmt.Fprintf(w, result)
}

//获取搜索记录

func searchHistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	jehcd := r.FormValue("jehcd")
	jehcd_ := decode(jehcd)
	fmt.Println(jehcd)

	var result string
	result = data.SearchHistroy_(jehcd_)
	fmt.Fprintf(w, result)
}

//清除搜索记录

func searchDelete(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	uejsh := r.FormValue("uejsh")
	uejsh_ := decode(uejsh)
	yehjc := r.FormValue("yehjc")
	yehjc_ := decode(yehjc)

	var result string
	result = data.SearchDelete_(uejsh_, yehjc_)
	fmt.Fprintf(w, result)
}

//初步检索

func search(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	okshc := r.FormValue("okshc")
	okshc_ := decode(okshc)

	var result string
	result = data.Search_(okshc_)
	fmt.Fprintf(w, result)
}

//检索相关用户

func searchUser(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hwjco := r.FormValue("hwjco")
	hwjco_ := decode(hwjco)
	irksh := r.FormValue("irksh")
	irksh_ := decode(irksh)

	var result string
	result = data.SearchUser_(hwjco_, irksh_)
	fmt.Fprintf(w, result)
}

//检索相关专题

func searchSubject(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hwjco := r.FormValue("hwjco")
	hwjco_ := decode(hwjco)
	irksh := r.FormValue("irksh")
	irksh_ := decode(irksh)

	var result string
	result = data.SearchSubject_(hwjco_, irksh_)
	fmt.Fprintf(w, result)
}

//检索相关文章

func searchArticle(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	abehs := r.FormValue("abehs")
	abehs_ := decode(abehs)
	jwkah := r.FormValue("jwkah")
	jwkah_ := decode(jwkah)

	var result string
	result = data.SearchArticle_(abehs_, jwkah_)
	fmt.Fprintf(w, result)
}
