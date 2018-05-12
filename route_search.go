package main

import (
	"fmt"
	"kaiyan/data"
	"kaiyan/utils"

	"net/http"
)

//搜索接口文档
//

//获取热门搜索

func searchPopular(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	result := data.SearchPopular_()
	fmt.Fprintf(w, result)
}

//获取搜索记录

func searchHistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	jehcd := r.FormValue("jehcd")
	jehcd_ := utils.Decode(jehcd)
	fmt.Println(jehcd)

	result := data.SearchHistroy_(jehcd_)
	fmt.Fprintf(w, result)
}

//清除搜索记录

func searchDelete(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	uejsh := r.FormValue("uejsh")
	uejsh_ := utils.Decode(uejsh)
	yehjc := r.FormValue("yehjc")
	yehjc_ := utils.Decode(yehjc)

	result := data.SearchDelete_(uejsh_, yehjc_)
	fmt.Fprintf(w, result)
}

//初步检索

func search(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	okshc := r.FormValue("okshc")
	okshc_ := utils.Decode(okshc)

	result := data.Search_(okshc_)
	fmt.Fprintf(w, result)
}

//检索相关用户

func searchUser(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hwjco := r.FormValue("hwjco")
	hwjco_ := utils.Decode(hwjco)
	irksh := r.FormValue("irksh")
	irksh_ := utils.Decode(irksh)

	result := data.SearchUser_(hwjco_, irksh_)
	fmt.Fprintf(w, result)
}

//检索相关专题

func searchSubject(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hwjco := r.FormValue("hwjco")
	hwjco_ := utils.Decode(hwjco)
	irksh := r.FormValue("irksh")
	irksh_ := utils.Decode(irksh)

	result := data.SearchSubject_(hwjco_, irksh_)
	fmt.Fprintf(w, result)
}

//检索相关文章

func searchArticle(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	abehs := r.FormValue("abehs")
	abehs_ := utils.Decode(abehs)
	jwkah := r.FormValue("jwkah")
	jwkah_ := utils.Decode(jwkah)

	result := data.SearchArticle_(abehs_, jwkah_)
	fmt.Fprintf(w, result)
}
