package main

import (
	"fmt"
	"io"
	"kaiyan/data"
	"kaiyan/utils"

	"log"
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
	thsue_ := utils.Decode(thsue)

	result := data.ArticleListRec(thsue_)
	fmt.Fprintf(w, result)
}

//获取文章列表

func articleList(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	dhcjs := r.FormValue("dhcjs")
	dhcjs_ := utils.Decode(dhcjs)
	utysh := r.FormValue("utysh")
	utysh_ := utils.Decode(utysh)

	var result string
	switch dhcjs_ {
	case "0":
		idonx := r.FormValue("idonx")
		idonx_ := utils.Decode(idonx)
		if utysh_ == "1" {
			result = data.ArticleListNoneNew(idonx_)
		} else {
			result = data.ArticleListNonePopular(idonx_)
		}
	case "1":
		bvnsj := r.FormValue("bvnsj")
		bvnsj_ := utils.Decode(bvnsj)
		idonx := r.FormValue("idonx")
		idonx_ := utils.Decode(idonx)
		if utysh_ == "1" {
			result = data.ArticleListSubjectNew(bvnsj_, idonx_)
		} else {
			result = data.ArticleListSubjectPopular(bvnsj_, idonx_)
		}
	case "2":
		bvnsj := r.FormValue("bvnsj")
		bvnsj_ := utils.Decode(bvnsj)
		idonx := r.FormValue("idonx")
		idonx_ := utils.Decode(idonx)
		if utysh_ == "1" {
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
	ieudh_ := utils.Decode(ieudh)
	hfeyd := r.FormValue("hfeyd")
	hfeyd_ := utils.Decode(hfeyd)

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
	xdgje_ := utils.Decode(xdgje)

	uegsb := r.FormValue("uegsb")
	uegsb_ := utils.Decode(uegsb)

	result := data.ArticleListLike_(xdgje_, uegsb_)
	fmt.Fprintf(w, result)
}

//获取历史记录

func articleListHistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ychwn := r.FormValue("ychwn")
	ychwn_ := utils.Decode(ychwn)
	siwhb := r.FormValue("siwhb")
	siwhb_ := utils.Decode(siwhb)

	result := data.ArticleListHistory_(ychwn_, siwhb_)
	fmt.Fprintf(w, result)
}

//获取文章详情

func articleListDetails(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	rwhcs := r.FormValue("rwhcs")
	rwhcs_ := utils.Decode(rwhcs)
	uwhgc := r.FormValue("uwhgc")
	uwhgc_ := utils.Decode(uwhgc)

	result := data.ArticleListDetails_(rwhcs_, uwhgc_)
	fmt.Fprintf(w, result)
}

//获取文章评论

func articleListComment(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	hnksa := r.FormValue("hnksa")
	hnksa_ := utils.Decode(hnksa)
	ncvbs := r.FormValue("ncvbs")
	ncvbs_ := utils.Decode(ncvbs)

	result := data.ArticleListComment_(hnksa_, ncvbs_)
	fmt.Fprintf(w, result)
}

//评论文章

func articleAddComment(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	iwuus := r.FormValue("iwuus")
	iwuus_ := utils.Decode(iwuus)
	kalcb := r.FormValue("kalcb")
	kalcb_ := utils.Decode(kalcb)
	thske := r.FormValue("thske")
	thske_ := utils.Decode(thske)
	ywhkd := r.FormValue("ywhkd")
	ywhkd_ := utils.Decode(ywhkd)
	mnsjf := r.FormValue("mnsjf")
	mnsjf_ := utils.Decode(mnsjf)

	result := data.ArticleAddComment_(iwuus_, kalcb_, thske_, ywhkd_, mnsjf_)
	fmt.Fprintf(w, result)

}

//记录文章阅读信息

func articleAddHistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	rqgcm := r.FormValue("rqgcm")
	rqgcm_ := utils.Decode(rqgcm)
	ivhws := r.FormValue("ivhws")
	ivhws_ := utils.Decode(ivhws)

	result := data.ArticleAddHistory_(rqgcm_, ivhws_)
	fmt.Fprintf(w, result)

}

//喜欢文章

func articleAddLike(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ivwga := r.FormValue("ivwga")
	ivwga_ := utils.Decode(ivwga)
	rwhcs := r.FormValue("rwhcs")
	rwhcs_ := utils.Decode(rwhcs)
	uwhgc := r.FormValue("uwhgc")
	uwhgc_ := utils.Decode(uwhgc)
	mjkns := r.FormValue("mjkns")
	mjkns_ := utils.Decode(mjkns)

	result := data.ArticleAddLike_(ivwga_, rwhcs_, uwhgc_, mjkns_)
	fmt.Fprintf(w, result)
}

//取消喜欢文章

func articleDeletelike(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	wqsvh := r.FormValue("wqsvh")
	wqsvh_ := utils.Decode(wqsvh)
	zshrs := r.FormValue("zshrs")
	zshrs_ := utils.Decode(zshrs)
	uqvcj := r.FormValue("uqvcj")
	uqvcj_ := utils.Decode(uqvcj)

	result := data.ArticleDeletelike_(wqsvh_, zshrs_, uqvcj_)
	fmt.Fprintf(w, result)
}

//上传标签值
func articleUploadSymbolNum(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	wafhc := r.FormValue("wafhc")
	wafhc_ := utils.Decode(wafhc)
	iryvn := r.FormValue("iryvn")
	iryvn_ := utils.Decode(iryvn)
	yvhen := r.FormValue("yvhen")
	yvhen_ := utils.Decode(yvhen)

	result := data.ArtcileUploadSymbolNum_(wafhc_, iryvn_, yvhen_)
	fmt.Fprintf(w, result)
}

//新建文章标签(complete)

func articleUploadSymbol(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	tgmbj := r.FormValue("tgmbj")
	tgmbj_ := utils.Decode(tgmbj)

	result := data.ArticleUploadSymbol_(tgmbj_)
	fmt.Fprintf(w, result)
}

//图片上传(complete)

func articleUploadPicture(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	var err error

	twhck := r.FormValue("twhck")
	twhck_ := utils.Decode(twhck)
	file, _, err := r.FormFile("oxjwg")
	if err != nil {
		fmt.Println(err)
		result := data.SuccessFail_("0", "图片获取失败")
		fmt.Fprintf(w, result)
		return
	}
	defer file.Close()

	utils.CreateDir("article/" + twhck_)

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("060102150405")

	fW, err := os.Create("article/" + twhck_ + "/" + time + ".jpg")
	if err != nil {
		fmt.Println("文件创建失败")
		result := data.SuccessFail_("0", "文件创建失败")
		fmt.Fprintf(w, result)
		return
	}

	defer fW.Close()

	_, err = io.Copy(fW, file)
	if err != nil {
		fmt.Println("文件保存失败")
		result := data.SuccessFail_("0", "文件保存失败")
		fmt.Fprintf(w, result)
		return
	}

	result := data.ArticleUploadPicture_("kaiyan/article/" + twhck_ + "/" + time + ".jpg")
	fmt.Fprintf(w, result)
}

//放弃纂写文章

func articleCancel(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	iuhwc := r.FormValue("iuhwc")
	iuhwc_ := utils.Decode(iuhwc)

	var result string

	_dir := "article/" + iuhwc_

	exist, err := utils.PathExists(_dir)
	if !exist {
		log.Println(err)
		result = data.SuccessFail_("0", "文件夹不存在")
	}

	err = os.RemoveAll(_dir)

	if err != nil {
		log.Println(err)
		result = data.SuccessFail_("0", "文件删除失败")
	}

	result = data.SuccessFail_("1", "文章放弃成功！")

	fmt.Fprintf(w, result)
}

//编辑文章

func articleEdit(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	ywjnc := r.FormValue("ywjnc")
	ywjnc_ := utils.Decode(ywjnc)
	ncdac := r.FormValue("ncdac")
	ncdac_ := utils.Decode(ncdac)
	porjw := r.FormValue("porjw")
	porjw_ := utils.Decode(porjw)
	kvdjw := r.FormValue("kvdjw")
	kvdjw_ := utils.Decode(kvdjw)
	majsh := r.FormValue("majsh")
	majsh_ := utils.Decode(majsh)
	twgnk := r.FormValue("twgnk")
	twgnk_ := utils.Decode(twgnk)

	result := data.ArticleEdit_(ywjnc_, ncdac_, porjw_, kvdjw_, majsh_, twgnk_)
	fmt.Fprintf(w, result)

}

//提交文章

func articleWrite(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Add("Access-Control-Allow-Headers", "Content-Type")
	w.Header().Set("content-type", "application/json")

	twhck := r.FormValue("twhck")
	twhck_ := utils.Decode(twhck)
	mncsk := r.FormValue("mncsk")
	mncsk_ := utils.Decode(mncsk)
	uvcns := r.FormValue("uvcns")
	uvcns_ := utils.Decode(uvcns)
	yvhek := r.FormValue("yvhek")
	yvhek_ := utils.Decode(yvhek)
	rwkcb := r.FormValue("rwkcb")
	rwkcb_ := utils.Decode(rwkcb)
	ovjsb := r.FormValue("ovjsb")
	ovjsb_ := utils.Decode(ovjsb)

	result := data.ArticleWrite_(twhck_, mncsk_, uvcns_, yvhek_, rwkcb_, ovjsb_)
	fmt.Fprintf(w, result)
}
