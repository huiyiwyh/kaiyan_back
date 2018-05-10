package main

import (
	"fmt"
	"io"
	"kaiyan/data"
	"net/http"
	"os"
)

//登陆

func login(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	// name := r.FormValue("name")
	// password := r.FormValue("password")

	// fmt.Println(name, password)

	// if authenticate(name, password) {
	// 	fmt.Fprintf(w, "failed")
	// } else {
	// 	fmt.Fprintf(w, "success")
	// }
}

//登出

func logout(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	// cookie, err := r.Cookie("_cookie")
	// if err != http.ErrNoCookie {
	// 	warning(err, "Failed to get cookie")
	// 	session := data.Session{Uuid: cookie.Value}
	// 	session.DeleteByUUID()
	// }
	// http.Redirect(w, r, "/", 302)
}

//注册
func signup(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	// user := data.User{
	// 	Name:     r.FormValue("name"),
	// 	Email:    r.FormValue("email"),
	// 	Password: r.FormValue("password"),
	// }
	// if err := user.Create(); err != nil {
	// 	danger(err, "Cannot create user")
	// }
	// http.Redirect(writer, request, "/login", 302)
}

//获取个人信息

func userInfo(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	jchen := r.FormValue("jchen")
	jchen_ := decode(jchen)

	var result string
	result = data.UserInfo_(jchen_)
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
		result = data.SuccessFail_("图片获取失败")
		fmt.Fprintf(w, result)
		return
	}
	defer file.Close()

	data.CreateDir("back")

	fW, err := os.Create("back/" + hcnsg_ + ".jpg")
	if err != nil {
		fmt.Println("文件创建失败")
		result = data.SuccessFail_("文件创建失败")
		fmt.Fprintf(w, result)
		return
	}
	defer fW.Close()

	_, err = io.Copy(fW, file)
	if err != nil {
		fmt.Println("文件保存失败")
		result = data.SuccessFail_("文件保存失败")
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
