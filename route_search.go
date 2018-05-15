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

func searchListPopular(w http.ResponseWriter, r *http.Request) {
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

	result := data.SearchListPopular_()
	fmt.Fprintf(w, result)
}

//获取搜索记录

func searchListHistory(w http.ResponseWriter, r *http.Request) {
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

	result := data.SearchListHistroy_(jehcd_)
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

//清除账户搜索记录

func searchDeleteAccount(w http.ResponseWriter, r *http.Request) {
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

	yenkc := r.FormValue("yenkc")
	yenkc_ := utils.Decode(yenkc)

	result := data.SearchDeleteAccount_(yenkc_)
	fmt.Fprintf(w, result)
}

//初步检索

func searchList(w http.ResponseWriter, r *http.Request) {
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
	kciha := r.FormValue("kciha")
	kciha_ := utils.Decode(kciha)

	result := data.SearchList_(okshc, kciha_)
	fmt.Fprintf(w, result)
}

//检索相关用户

func searchListUser(w http.ResponseWriter, r *http.Request) {
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

func searchListSubject(w http.ResponseWriter, r *http.Request) {
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

	iyscf := r.FormValue("iyscf")

	wqefs := r.FormValue("wqefs")
	wqefs_ := utils.Decode(wqefs)

	result := data.SearchSubject_(iyscf, wqefs_)
	fmt.Fprintf(w, result)
}

//检索相关文章

func searchListArticle(w http.ResponseWriter, r *http.Request) {
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
