package main

import (
	"fmt"
	"kaiyan/data"
	"kaiyan/utils"

	"net/http"
)

//获取作者列表

func authorList(w http.ResponseWriter, r *http.Request) {
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

	utydk := r.FormValue("utydk")
	utydk_ := utils.Decode(utydk)
	geacg := r.FormValue("geacg")
	geacg_ := utils.Decode(geacg)
	iicje := r.FormValue("iicje")
	iicje_ := utils.Decode(iicje)

	var result string
	switch utydk_ {
	case "1":
		result = data.AuthorListFollow_(geacg_, iicje_)
	case "2":
		result = data.AuthorListFollowAll_(geacg_, iicje_)
	case "3":
		result = data.AuthorListFans_(geacg_, iicje_)
	default:
		result = data.SuccessFail_("0", "wrong code")
	}
	fmt.Fprintf(w, result)
}

//获取作者排行榜

func authorListRanking(w http.ResponseWriter, r *http.Request) {
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

	jeheh := r.FormValue("jeheh")
	jeheh_ := utils.Decode(jeheh)

	result := data.AuthorListRanking_(jeheh_)
	fmt.Fprintf(w, result)
}
