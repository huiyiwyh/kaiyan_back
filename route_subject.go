package main

import (
	"fmt"
	"kaiyan/data"
	"net/http"
)

//获取专题列表

func subjectList(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	vhdes := r.FormValue("vhdes")
	vhdes_ := decode(vhdes)

	var result string

	switch vhdes_ {
	case "1":
		wyejs := r.FormValue("wyejs")
		wyejs_ := decode(wyejs)
		result = data.SubjectListTime(wyejs_)
	case "2":
		wyejs := r.FormValue("wyejs")
		wyejs_ := decode(wyejs)
		result = data.SubjectListNum(wyejs_)
	case "3":
		kvjed := r.FormValue("kvjed")
		kvjed_ := decode(kvjed)
		result = data.SubjectListAccount(kvjed_)
	}
	fmt.Fprintf(w, result)
}

//获取关注专题列表

func subjectListFocus(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	budhs := r.FormValue("budhs")
	budhs_ := decode(budhs)
	tehsc := r.FormValue("tehsc")
	tehsc_ := decode(tehsc)

	var result string
	result = data.SubjectListFocus_(budhs_, tehsc_)
	fmt.Fprintf(w, result)
}

//获取专题详情

func subjectListDetails(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	grbfs := r.FormValue("grbfs")
	grbfs_ := decode(grbfs)
	ckege := r.FormValue("ckege")
	ckege_ := decode(ckege)

	var result string
	result = data.SubjectListDetails_(grbfs_, ckege_)
	fmt.Fprintf(w, result)
}

//新建专题

func subjectAdd(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ythcs := r.FormValue("ythcs")
	ythcs_ := decode(ythcs)
	utyeh := r.FormValue("utyeh")
	utyeh_ := decode(utyeh)
	ertqh := r.FormValue("ertqh")
	ertqh_ := decode(ertqh)
	oiyhx := r.FormValue("oiyhx")
	oiyhx_ := decode(oiyhx)
	vjmsk := r.FormValue("vjmsk")
	vjmsk_ := decode(vjmsk)

	var result string
	result = data.SubjectAdd_(ythcs_, utyeh_, ertqh_, oiyhx_, vjmsk_)
	fmt.Fprintf(w, result)
}

//删除专题

func subjectDelete(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	rejcs := r.FormValue("rejcs")
	rejcs_ := decode(rejcs)

	var result string
	result = data.SubjectDelete_(rejcs_)
	fmt.Fprintf(w, result)
}

//新建专题标签

func subjectUploadSymbol(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	tjnsv := r.FormValue("tjnsv")
	tjnsv_ := decode(tjnsv)

	var result string
	result = data.SubjectUploadSymbol_(tjnsv_)
	fmt.Fprintf(w, result)
}

//关注专题

func subjectFocus(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	grbfs := r.FormValue("grbfs")
	grbfs_ := decode(grbfs)
	ckege := r.FormValue("ckege")
	ckege_ := decode(ckege)
	uiksh := r.FormValue("uiksh")
	uiksh_ := decode(uiksh)

	var result string
	result = data.SubjectFocus_(grbfs_, ckege_, uiksh_)
	fmt.Fprintf(w, result)
}

//取消关注专题

func subjectCancleFocus(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	grbfs := r.FormValue("grbfs")
	grbfs_ := decode(grbfs)
	ckege := r.FormValue("ckege")
	ckege_ := decode(ckege)
	uiksh := r.FormValue("uiksh")
	uiksh_ := decode(uiksh)

	var result string
	result = data.SubjectCancleFocus_(grbfs_, ckege_, uiksh_)
	fmt.Fprintf(w, result)
}

//文章投稿

func articleContribute(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ychsw := r.FormValue("ychsw")
	ychsw_ := decode(ychsw)
	hsyce := r.FormValue("hsyce")
	hsyce_ := decode(hsyce)
	anscj := r.FormValue("anscj")
	anscj_ := decode(anscj)
	rywjc := r.FormValue("rywjc")
	rywjc_ := decode(rywjc)

	var result string
	result = data.ArticleContribute_(ychsw_, hsyce_, anscj_, rywjc_)
	fmt.Fprintf(w, result)
}

//获取未投稿文章
func articleNotContribute(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hskcu := r.FormValue("hskcu")
	hskcu_ := decode(hskcu)

	var result string
	result = data.ArticleNotContribute_(hskcu_)
	fmt.Fprintf(w, result)
}

//获取待审核文章

func articleNotExamine(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ueysj := r.FormValue("ueysj")
	ueysj_ := decode(ueysj)

	var result string
	result = data.ArticleNotExamine_(ueysj_)
	fmt.Fprintf(w, result)
}

//管理待审核文章
func articleExamine(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	eshhd := r.FormValue("eshhd")
	eshhd_ := decode(eshhd)
	twrch := r.FormValue("twrch")
	twrch_ := decode(twrch)
	imvah := r.FormValue("imvah")
	imvah_ := decode(imvah)
	tafvm := r.FormValue("tafvm")
	tafvm_ := decode(tafvm)
	uehst := r.FormValue("uehst")
	uehst_ := decode(uehst)

	var result string
	switch twrch_ {
	case "1":
		result = data.ArticleExamine_ac(eshhd_, twrch_, imvah_, tafvm_, uehst_)
	case "0":
		result = data.ArticleExamine_fa(eshhd_, twrch_, imvah_, tafvm_, uehst_)
	default:
		result = data.SuccessFail_("wrong code")
	}
	fmt.Fprintf(w, result)
}
