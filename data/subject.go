package data

import (
	"encoding/json"
	"fmt"
	"log"
	"strconv"
	"strings"
	"time"
)

//关注专题

func SubjectFocus_(grbfs, ckege, uiksh string) string {

	conn, err := Db.Begin()

	_, err = Db.Exec("insert into rsubfocus (Ksid,Saccount) values (?,?)", grbfs, ckege)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Insert err")
	}

	_, err = Db.Exec("update hsubject set Scountfocus = Scountfocus + 1 where Usid = ?", grbfs)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}

	// _, err = Db.Exec("insert into hmesslike (Ireceiver,Varticle,Ssender,Wdate) values (?,?,?,?)", ivwga, rwhcs, uwhgc, time)
	// if err != nil {
	// 	log.Println(err)
	// 	conn.Rollback()
	// 	return SuccessFail_("Insert_ err")
	// }

	symbols := strings.Split(uiksh, "|")

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ? and Otype = 1", ckege, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Query" + symbols[index] + "err")
		}

		if rows.Next() {
			_, err = Db.Exec("Update vuserlabel set Lvalue = Lvalue + 6 where Xaccount = ? and Qlabel = ? and Otype = 1", ckege, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()

				return SuccessFail_("Update" + symbols[index] + "err")
			}
		} else {
			_, err = Db.Exec("Insert into vuserlabel(Xaccount,Qlabel,Lvalue,Otype) values(?,?,6,1)", ckege, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()

				return SuccessFail_("Insert" + symbols[index] + "err")
			}
		}

		rows.Close()
	}

	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "XXX操作成功，具体说明到时候再议"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//取消关注专题

func SubjectCancleFocus_(grbfs, ckege, uiksh string) string {

	conn, err := Db.Begin()

	_, err = Db.Exec("delete from rsubfocus where Ksid = ? and Saccount = ?", grbfs, ckege)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Delete err")
	}
	_, err = Db.Exec("update hsubject set  = Scountfocus - 1 where Usid = ?", grbfs)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}

	symbols := strings.Split(uiksh, "|")

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and Qlabel = ? and Otype = 1", ckege, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Query" + symbols[index] + "err")
		}

		if rows.Next() {
			_, err = Db.Exec("Update vuserlabel set Lvalue = Lvalue - 6 where Xaccount = ? and Qlabel = ? and Otype = 1", ckege, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()

				return SuccessFail_("Update" + symbols[index] + "err")
			}
		}
		rows.Close()
	}

	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "XXX操作成功，具体说明到时候再议"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//新建专题标签

func SubjectUploadSymbol_(tjnsv string) string {

	conn, err := Db.Begin()

	var post SubjectUploadSymbol

	rows, err := Db.Query("select Tslid from ysubjectlabel where Rname = ?", tjnsv)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Query err")
	}

	if rows.Next() {
		var Tslid int
		rows.Scan(&Tslid)
		post.Msg = string(Tslid)
	} else {

		_, err = Db.Exec("insert into ysubjectlabel(Rname) values (?)", tjnsv)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Delete err")
		}

		newrows, err := Db.Query("select Tslid from ysubjectlabel where Rname = ?", tjnsv)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Query err")
		}

		if newrows.Next() {
			var Tslid int
			newrows.Scan(&Tslid)
			post.Msg = string(Tslid)
		} else {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Insert err")
		}

		newrows.Close()
	}
	rows.Close()

	conn.Commit()

	post.Code = "1"
	post.Msg = "XXX操作成功，具体说明到时候再议"

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取关注专题列表(complete)

func SubjectListFocus_(budhs string, tehsc string) string {
	limit, err := strconv.Atoi(tehsc)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select id,name,brief,thumbnail,countArticle,countFocus from view_subject_focus where account = ? limit ?,10", budhs, limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post SubjectListFocus
	post.Data = make([]DataSubjectListFocus, 0)

	for rows.Next() {
		var name, brief, thumbnail string
		var id, countArticle, countFocus int
		err = rows.Scan(&id, &name, &brief, &thumbnail, &countArticle, &countFocus)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataSubjectListFocus{
			Id:           id,
			Name:         name,
			Brief:        brief,
			Thumbnail:    thumbnail,
			CountArticle: countArticle,
			CountFocus:   countFocus,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("There is no result")
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取专题列表(complete)

func SubjectListTime(wyejs string) string {

	rows, err := Db.Query("select id ,name, nickname,thumbnail,countArticle,countFocus,date from view_subject where date < ? order by date desc limit 9", wyejs)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post SubjectList
	post.Data = make([]DataSubjectList, 0)

	for rows.Next() {
		var name, nickname, thumbnail, date string
		var id, countArticle, countFocus int
		err = rows.Scan(&id, &name, &nickname, &thumbnail, &countArticle, &countFocus, &date)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataSubjectList{
			Id:           id,
			Name:         name,
			Thumbnail:    thumbnail,
			Nickname:     nickname,
			CountArticle: countArticle,
			CountFocus:   countFocus,
			Date:         date,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("There is no result")
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

func SubjectListNum(wyejs string) string {
	limit, err := strconv.Atoi(wyejs)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select id ,name, nickname,thumbnail,countArticle,countFocus,date from view_subject limit ?,9", limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post SubjectList
	post.Data = make([]DataSubjectList, 0)

	for rows.Next() {
		var name, nickname, thumbnail, date string
		var id, countArticle, countFocus int
		err = rows.Scan(&id, &name, &nickname, &thumbnail, &countArticle, &countFocus, &date)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataSubjectList{
			Id:           id,
			Name:         name,
			Nickname:     nickname,
			Thumbnail:    thumbnail,
			CountArticle: countArticle,
			CountFocus:   countFocus,
			Date:         date,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("There is no result")
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

func SubjectListAccount(kvjed string) string {

	rows, err := Db.Query("select id ,name, nickname,thumbnail,countArticle,countFocus,date from view_subject where owner = ?", kvjed)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post SubjectList
	post.Data = make([]DataSubjectList, 0)

	for rows.Next() {
		var name, nickname, thumbnail, date string
		var id, countArticle, countFocus int
		err = rows.Scan(&id, &name, &nickname, &thumbnail, &countArticle, &countFocus, &date)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataSubjectList{
			Id:           id,
			Name:         name,
			Nickname:     nickname,
			Thumbnail:    thumbnail,
			CountArticle: countArticle,
			CountFocus:   countFocus,
			Date:         date,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("There is no result")
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取专题详情

func SubjectListDetails_(grbfs, ckege string) string {
	subjectId, err := strconv.Atoi(grbfs)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select id,name,brief,thumbnail,owner,nickname,countArticle,countFocus,label from view_subject where id = ?", subjectId)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post SubjectDetails

	for rows.Next() {
		var id, countArticle, countFocus int
		var name, brief, thumbnail, owner, nickname, label string
		err = rows.Scan(&id, &name, &brief, &thumbnail, &owner, &nickname, &countArticle, &countFocus, &label)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		if owner == ckege {
			post.Data.IsOwned = true
		} else {
			post.Data.IsOwned = false
		}
		data := DataSubjectDetailsInfo{
			Id:           id,
			Name:         name,
			Brief:        brief,
			Thumbnail:    thumbnail,
			Owner:        owner,
			Nickname:     nickname,
			CountArticle: countArticle,
			CountFocus:   countFocus,
			Label:        label,
		}
		post.Data.Info = data
	}

	rows.Close()

	//缺少没有返回结果（没有数据）的判断和

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//新建专题

func SubjectAdd_(ythcs, utyeh, ertqh, oiyhx, vjmsk string) string {

	conn, err := Db.Begin()
	rows, err := Db.Query("select * from hsubject where Ebelong = ?", ythcs)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	record := 0

	for rows.Next() {
		record++
	}

	if record >= 3 {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("数量达到上限")
	}

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	_, err = Db.Exec("insert into hsubject(Yname,Kbrief,Uthumbnail,Ebelong,Hcountarticle,Scountfocus,Ydate,Blabel)  values (?,?,?,?,?,?,?,?)", utyeh, ertqh, oiyhx, ythcs, 0, 0, time, vjmsk)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		return SuccessFail_("新建失败")
	}

	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "新建专题成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//删除专题(!complete)

func SubjectDelete_(rejcs string) string {

	id, err := strconv.Atoi(rejcs)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi er")
	}

	conn, err := Db.Begin()
	_, err = Db.Exec("update larticle set psid = 0 where psid = ?", id)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("更新失败")
	}

	_, err = Db.Exec("delete from hsubject where Usid = ?", id)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		//存在没有该数据，也能删除成功的情况，返回0行，未解决
		return SuccessFail_("删除失败")
	}
	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "删除专题成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//文章投稿(complete)

func ArticleContribute_(ychsw, hsyce, anscj, rywjc string) string {

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	conn, err := Db.Begin()
	_, err = Db.Exec("insert into jexamine(Caid,Usid,Gaccount,Edate) values (?,?,?,?)", ychsw, hsyce, anscj, time)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("更新失败")
	}

	_, err = Db.Exec("insert into umesssubject(Wsender,Qreceiver,Ydate,Carticle,Isubject) values (?,?,?,?,?)", anscj, rywjc, time, ychsw, hsyce)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("更新失败")
	}
	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "投稿申请已发送，请等待管理员审核"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取未投稿文章(complete)

func ArticleNotContribute_(hskcu string) string {

	rows, err := Db.Query("select title from view_article where account = ?", hskcu)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleNotContribute

	for rows.Next() {
		var title string
		err = rows.Scan(&title)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleNotContribute{
			Title: title,
		}
		post.Data = append(post.Data, data)
	}

	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取待审核文章

func ArticleNotExamine_(ueysj string) string {

	rows, err := Db.Query("select id,aid,title,nickname,account,head,date from view_examine")
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleNotExamine

	for rows.Next() {
		var id int
		var aid, title, nickname, account, head, date string
		err = rows.Scan(&id, &aid, &title, &nickname, &account, &head, &date)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleNotExamine{
			Id:       id,
			Aid:      aid,
			Title:    title,
			Nickname: nickname,
			Account:  account,
			Head:     head,
			Date:     date,
		}
		post.Data = append(post.Data, data)
	}

	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("There is no result")
	}
	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//管理待审核文章

func ArticleExamine_ac(eshhd, twrch, imvah, tafvm, uehst string) string {
	//接受

	examineId, err := strconv.Atoi(eshhd)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	conn, err := Db.Begin()
	rows, err := Db.Query("select Caid,Usid,Gaccount from jexamine where Rid = ?", examineId)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Query err")
	}

	var articleId, subjectId, author string
	for rows.Next() {
		err = rows.Scan(&articleId, &subjectId, &author)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		fmt.Println(articleId, subjectId, author)
	}
	_, err = Db.Exec("update larticle set Psid = ? where Xaid = ?", subjectId, articleId)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}

	_, err = Db.Exec("delete from jexamine where Rid = ?", examineId)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Delete err")
	}

	_, err = Db.Exec("update hsubject set Hcountarticle = Hcountarticle + 1 where Usid =  ?", subjectId)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	content := "管理员：" + tafvm + "通过了您的投稿"
	fmt.Println(time, content)
	_, err = Db.Exec("insert into smessage(Esender,Rdate,Pcontent,Oreceiver,GisRead) values (?,?,?,?,0)", imvah, time, content, author)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Insert err")
	}

	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "通过XXX待审核文章成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

func ArticleExamine_fa(eshhd, twrch, imvah, tafvm, uehst string) string {
	//拒绝

	examineId, err := strconv.Atoi(eshhd)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	conn, err := Db.Begin()

	rows, err := Db.Query("select Gaccount from jexamine where Rid = ?", examineId)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Query err")
	}

	var author string
	err = rows.Scan(&author)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Scan err")
	}

	_, err = Db.Exec("delete from jexamine where Rid = ?", examineId)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Delete err")
	}

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	content := "管理员：" + tafvm + "拒绝了您的投稿"
	_, err = Db.Exec("insert into smessage(Esender,Rdate,Pcontent,Oreceiver,GisRead) values (?,?,?,?,0)", imvah, time, content, author)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Insert err")
	}

	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "拒绝XXX待审核文章成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}