package main

import (
	"fmt"
	"kaiyan/data"
	"net/http"
)

//获取作者列表

func authorList(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	utydk := r.FormValue("utydk")
	utydk_ := decode(utydk)
	geacg := r.FormValue("geacg")
	geacg_ := decode(geacg)
	iicje := r.FormValue("iicje")
	iicje_ := decode(iicje)

	var result string

	switch utydk_ {
	case "1":
		result = data.AuthorListFollow(geacg_, iicje_)
	case "2":
		result = data.AuthorListFollowAll(geacg_, iicje_)
	case "3":
		result = data.AuthorListFans(geacg_, iicje_)
	default:
		result = data.SuccessFail_("wrong code")
	}
	fmt.Fprintf(w, result)
}

//获取作者排行榜

func authorListRanking(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	jeheh := r.FormValue("jeheh")
	jeheh_ := decode(jeheh)

	var result string

	result = data.AuthorListRanking_(jeheh_)
	fmt.Fprintf(w, result)
}
