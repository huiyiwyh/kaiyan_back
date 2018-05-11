package main

import (
	"fmt"
	"io"
	"kaiyan/data"
	"net/http"
	"os"
)

//登陆

func userLogin(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	bhtdm := r.FormValue("bhtdm") //account
	bhtdm_ := decode(bhtdm)
	opawe := r.FormValue("opawe") //password
	opawe_ := decode(opawe)
	var result string

	if data.Authenticate(bhtdm_, opawe_) {
		cookie := http.Cookie{Name: "account", Value: bhtdm_, Path: "/", MaxAge: 86400}
		http.SetCookie(w, &cookie)

		//发送个客户端Token
		createToken(bhtdm_)

		result = data.SuccessFail_("0", "登陆成功")
		fmt.Fprintf(w, result)
	} else {
		result = data.SuccessFail_("0", "账号或密码不正确")
		fmt.Fprintf(w, result)
	}
}

//登出

func userLogout(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	cookie := http.Cookie{Name: "account", Path: "/", MaxAge: -1}
	http.SetCookie(w, &cookie)
}

//注册
func userSignUp(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ywhft := r.FormValue("ywhft") //account
	urhsf := r.FormValue("urhsf") //name
	iuqng := r.FormValue("iuqng") //password

	var result string
	result = data.UserSignUp_(ywhft, urhsf, iuqng)
	fmt.Fprintf(w, result)
}

//获取个人信息

func userDetails(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	jchen := r.FormValue("jchen")
	jchen_ := decode(jchen)

	var result string
	result = data.UserDetails_(jchen_)
	fmt.Fprintf(w, result)
}

//修改用户头像(未给用户头像文件改名字)

func userModifyHead(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	var err error
	var result string
	hcnsg := r.FormValue("hcnsg")
	hcnsg_ := decode(hcnsg)
	file, _, err := r.FormFile("yshuc")
	if err != nil {
		fmt.Println(err)
		result = data.SuccessFail_("0", "图片获取失败")
		fmt.Fprintf(w, result)
		return
	}
	defer file.Close()

	createDir("back")

	fW, err := os.Create("back/" + hcnsg_ + ".jpg")
	if err != nil {
		fmt.Println("文件创建失败")
		result = data.SuccessFail_("0", "文件创建失败")
		fmt.Fprintf(w, result)
		return
	}
	defer fW.Close()

	_, err = io.Copy(fW, file)
	if err != nil {
		fmt.Println("文件保存失败")
		result = data.SuccessFail_("0", "文件保存失败")
		fmt.Fprintf(w, result)
		return
	}

	result = data.UserModifyHead_(hcnsg_, "kaiyan/back/"+hcnsg_+".jpg")
	fmt.Fprintf(w, result)
}

//修改用户昵称

func userModifyNickname(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ashce := r.FormValue("ashce")
	ashce_ := decode(ashce)
	ytesh := r.FormValue("ytesh")
	ytesh_ := decode(ytesh)

	var result string
	result = data.UserModifyNickname_(ashce_, ytesh_)
	fmt.Fprintf(w, result)
}

//修改个人简介

func userModifyBrief(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	tehas := r.FormValue("tehas")
	tehas_ := decode(tehas)
	bncjs := r.FormValue("bncjs")
	bncjs_ := decode(bncjs)

	var result string
	result = data.UserModifyBrief_(tehas_, bncjs_)
	fmt.Fprintf(w, result)
}

//修改登录密码

func userModifyPassword(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	jksnd := r.FormValue("jksnd")
	jksnd_ := decode(jksnd)
	nklsh := r.FormValue("nklsh")
	nklsh_ := decode(nklsh)
	wrqsd := r.FormValue("wrqsd")
	wrqsd_ := decode(wrqsd)

	var result string
	result = data.UserModifyPassword_(jksnd_, nklsh_, wrqsd_)
	fmt.Fprintf(w, result)
}

//获取动态信息

func userDynamic(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	nhcjs := r.FormValue("nhcjs")
	nhcjs_ := decode(nhcjs)
	asxcd := r.FormValue("asxcd")
	asxcd_ := decode(asxcd)

	fmt.Println(nhcjs, asxcd)
	var result string
	result = data.UserDynamic_(nhcjs_, asxcd_)
	fmt.Fprintf(w, result)
}
