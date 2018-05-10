package data

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	"time"
)

//获取文章列表(complete)
//NoneNew
func ArticleListNoneNew(idonx string) string {

	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where date > ?", idonx)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	var post ArticleListWithNone
	post.Data = make([]DataArticleListWithNone, 0)

	for rows.Next() {
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleListWithNone{
			Id:           id,
			Sid:          sid,
			SubjectName:  subjectName,
			Title:        title,
			Content:      content,
			Account:      account,
			Nickname:     nickname,
			Head:         head,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//NonePopular
func ArticleListNonePopular(idonx string) string {

	limit, err := strconv.Atoi(idonx)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article limit ?,10", limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleListWithNone
	post.Data = make([]DataArticleListWithNone, 0)

	for rows.Next() {
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleListWithNone{
			Id:           id,
			Sid:          sid,
			SubjectName:  subjectName,
			Title:        title,
			Content:      content,
			Account:      account,
			Nickname:     nickname,
			Head:         head,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//SubjectNew
func ArticleListSubjectNew(bvnsj, idonx string) string {
	fmt.Println("dddd")

	rows, err := Db.Query("select id,title,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where sid = ? and date > ?", bvnsj, idonx)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleListWithSubject
	post.Data = make([]DataArticleListWithSubject, 0)

	for rows.Next() {
		var id, title, account, nickname, head, date, thumbnail string
		var countComment, countLike, countRead int
		err = rows.Scan(&id, &title, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleListWithSubject{
			Id:           id,
			Title:        title,
			Account:      account,
			Nickname:     nickname,
			Head:         head,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//SubjectPopular
func ArticleListSubjectPopular(bvnsj, idonx string) string {

	limit, err := strconv.Atoi(idonx)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select id,title,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where sid = ? limit ?,10", bvnsj, limit)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	var post ArticleListWithSubject
	post.Data = make([]DataArticleListWithSubject, 0)

	for rows.Next() {
		var id, title, account, nickname, head, date, thumbnail string
		var countComment, countLike, countRead int
		err = rows.Scan(&id, &title, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleListWithSubject{
			Id:           id,
			Title:        title,
			Account:      account,
			Nickname:     nickname,
			Head:         head,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//AccountNew
func ArticleListAccountNew(bvnsj, idonx string) string {

	rows, err := Db.Query("select id,sid,subjectName,title,date,thumbnail,countComment,countLike,countRead from view_article where account = ? and date > ?", bvnsj, idonx)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	var post ArticleListWithAccount
	post.Data = make([]DataArticleListWithAccount, 0)

	for rows.Next() {
		var id, subjectName, title, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleListWithAccount{
			Id:           id,
			Sid:          sid,
			SubjectName:  subjectName,
			Title:        title,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//AccountPopular
func ArticleListAccountPopular(bvnsj, idonx string) string {

	rows, err := Db.Query("select id,sid,subjectName,title,date,thumbnail,countComment,countLike,countRead from view_article where account = ? limit ?,10", bvnsj, idonx)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	var post ArticleListWithAccount
	post.Data = make([]DataArticleListWithAccount, 0)

	for rows.Next() {
		var id, subjectName, title, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleListWithAccount{
			Id:           id,
			Sid:          sid,
			SubjectName:  subjectName,
			Title:        title,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取文章排行榜(complete)
func ArticleListRanking_(ieudh string, day int64) string {
	limit, err := strconv.Atoi(ieudh)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	timestamp := time.Now().Unix() - day
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where date < ? limit ?,10", time, limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleRanking
	post.Data = make([]DataArticleRanking, 0)

	for rows.Next() {
		var sid, countComment, countLike, countRead int
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleRanking{
			Id:           id,
			Sid:          sid,
			SubjectName:  subjectName,
			Title:        title,
			Content:      content,
			Account:      account,
			Nickname:     nickname,
			Head:         head,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")

	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取喜欢文章(complete)

func ArticleListLike_(xdgje, uegsb string) string {

	rows, err := Db.Query("select id,author, nickname, head, aid, title, date, thumbnail,countComment,countLike,countRead from view_article_like where account = ? and date < ?", xdgje, uegsb)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	var post ArticleLike
	post.Data = make([]DataArticleLike, 0)

	for rows.Next() {
		var id, countComment, countLike, countRead int
		var author, nickname, head, aid, title, date, thumbnail string
		err = rows.Scan(&id, &author, &nickname, &head, &aid, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleLike{
			Id:           id,
			Author:       author,
			Nickname:     nickname,
			Head:         head,
			Aid:          aid,
			Title:        title,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取历史记录(complete)
func ArticleListHistory_(ychwn, siwhb string) string {

	rows, err := Db.Query("select id,author, nickname, head, aid, title, date, thumbnail,countComment,countLike,countRead from view_article_history where account = ? and date < ?", ychwn, siwhb)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleHistory
	post.Data = make([]DataArticleHistory, 0)

	for rows.Next() {
		var id, countComment, countLike, countRead int
		var author, nickname, head, aid, title, date, thumbnail string
		err = rows.Scan(&id, &author, &nickname, &head, &aid, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleHistory{
			Id:           id,
			Author:       author,
			Nickname:     nickname,
			Head:         head,
			Aid:          aid,
			Title:        title,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
		}
		post.Data = append(post.Data, data)
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取文章详情(complete)

func ArticleListDetails_(rwhcs, uwhgc string) string {
	rows, err := Db.Query("select id,account, nickname, head, sid,subjectName, title,content, date, thumbnail,countComment,countLike,countRead,label from view_article where id = ? and account = ?", rwhcs, uwhgc)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleDetails

	for rows.Next() {
		var sid, countComment, countLike, countRead int
		var id, account, nickname, head, subjectName, title, content, date, thumbnail, label string
		err = rows.Scan(&id, &account, &nickname, &head, &sid, &subjectName, &title, &content, &date, &thumbnail, &countComment, &countLike, &countRead, &label)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		post.Data.Article = DataArticleDetailsInfo{
			Id:           id,
			Account:      account,
			Nickname:     nickname,
			Head:         head,
			Sid:          sid,
			SubjectName:  subjectName,
			Title:        title,
			Content:      content,
			Date:         date,
			Thumbnail:    thumbnail,
			CountComment: countComment,
			CountLike:    countLike,
			CountRead:    countRead,
			Label:        label,
		}
	}
	rows.Close()

	rows, err = Db.Query("select * from view_article_like where aid = ? and account = ?", rwhcs, uwhgc)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err_")
	}
	record := 0
	for rows.Next() {
		record++
	}

	if record > 0 {
		post.Data.IsLiked = true
	} else {
		post.Data.IsLiked = false
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取文章评论(complete)

func ArticleListComment_(hnksa, ncvbs string) string {

	limit, err := strconv.Atoi(ncvbs)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select article,sender,nickname, head, receiver,date,content from view_comment where article = ? and type = 0 limit ?,10", hnksa, limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post ArticleComment
	post.Data = make([]DataArticleComment, 0)

	for rows.Next() {
		var article, sender, nickname, head, receiver, date, content string
		err = rows.Scan(&article, &sender, &nickname, &head, &receiver, &date, &content)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataArticleComment{
			Article:  article,
			Sender:   sender,
			Nickname: nickname,
			Head:     head,
			Receiver: receiver,
			Date:     date,
			Content:  content,
		}

		newrows, err := Db.Query("select article,sender,nickname, head, receiver,date,content from view_comment where receiver = ? and type = 1", sender)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Query err_")
		}

		data.SubComment = make([]DataArticleCommentSubComment, 0)

		for newrows.Next() {
			err = newrows.Scan(&article, &sender, &nickname, &head, &receiver, &date, &content)
			if err != nil {
				log.Println(err)

				return SuccessFail_("Scan err")
			}

			subComment := DataArticleCommentSubComment{
				Article:  article,
				Sender:   sender,
				Nickname: nickname,
				Head:     head,
				Receiver: receiver,
				Date:     date,
				Content:  content,
			}
			data.SubComment = append(data.SubComment, subComment)
		}
		post.Data = append(post.Data, data)
		newrows.Close()
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//评论文章(can not add or update a child row)

func ArticleAddComment_(iwuus, kalcb, thske, ywhkd, mnsjf string) string {

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	_, err := Db.Exec("insert into dmesscomment (Particle,Vsender,Dreceiver,Scontent,Rtype,Odate) values (?,?,?,?,?,?)", iwuus, kalcb, thske, ywhkd, mnsjf, time)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Insert err")
	}

	var post SuccessFail
	post.Code = "1"
	post.Msg = ""
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//记录文章阅读信息(complete)

func ArticleAddHistory_(rqgcm, ivhws string) string {

	conn, err := Db.Begin()

	_, err = Db.Exec("update larticle  set Oread = Oread + 1 where Xaid = ? and Vaccount = ?", rqgcm, ivhws)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	_, err = Db.Exec("insert into ohistory(Gaid,Aaccount,Pdate) values(?,?,?)", rqgcm, ivhws, time)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Insert err")
	}
	conn.Commit()

	var post SuccessFail
	post.Code = "1"
	post.Msg = "记录成功"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//喜欢文章

func ArticleAddLike_(ivwga, rwhcs, uwhgc, mjkns string) string {

	conn, err := Db.Begin()

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	_, err = Db.Query("insert into fuserlike (Rautaccount,Taid,Vaccount,Idate) values (?,?,?,?)", ivwga, rwhcs, uwhgc, time)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Insert err")
	}

	_, err = Db.Exec("update larticle set Klike = Klike + 1 where Xaid = ?", ivwga)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}

	_, err = Db.Exec("insert into hmesslike (Ireceiver,Varticle,Ssender,Wdate) values (?,?,?,?)", ivwga, rwhcs, uwhgc, time)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Insert_ err")
	}

	symbols := strings.Split(mjkns, "|")

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ? and Otype = 0", uwhgc, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Query" + symbols[index] + "err")
		}

		if rows.Next() {
			_, err = Db.Exec("Update vuserlabel set Lvalue = Lvalue + 6 where Xaccount = ? and Qlabel = ? and Otype = 0", uwhgc, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()

				return SuccessFail_("Update" + symbols[index] + "err")
			}
		} else {
			_, err = Db.Exec("Insert into vuserlabel(Xaccount,Qlabel,Lvalue,Otype) values(?,?,6,0)", uwhgc, symbol)
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

//取消喜欢文章
func ArticleDeletelike_(wqsvh, zshrs, uqvcj string) string {

	conn, err := Db.Begin()

	_, err = Db.Exec("delete from fuserlike where Taid = ? and Vaccount = ?", wqsvh, zshrs)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Delete err")
	}
	_, err = Db.Exec("update larticle set Klike = Klike - 1 where Xaid = ?", wqsvh)
	if err != nil {
		log.Println(err)
		conn.Rollback()

		return SuccessFail_("Update err")
	}

	symbols := strings.Split(uqvcj, "|")

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ? and Otype = 0", zshrs, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Query" + symbols[index] + "err")
		}

		if rows.Next() {
			_, err = Db.Exec("update vuserlabel set Lvalue = Lvalue - 6 where Xaccount = ? and Qlabel = ? and Otype = 0", zshrs, symbol)
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

//上传标签值(complete)

func ArtcileUploadSymbolNum_(wafhc, iryvn, yvhen string) string {

	conn, err := Db.Begin()

	symbols := strings.Split(iryvn, "|")
	fmt.Println(symbols)

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ?", wafhc, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()

			return SuccessFail_("Query" + symbols[index] + "err")
		}

		if rows.Next() {
			_, err = Db.Exec("Update vuserlabel set Lvalue = Lvalue - ? where Xaccount = ? and Qlabel = ?", yvhen, wafhc, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()

				return SuccessFail_("Update" + symbols[index] + "err")
			}
		} else {
			_, err = Db.Exec("Insert into vuserlabel(Xaccount,Qlabel,Lvalue,Otype) values(?,?,6,0)", wafhc, symbol)
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

//新建文章标签(complete)

func ArticleUploadSymbol_(tgmbj string) string {

	rows, err := Db.Query("select Salid from warticlelabel where Uname = ?", tgmbj)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Query err")
	}

	var post ArticleUploadSymbol
	var Salid int
	if rows.Next() {
		rows.Scan(&Salid)
		post.Data = strconv.Itoa(Salid)
	} else {
		_, err := Db.Exec("insert into warticlelabel(Uname) values (?)", tgmbj)
		if err != nil {
			log.Println(err)
			return SuccessFail_("Insert err")
		}
		newrows, err := Db.Query("select Salid from warticlelabel where Uname = ?", tgmbj)
		var Salid int
		if newrows.Next() {
			newrows.Scan(&Salid)
		}
		post.Data = strconv.Itoa(Salid)
		newrows.Close()
	}
	rows.Close()

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//图片上传(complete)

func ArticleUploadPicture_(twhck string) string {

	var post ArticleUnloadPicture
	post.Code = "1"
	post.Msg = "XXX操作成功，具体说明到时候再议"
	post.Data = twhck

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//放弃纂写文章(complete)

func ArticleCancel_(iuhwc string) string {

	_dir := "article/" + iuhwc

	exist, err := PathExists(_dir)
	if !exist {
		log.Println(err)
		return SuccessFail_("文件夹不存在")
	}

	err = os.RemoveAll(_dir)
	if err != nil {
		log.Println(err)
		return SuccessFail_("文件删除失败")
	}

	var post SuccessFail
	post.Code = "1"
	post.Msg = "文章放弃成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//编辑文章(complete)

func ArticleEdit_(ywjnc, ncdac, porjw, kvdjw, majsh, twgnk string) string {

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	_, err := Db.Exec("update larticle set Dtitle = ?,Tcontent = ?,Kpicture = ?,Vlabel = ?,Rdate = ? where Xaid = ? and Vaccount = ?", ncdac, porjw, kvdjw, twgnk, time, ywjnc, majsh)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Update err")
	}

	var post SuccessFail
	post.Code = "1"
	post.Msg = "文章编辑成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//提交文章(complete)
func ArticleWrite_(twhck, mncsk, uvcns, yvhek, rwkcb, ovjsb string) string {

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time_ := tm.Format("060102150405")
	time := tm.Format("2006-01-02 15:04")

	_, err := Db.Query("insert into larticle (Xaid,Dtitle,Tcontent,Kpicture,Vaccount,Vlabel,Rdate) values (?,?,?,?,?,?,?) ", rwkcb+time_, twhck, mncsk, uvcns, yvhek, rwkcb, ovjsb, time)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Insert err")
	}

	var post SuccessFail
	post.Code = "1"
	post.Msg = "发表文章成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}
