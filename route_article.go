package main

import (
	"fmt"
	"io"
	"kaiyan/data"
	"net/http"
	"os"
	"time"
)

//推荐

func articleListRec(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	thsue := r.FormValue("thsue")
	thsue_ := decode(thsue)

	var result string
	result = data.ArticleListRec(thsue_)
	fmt.Fprintf(w, result)
}

//获取文章列表

func articleList(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	dhcjs := r.FormValue("dhcjs")
	dhcjs_ := decode(dhcjs)
	utysh := r.FormValue("utysh")
	utysh_ := decode(utysh)

	var result string
	switch dhcjs_ {
	case "0":
		idonx := r.FormValue("idonx")
		idonx_ := decode(idonx)
		if utysh_ == "1" {
			result = data.ArticleListNoneNew(idonx_)
		} else {
			result = data.ArticleListNonePopular(idonx_)
		}
	case "1":
		bvnsj := r.FormValue("bvnsj")
		bvnsj_ := decode(bvnsj)
		idonx := r.FormValue("idonx")
		idonx_ := decode(idonx)
		if utysh == "1" {
			result = data.ArticleListSubjectNew(bvnsj_, idonx_)
		} else {
			result = data.ArticleListSubjectPopular(bvnsj_, idonx_)
		}
	case "2":
		bvnsj := r.FormValue("bvnsj")
		bvnsj_ := decode(bvnsj)
		idonx := r.FormValue("idonx")
		idonx_ := decode(idonx)
		if utysh == "1" {
			result = data.ArticleListAccountNew(bvnsj_, idonx_)
		} else {
			result = data.ArticleListAccountPopular(bvnsj_, idonx_)
		}
	default:
	}
	fmt.Fprintf(w, result)
}

//获取文章排行榜

func articleListRanking(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ieudh := r.FormValue("ieudh")
	ieudh_ := decode(ieudh)
	hfeyd := r.FormValue("hfeyd")
	hfeyd_ := decode(hfeyd)

	var day int64

	var result string

	switch hfeyd_ {
	case "1":
		day = 86400
		fmt.Println("wwww")
		result = data.ArticleListRanking_(ieudh_, day)
	case "2":
		day = 604800
		result = data.ArticleListRanking_(ieudh_, day)
	case "3":
		day = 2592000
		result = data.ArticleListRanking_(ieudh_, day)
	}
	fmt.Fprintf(w, result)
}

//获取喜欢文章
func articleListLike(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	xdgje := r.FormValue("xdgje")
	xdgje_ := decode(xdgje)

	uegsb := r.FormValue("uegsb")
	uegsb_ := decode(uegsb)

	var result string
	result = data.ArticleListLike_(xdgje_, uegsb_)
	fmt.Fprintf(w, result)
}

//获取历史记录

func articleListHistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ychwn := r.FormValue("ychwn")
	ychwn_ := decode(ychwn)
	siwhb := r.FormValue("siwhb")
	siwhb_ := decode(siwhb)

	var result string
	result = data.ArticleListHistory_(ychwn_, siwhb_)
	fmt.Fprintf(w, result)
}

//获取文章详情

func articleListDetails(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	rwhcs := r.FormValue("rwhcs")
	rwhcs_ := decode(rwhcs)
	uwhgc := r.FormValue("uwhgc")
	uwhgc_ := decode(uwhgc)

	var result string
	result = data.ArticleListDetails_(rwhcs_, uwhgc_)
	fmt.Fprintf(w, result)
}

//获取文章评论

func articleListComment(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hnksa := r.FormValue("hnksa")
	hnksa_ := decode(hnksa)
	ncvbs := r.FormValue("ncvbs")
	ncvbs_ := decode(ncvbs)

	var result string
	result = data.ArticleListComment_(hnksa_, ncvbs_)
	fmt.Fprintf(w, result)
}

//评论文章

func articleAddComment(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	iwuus := r.FormValue("iwuus")
	iwuus_ := decode(iwuus)
	kalcb := r.FormValue("kalcb")
	kalcb_ := decode(kalcb)
	thske := r.FormValue("thske")
	thske_ := decode(thske)
	ywhkd := r.FormValue("ywhkd")
	ywhkd_ := decode(ywhkd)
	mnsjf := r.FormValue("mnsjf")
	mnsjf_ := decode(mnsjf)

	var result string
	result = data.ArticleAddComment_(iwuus_, kalcb_, thske_, ywhkd_, mnsjf_)
	fmt.Fprintf(w, result)

}

//记录文章阅读信息

func articleAddHistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	rqgcm := r.FormValue("rqgcm")
	rqgcm_ := decode(rqgcm)
	ivhws := r.FormValue("ivhws")
	ivhws_ := decode(ivhws)

	var result string
	result = data.ArticleAddHistory_(rqgcm_, ivhws_)
	fmt.Fprintf(w, result)

}

//喜欢文章

func articleAddLike(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ivwga := r.FormValue("ivwga")
	ivwga_ := decode(ivwga)
	rwhcs := r.FormValue("rwhcs")
	rwhcs_ := decode(rwhcs)
	uwhgc := r.FormValue("uwhgc")
	uwhgc_ := decode(uwhgc)
	mjkns := r.FormValue("mjkns")
	mjkns_ := decode(mjkns)

	var result string
	result = data.ArticleAddLike_(ivwga_, rwhcs_, uwhgc_, mjkns_)
	fmt.Fprintf(w, result)
}

//取消喜欢文章

func articleDeletelike(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	wqsvh := r.FormValue("wqsvh")
	wqsvh_ := decode(wqsvh)
	zshrs := r.FormValue("zshrs")
	zshrs_ := decode(zshrs)
	uqvcj := r.FormValue("uqvcj")
	uqvcj_ := decode(uqvcj)

	var result string
	result = data.ArticleDeletelike_(wqsvh_, zshrs_, uqvcj_)
	fmt.Fprintf(w, result)
}

//上传标签值
func articleUploadSymbolNum(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	wafhc := r.FormValue("wafhc")
	wafhc_ := decode(wafhc)
	iryvn := r.FormValue("iryvn")
	iryvn_ := decode(iryvn)
	yvhen := r.FormValue("yvhen")
	yvhen_ := decode(yvhen)

	var result string
	result = data.ArtcileUploadSymbolNum_(wafhc_, iryvn_, yvhen_)
	fmt.Fprintf(w, result)
}

//新建文章标签

func articleUploadSymbol(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	tgmbj := r.FormValue("tgmbj")
	tgmbj_ := decode(tgmbj)

	var result string
	result = data.ArticleUploadSymbol_(tgmbj_)
	fmt.Fprintf(w, result)
}

//图片上传

func articleUploadPicture(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	var err error
	var result string
	twhck := r.FormValue("twhck")
	twhck_ := decode(twhck)
	file, _, err := r.FormFile("oxjwg")
	if err != nil {
		fmt.Println(err)
		result = data.SuccessFail_("图片获取失败")
		fmt.Fprintf(w, result)
		return
	}
	defer file.Close()

	data.CreateDir("article/" + twhck_)

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("060102150405")

	fW, err := os.Create("article/" + twhck_ + "/" + time + ".jpg")
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

	result = data.ArticleUploadPicture_("kaiyan/article/" + twhck_ + "/" + time + ".jpg")
	fmt.Fprintf(w, result)
}

//放弃纂写文章

func articleCancel(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	iuhwc := r.FormValue("iuhwc")
	iuhwc_ := decode(iuhwc)
	var result string
	result = data.ArticleCancel_(iuhwc_)
	fmt.Fprintf(w, result)
}

//编辑文章

func articleEdit(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ywjnc := r.FormValue("ywjnc")
	ywjnc_ := decode(ywjnc)
	ncdac := r.FormValue("ncdac")
	ncdac_ := decode(ncdac)
	porjw := r.FormValue("porjw")
	porjw_ := decode(porjw)
	kvdjw := r.FormValue("kvdjw")
	kvdjw_ := decode(kvdjw)
	majsh := r.FormValue("majsh")
	majsh_ := decode(majsh)
	twgnk := r.FormValue("twgnk")
	twgnk_ := decode(twgnk)

	var result string
	result = data.ArticleEdit_(ywjnc_, ncdac_, porjw_, kvdjw_, majsh_, twgnk_)
	fmt.Fprintf(w, result)

}

//提交文章

func articleWrite(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	twhck := r.FormValue("twhck")
	twhck_ := decode(twhck)
	mncsk := r.FormValue("mncsk")
	mncsk_ := decode(mncsk)
	uvcns := r.FormValue("uvcns")
	uvcns_ := decode(uvcns)
	yvhek := r.FormValue("yvhek")
	yvhek_ := decode(yvhek)
	rwkcb := r.FormValue("rwkcb")
	rwkcb_ := decode(rwkcb)
	ovjsb := r.FormValue("ovjsb")
	ovjsb_ := decode(ovjsb)

	var result string
	result = data.ArticleWrite_(twhck_, mncsk_, uvcns_, yvhek_, rwkcb_, ovjsb_)
	fmt.Fprintf(w, result)
}
