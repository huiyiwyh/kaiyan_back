package main

import (
	"encoding/base64"
	"fmt"
	"io/ioutil"
	"kaiyan/data"
	"kaiyan/utils"
	"strings"
	"time"

	"net/http"
)

//获取专题列表

func subjectList(w http.ResponseWriter, r *http.Request) {
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

	vhdes := r.FormValue("vhdes")
	vhdes_ := utils.Decode(vhdes)

	var result string
	switch vhdes_ {
	case "1":
		wyejs := r.FormValue("wyejs")
		wyejs_ := utils.Decode(wyejs)
		result = data.SubjectListTime(wyejs_)
	case "2":
		wyejs := r.FormValue("wyejs")
		wyejs_ := utils.Decode(wyejs)
		result = data.SubjectListNum(wyejs_)
	case "3":
		kvjed := r.FormValue("kvjed")
		kvjed_ := utils.Decode(kvjed)
		result = data.SubjectListAccount(kvjed_)
	}
	fmt.Fprintf(w, result)
}

//获取关注专题列表

func subjectListFocus(w http.ResponseWriter, r *http.Request) {
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

	budhs := r.FormValue("budhs")
	budhs_ := utils.Decode(budhs)
	tehsc := r.FormValue("tehsc")
	tehsc_ := utils.Decode(tehsc)

	result := data.SubjectListFocus_(budhs_, tehsc_)
	fmt.Fprintf(w, result)
}

//获取专题详情

func subjectListDetails(w http.ResponseWriter, r *http.Request) {
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

	grbfs := r.FormValue("grbfs")
	grbfs_ := utils.Decode(grbfs)
	ckege := r.FormValue("ckege")
	ckege_ := utils.Decode(ckege)

	result := data.SubjectListDetails_(grbfs_, ckege_)
	fmt.Fprintf(w, result)
}

//新建专题

func subjectAdd(w http.ResponseWriter, r *http.Request) {
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

	r.ParseMultipartForm(32 << 20)

	var ythcs []string
	var utyeh []string
	var ertqh []string
	var vjmsk []string
	var oiyhx []string

	if r.MultipartForm != nil {
		ythcs = r.MultipartForm.Value["ythcs"]
		utyeh = r.MultipartForm.Value["utyeh"]
		ertqh = r.MultipartForm.Value["ertqh"]
		vjmsk = r.MultipartForm.Value["vjmsk"]
		oiyhx = r.MultipartForm.Value["oiyhx"]
	}

	ythcs_ := utils.Decode(ythcs[0])
	vjmsk_ := utils.Decode(vjmsk[0])

	oiyhx_ := strings.Split(oiyhx[0], ",")

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("0601021504")

	buffer, err := base64.StdEncoding.DecodeString(oiyhx_[1]) //成图片文件并把文件写入到buffer
	if err != nil {
		fmt.Println(err)
		result := data.SuccessFail_("0", "图片获取失败")
		fmt.Fprintf(w, result)
		return
	}
	err = ioutil.WriteFile("subject/"+ythcs_+time+".jpg", buffer, 0666) //buffer输出到jpg文件中（不做处理，直接写到文件）
	if err != nil {
		fmt.Println(err)
		result := data.SuccessFail_("0", "图片读写失败")
		fmt.Fprintf(w, result)
		return
	}

	result := data.SubjectAdd_(ythcs_, utyeh[0], ertqh[0], "subject/"+ythcs_+time+".jpg", vjmsk_)
	fmt.Fprintf(w, result)
}

//删除专题

func subjectDelete(w http.ResponseWriter, r *http.Request) {
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

	rejcs := r.FormValue("rejcs")
	rejcs_ := utils.Decode(rejcs)

	result := data.SubjectDelete_(rejcs_)
	fmt.Fprintf(w, result)
}

//新建专题标签

func subjectUploadSymbol(w http.ResponseWriter, r *http.Request) {
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

	tjnsv := r.FormValue("tjnsv")

	result := data.SubjectUploadSymbol_(tjnsv)
	fmt.Fprintf(w, result)
}

//关注专题

func subjectFocus(w http.ResponseWriter, r *http.Request) {
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

	grbfs := r.FormValue("grbfs")
	grbfs_ := utils.Decode(grbfs)
	ckege := r.FormValue("ckege")
	ckege_ := utils.Decode(ckege)
	uiksh := r.FormValue("uiksh")
	uiksh_ := utils.Decode(uiksh)

	result := data.SubjectFocus_(grbfs_, ckege_, uiksh_)
	fmt.Fprintf(w, result)
}

//取消关注专题

func subjectCancleFocus(w http.ResponseWriter, r *http.Request) {
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

	grbfs := r.FormValue("grbfs")
	grbfs_ := utils.Decode(grbfs)
	ckege := r.FormValue("ckege")
	ckege_ := utils.Decode(ckege)
	uiksh := r.FormValue("uiksh")
	uiksh_ := utils.Decode(uiksh)

	result := data.SubjectCancleFocus_(grbfs_, ckege_, uiksh_)
	fmt.Fprintf(w, result)
}

//文章投稿

func articleContribute(w http.ResponseWriter, r *http.Request) {
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

	ychsw := r.FormValue("ychsw")
	ychsw_ := utils.Decode(ychsw)
	hsyce := r.FormValue("hsyce")
	hsyce_ := utils.Decode(hsyce)
	anscj := r.FormValue("anscj")
	anscj_ := utils.Decode(anscj)
	rywjc := r.FormValue("rywjc")
	rywjc_ := utils.Decode(rywjc)

	result := data.ArticleContribute_(ychsw_, hsyce_, anscj_, rywjc_)
	fmt.Fprintf(w, result)
}

//获取未投稿文章
func articleNotContribute(w http.ResponseWriter, r *http.Request) {
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

	hskcu := r.FormValue("hskcu")
	hskcu_ := utils.Decode(hskcu)

	result := data.ArticleNotContribute_(hskcu_)
	fmt.Fprintf(w, result)
}

//获取待审核文章

func articleNotExamine(w http.ResponseWriter, r *http.Request) {
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

	ueysj := r.FormValue("ueysj")
	ueysj_ := utils.Decode(ueysj)

	result := data.ArticleNotExamine_(ueysj_)
	fmt.Fprintf(w, result)
}

//管理待审核文章
func articleExamine(w http.ResponseWriter, r *http.Request) {
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

	eshhd := r.FormValue("eshhd")
	eshhd_ := utils.Decode(eshhd)
	twrch := r.FormValue("twrch")
	twrch_ := utils.Decode(twrch)
	imvah := r.FormValue("imvah")
	imvah_ := utils.Decode(imvah)
	tafvm := r.FormValue("tafvm")
	uehst := r.FormValue("uehst")
	uehst_ := utils.Decode(uehst)

	var result string
	switch twrch_ {
	case "1":
		result = data.ArticleExamine_ac(eshhd_, twrch_, imvah_, tafvm, uehst_)
	case "0":
		result = data.ArticleExamine_fa(eshhd_, twrch_, imvah_, tafvm, uehst_)
	default:
		result = data.SuccessFail_("0", "wrong code")
	}
	fmt.Fprintf(w, result)
}
