package main

import (
	"fmt"
	"kaiyan/data"
	"net/http"
)

//获取私信列表

func userListMessage(w http.ResponseWriter, r *http.Request) {
	cjfhe := r.FormValue("cjfhe")
	cjfhe_ := decode(cjfhe)
	jhsyd := r.FormValue("jhsyd")
	jhsyd_ := decode(jhsyd)

	var result string
	result = data.UserListMessage_(cjfhe_, jhsyd_)
	fmt.Fprintf(w, result)
}

//查看私信内容

func userListMessageDetails(w http.ResponseWriter, r *http.Request) {
	vijry := r.FormValue("vijry")
	vijry_ := decode(vijry)
	shjed := r.FormValue("shjed")
	shjed_ := decode(shjed)
	ovpis := r.FormValue("ovpis")
	ovpis_ := decode(ovpis)

	var result string
	result = data.UserListMessageDetails_(vijry_, shjed_, ovpis_)
	fmt.Fprintf(w, result)
}

//检索好友

func userSearchFri(w http.ResponseWriter, r *http.Request) {
	cjeys := r.FormValue("cjeys")
	cjeys_ := decode(cjeys)

	var result string
	result = data.UserSearchFri_(cjeys_)
	fmt.Fprintf(w, result)
}

//发送私信

func userSendMessage(w http.ResponseWriter, r *http.Request) {
	vjegs := r.FormValue("vjegs")
	vjegs_ := decode(vjegs)
	viokr := r.FormValue("viokr")
	viokr_ := decode(viokr)
	tshef := r.FormValue("tshef")
	tshef_ := decode(tshef)

	var result string
	result = data.UserSendMessage_(vjegs_, viokr_, tshef_)
	fmt.Fprintf(w, result)
}

//获取评论列表

func userListComment(w http.ResponseWriter, r *http.Request) {
	jchem := r.FormValue("jchem")
	jchem_ := decode(jchem)
	sjcne := r.FormValue("sjcne")
	sjcne_ := decode(sjcne)

	var result string
	result = data.UserListComment_(jchem_, sjcne_)
	fmt.Fprintf(w, result)
}

//回复评论

func userAddComment(w http.ResponseWriter, r *http.Request) {
	yshen := r.FormValue("yshen")
	yshen_ := decode(yshen)
	pcohe := r.FormValue("pcohe")
	pcohe_ := decode(pcohe)
	hwtsa := r.FormValue("hwtsa")
	hwtsa_ := decode(hwtsa)
	qshey := r.FormValue("qshey")
	qshey_ := decode(qshey)

	var result string
	result = data.UserAddComment_(yshen_, pcohe_, hwtsa_, qshey_)
	fmt.Fprintf(w, result)
}

//获取喜欢列表

func userListLike(w http.ResponseWriter, r *http.Request) {
	isujw := r.FormValue("isujw")
	isujw_ := decode(isujw)
	hwknc := r.FormValue("hwknc")
	hwknc_ := decode(hwknc)

	var result string
	result = data.UserListLike_(isujw_, hwknc_)
	fmt.Fprintf(w, result)
}

//获取关注列表
func userListFocus(w http.ResponseWriter, r *http.Request) {
	msnch := r.FormValue("msnch")
	msnch_ := decode(msnch)
	ocibe := r.FormValue("ocibe")
	ocibe_ := decode(ocibe)

	var result string
	result = data.UserListFocus_(msnch_, ocibe_)
	fmt.Fprintf(w, result)
}

//获取用户主页信息
func userListHomeDetails(w http.ResponseWriter, r *http.Request) {
	wtxhn := r.FormValue("wtxhn")
	wtxhn_ := decode(wtxhn)
	yjwmk := r.FormValue("yjwmk")
	yjwmk_ := decode(yjwmk)

	var result string
	result = data.UserListHomeDetails_(wtxhn_, yjwmk_)
	fmt.Fprintf(w, result)
}

//关注用户

func userFocus(w http.ResponseWriter, r *http.Request) {
	wjvhw := r.FormValue("wjvhw")
	wjvhw_ := decode(wjvhw)
	okbaj := r.FormValue("okbaj")
	okbaj_ := decode(okbaj)

	var result string
	result = data.UserFocus_(wjvhw_, okbaj_)
	fmt.Fprintf(w, result)
}

//取消关注用户
func userCancelFocus(w http.ResponseWriter, r *http.Request) {
	ivneh := r.FormValue("ivneh")
	ivneh_ := decode(ivneh)
	oapcw := r.FormValue("oapcw")
	oapcw_ := decode(oapcw)

	var result string
	result = data.UserCancelFocus_(ivneh_, oapcw_)
	fmt.Fprintf(w, result)
}

//获取专题消息列表
