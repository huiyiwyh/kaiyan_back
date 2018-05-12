package main

import (
	"encoding/base64"
	"fmt"
	"io/ioutil"
	"kaiyan/data"
	"kaiyan/utils"
	"strings"

	"net/http"
)

//登陆
func userLogin(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	bhtdm := r.FormValue("bhtdm") //account
	bhtdm_ := utils.Decode(bhtdm)
	opawe := r.FormValue("opawe") //password
	opawe_ := utils.Decode(opawe)

	result := data.UserLogin_(bhtdm_, opawe_)
	fmt.Fprintf(w, result)
}

//登出

func userLogout(w http.ResponseWriter, r *http.Request) {
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

	uhyts := r.FormValue("uhyts")
	uhyts_ := utils.Decode(uhyts)

	result := data.SuccessFail_("1", uhyts_+"登出成功")
	fmt.Fprintf(w, result)
}

//注册
func userSignup(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ywhft := r.FormValue("ywhft") //account
	ywhft_ := utils.Decode(ywhft)
	iuqng := r.FormValue("iuqng") //password
	iuqng_ := utils.Decode(iuqng)

	result := data.UserSignup_(ywhft_, iuqng_)
	fmt.Fprintf(w, result)
}

//获取个人信息

func userDetails(w http.ResponseWriter, r *http.Request) {
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

	jchen := r.FormValue("jchen")
	jchen_ := utils.Decode(jchen)

	result := data.UserDetails_(jchen_)
	fmt.Fprintf(w, result)
}

//修改用户头像

func userModifyHead(w http.ResponseWriter, r *http.Request) {
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

	hcnsg := r.FormValue("hcnsg")
	hcnsg_ := utils.Decode(hcnsg)
	yshuc := r.FormValue("yshuc")

	yshuc_ := strings.Split(yshuc, ",")

	buffer, _ := base64.StdEncoding.DecodeString(yshuc_[1])      //成图片文件并把文件写入到buffer
	err := ioutil.WriteFile("user/"+hcnsg_+".jpg", buffer, 0666) //buffer输出到jpg文件中（不做处理，直接写到文件）
	if err != nil {
		fmt.Println(err)
		result := data.SuccessFail_("0", "图片获取失败")
		fmt.Fprintf(w, result)
		return
	}

	result := data.UserModifyHead_(hcnsg_, "kaiyan/user/"+hcnsg_+".jpg")
	fmt.Fprintf(w, result)
}

//修改用户昵称

func userModifyNickname(w http.ResponseWriter, r *http.Request) {
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

	ashce := r.FormValue("ashce")
	ashce_ := utils.Decode(ashce)
	ytesh := r.FormValue("ytesh")

	result := data.UserModifyNickname_(ashce_, ytesh)
	fmt.Fprintf(w, result)
}

//修改个人简介

func userModifyBrief(w http.ResponseWriter, r *http.Request) {

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

	tehas := r.FormValue("tehas")
	tehas_ := utils.Decode(tehas)
	bncjs := r.FormValue("bncjs")

	result := data.UserModifyBrief_(tehas_, bncjs)
	fmt.Fprintf(w, result)
}

//修改登录密码

func userModifyPassword(w http.ResponseWriter, r *http.Request) {
	// w.Header().Set("Access-Control-Allow-Origin", "*")
	// w.Header().Add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Token")
	// w.Header().Set("content-type", "application/json")
	// w.Header().Set("Access-Control-Allow-Methods", "GET POST PUT DELETE")

	// if r.Method == "OPTIONS" {
	// 	return
	// }
	// token := r.Header.Get("Token")

	// if !utils.AuthenticToken(token) {
	// 	result := data.SuccessFail_("0", "Token验证失败")
	// 	fmt.Fprintf(w, result)
	// 	return
	// }

	jksnd := r.FormValue("jksnd")
	jksnd_ := utils.Decode(jksnd)
	nklsh := r.FormValue("nklsh")
	wrqsd := r.FormValue("wrqsd")

	result := data.UserModifyPassword_(jksnd_, nklsh, wrqsd)
	fmt.Fprintf(w, result)
}

//获取动态信息

func userDynamic(w http.ResponseWriter, r *http.Request) {
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

	nhcjs := r.FormValue("nhcjs")
	nhcjs_ := utils.Decode(nhcjs)
	asxcd := r.FormValue("asxcd")
	asxcd_ := utils.Decode(asxcd)

	fmt.Println(nhcjs, asxcd)

	result := data.UserDynamic_(nhcjs_, asxcd_)
	fmt.Fprintf(w, result)
}

//获取私信列表

func userListMessage(w http.ResponseWriter, r *http.Request) {
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

	cjfhe := r.FormValue("cjfhe")
	cjfhe_ := utils.Decode(cjfhe)
	jhsyd := r.FormValue("jhsyd")
	jhsyd_ := utils.Decode(jhsyd)

	result := data.UserListMessage_(cjfhe_, jhsyd_)
	fmt.Fprintf(w, result)
}

//查看私信内容

func userListMessageDetails(w http.ResponseWriter, r *http.Request) {
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

	vijry := r.FormValue("vijry")
	vijry_ := utils.Decode(vijry)
	shjed := r.FormValue("shjed")
	shjed_ := utils.Decode(shjed)
	ovpis := r.FormValue("ovpis")
	ovpis_ := utils.Decode(ovpis)

	result := data.UserListMessageDetails_(vijry_, shjed_, ovpis_)
	fmt.Fprintf(w, result)
}

//检索好友

func userSearchFri(w http.ResponseWriter, r *http.Request) {
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

	cjeys := r.FormValue("cjeys")

	result := data.UserSearchFri_(cjeys)
	fmt.Fprintf(w, result)
}

//发送私信

func userSendMessage(w http.ResponseWriter, r *http.Request) {
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

	vjegs := r.FormValue("vjegs")
	vjegs_ := utils.Decode(vjegs)
	viokr := r.FormValue("viokr")
	viokr_ := utils.Decode(viokr)
	tshef := r.FormValue("tshef")

	result := data.UserSendMessage_(vjegs_, viokr_, tshef)
	fmt.Fprintf(w, result)
}

//获取评论列表

func userListComment(w http.ResponseWriter, r *http.Request) {
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

	jchem := r.FormValue("jchem")
	jchem_ := utils.Decode(jchem)
	sjcne := r.FormValue("sjcne")
	sjcne_ := utils.Decode(sjcne)

	result := data.UserListComment_(jchem_, sjcne_)
	fmt.Fprintf(w, result)
}

//回复评论

func userAddComment(w http.ResponseWriter, r *http.Request) {
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

	yshen := r.FormValue("yshen")
	yshen_ := utils.Decode(yshen)
	pcohe := r.FormValue("pcohe")
	pcohe_ := utils.Decode(pcohe)
	hwtsa := r.FormValue("hwtsa")
	qshey := r.FormValue("qshey")
	qshey_ := utils.Decode(qshey)

	result := data.UserAddComment_(yshen_, pcohe_, hwtsa, qshey_)
	fmt.Fprintf(w, result)
}

//获取喜欢列表

func userListLike(w http.ResponseWriter, r *http.Request) {
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

	isujw := r.FormValue("isujw")
	isujw_ := utils.Decode(isujw)
	hwknc := r.FormValue("hwknc")
	hwknc_ := utils.Decode(hwknc)

	result := data.UserListLike_(isujw_, hwknc_)
	fmt.Fprintf(w, result)
}

//获取关注列表
func userListFocus(w http.ResponseWriter, r *http.Request) {
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

	msnch := r.FormValue("msnch")
	msnch_ := utils.Decode(msnch)
	ocibe := r.FormValue("ocibe")
	ocibe_ := utils.Decode(ocibe)

	result := data.UserListFocus_(msnch_, ocibe_)
	fmt.Fprintf(w, result)
}

//获取用户主页信息
func userListHomeDetails(w http.ResponseWriter, r *http.Request) {
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

	wtxhn := r.FormValue("wtxhn")
	wtxhn_ := utils.Decode(wtxhn)
	yjwmk := r.FormValue("yjwmk")
	yjwmk_ := utils.Decode(yjwmk)

	result := data.UserListHomeDetails_(wtxhn_, yjwmk_)
	fmt.Fprintf(w, result)
}

//关注用户

func userFocus(w http.ResponseWriter, r *http.Request) {
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

	wjvhw := r.FormValue("wjvhw")
	wjvhw_ := utils.Decode(wjvhw)
	okbaj := r.FormValue("okbaj")
	okbaj_ := utils.Decode(okbaj)

	result := data.UserFocus_(wjvhw_, okbaj_)
	fmt.Fprintf(w, result)
}

//取消关注用户
func userCancelFocus(w http.ResponseWriter, r *http.Request) {
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

	ivneh := r.FormValue("ivneh")
	ivneh_ := utils.Decode(ivneh)
	oapcw := r.FormValue("oapcw")
	oapcw_ := utils.Decode(oapcw)

	result := data.UserCancelFocus_(ivneh_, oapcw_)
	fmt.Fprintf(w, result)
}
