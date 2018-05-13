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

	result := data.SearchPopular_()
	fmt.Fprintf(w, result)
}

//获取搜索记录

func searchHistory(w http.ResponseWriter, r *http.Request) {
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

	jehcd := r.FormValue("jehcd")
	jehcd_ := utils.Decode(jehcd)
	fmt.Println(jehcd)

	result := data.SearchHistroy_(jehcd_)
	fmt.Fprintf(w, result)
}

//清除搜索记录

func searchDelete(w http.ResponseWriter, r *http.Request) {
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

	okshc := r.FormValue("okshc")

	result := data.Search_(okshc)
	fmt.Fprintf(w, result)
}

//检索相关用户

func searchUser(w http.ResponseWriter, r *http.Request) {
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

	hwjco := r.FormValue("hwjco")

	irksh := r.FormValue("irksh")
	irksh_ := utils.Decode(irksh)

	result := data.SearchUser_(hwjco, irksh_)
	fmt.Fprintf(w, result)
}

//检索相关专题

func searchSubject(w http.ResponseWriter, r *http.Request) {
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

	hwjco := r.FormValue("hwjco")

	irksh := r.FormValue("irksh")
	irksh_ := utils.Decode(irksh)

	result := data.SearchSubject_(hwjco, irksh_)
	fmt.Fprintf(w, result)
}

//检索相关文章

func searchArticle(w http.ResponseWriter, r *http.Request) {
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

	abehs := r.FormValue("abehs")

	jwkah := r.FormValue("jwkah")
	jwkah_ := utils.Decode(jwkah)

	result := data.SearchArticle_(abehs, jwkah_)
	fmt.Fprintf(w, result)
}
