package data

import (
	"encoding/json"
	"fmt"

	"log"
	"strconv"
	"strings"
	"time"
)

//获取文章列表(complete)
//NoneNew
func ArticleListNoneNew(idonx string) string {
	Mutex.Lock()
	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where date < ? limit 6", idonx)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListNone
	post.Data = make([]DataArticleListNone, 0)

	for rows.Next() {
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListNone{
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
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()
	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article limit ?,6", limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListNone
	post.Data = make([]DataArticleListNone, 0)

	for rows.Next() {
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListNone{
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
	Mutex.Lock()
	rows, err := Db.Query("select id,title,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where sid = ? and date < ? limit 6", bvnsj, idonx)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListSubject
	post.Data = make([]DataArticleListSubject, 0)

	for rows.Next() {
		var id, title, account, nickname, head, date, thumbnail string
		var countComment, countLike, countRead int
		err = rows.Scan(&id, &title, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListSubject{
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
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select id,title,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where sid = ? order by countRead desc limit ?,6", bvnsj, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListSubject
	post.Data = make([]DataArticleListSubject, 0)

	for rows.Next() {
		var id, title, account, nickname, head, date, thumbnail string
		var countComment, countLike, countRead int
		err = rows.Scan(&id, &title, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListSubject{
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
	Mutex.Lock()
	rows, err := Db.Query("select id,sid,subjectName,title,date,thumbnail,countComment,countLike,countRead from view_article where account = ? and date < ? limit 6", bvnsj, idonx)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListAccount
	post.Data = make([]DataArticleListAccount, 0)

	for rows.Next() {
		var id, subjectName, title, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListAccount{
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
	Mutex.Lock()
	rows, err := Db.Query("select id,sid,subjectName,title,date,thumbnail,countComment,countLike,countRead from view_article where account = ? limit ?,6", bvnsj, idonx)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListAccount
	post.Data = make([]DataArticleListAccount, 0)

	for rows.Next() {
		var id, subjectName, title, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListAccount{
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
		return SuccessFail_("0", "字符串转字符失败")
	}

	timestamp := time.Now().Unix() - day
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	Mutex.Lock()

	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where date < ? order by countRead desc limit ?,6", time, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListRanking
	post.Data = make([]DataArticleListRanking, 0)

	for rows.Next() {
		var sid, countComment, countLike, countRead int
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListRanking{
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
	Mutex.Lock()
	rows, err := Db.Query("select id,author, nickname, head, aid, title, date, thumbnail,countComment,countLike,countRead from view_article_like where account = ? and date < ? order by date desc limit 6", xdgje, uegsb)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post ArticleListLike
	post.Data = make([]DataArticleListLike, 0)

	for rows.Next() {
		var id, countComment, countLike, countRead int
		var author, nickname, head, aid, title, date, thumbnail string
		err = rows.Scan(&id, &author, &nickname, &head, &aid, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListLike{
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
	Mutex.Lock()
	rows, err := Db.Query("select author, nickname, head, aid, title, date, thumbnail,countComment,countLike,countRead from view_article_history where account = ? and date < ? limit 6", ychwn, siwhb)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()
	Mutex.Unlock()

	var post ArticleListHistory
	post.Data = make([]DataArticleListHistory, 0)

	for rows.Next() {
		var countComment, countLike, countRead int
		var author, nickname, head, aid, title, date, thumbnail string
		err = rows.Scan(&author, &nickname, &head, &aid, &title, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListHistory{
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

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取文章详情

func ArticleListDetails_(rwhcs, uwhgc string) string {
	Mutex.Lock()
	rows, err := Db.Query("select id,account, nickname, head, sid,subjectName, title,content, date, thumbnail,countComment,countLike,countRead,label from view_article where id = ?", rwhcs)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	var post ArticleListDetails

	for rows.Next() {
		var sid, countComment, countLike, countRead int
		var id, account, nickname, head, subjectName, title, content, date, thumbnail, label string
		err = rows.Scan(&id, &account, &nickname, &head, &sid, &subjectName, &title, &content, &date, &thumbnail, &countComment, &countLike, &countRead, &label)
		if err != nil {
			log.Println(err)
			Mutex.Unlock()
			return SuccessFail_("0", "赋值失败")
		}

		post.Data.Article = DataArticleListDetailsInfo{
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

	rows, err = Db.Query("select * from view_article_like where aid = ? and account = ?", rwhcs, uwhgc)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败_")
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
	Mutex.Unlock()

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
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select article,sender,nickname, head, receiver,date,content from view_comment where article = ? and type = 0 limit ?,10", hnksa, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	var post ArticleListComment
	post.Data = make([]DataArticleListComment, 0)

	for rows.Next() {
		var article, sender, nickname, head, receiver, date, content string
		err = rows.Scan(&article, &sender, &nickname, &head, &receiver, &date, &content)
		if err != nil {
			log.Println(err)
			Mutex.Unlock()
			return SuccessFail_("0", "赋值失败")
		}

		data := DataArticleListComment{
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
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败_")
		}
		defer newrows.Close()

		data.SubComment = make([]DataArticleListCommentSubComment, 0)

		for newrows.Next() {
			err = newrows.Scan(&article, &sender, &nickname, &head, &receiver, &date, &content)
			if err != nil {
				log.Println(err)
				Mutex.Unlock()
				return SuccessFail_("0", "赋值失败")
			}

			subComment := DataArticleListCommentSubComment{
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
	}

	Mutex.Unlock()
	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//评论文章

func ArticleAddComment_(iwuus, kalcb, thske, ywhkd, mnsjf string) string {

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	Mutex.Lock()
	_, err := Db.Exec("insert into dmesscomment (Particle,Vsender,Dreceiver,Scontent,Rtype,Odate) values (?,?,?,?,?,?)", iwuus, kalcb, thske, ywhkd, mnsjf, time)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败")
	}
	Mutex.Unlock()
	return SuccessFail_("1", "")
}

//记录文章阅读信息

func ArticleAddHistory_(rqgcm, hcwga, ivhws string) string {
	Mutex.Lock()

	_, err := Db.Exec("update larticle set Oread = Oread + 1 where Xaid = ?", rqgcm)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "更新失败")
	}

	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	_, err = Db.Exec("insert into ohistory(Gaid,Uauthor,Aaccount,Pdate) values(?,?,?,?)", rqgcm, hcwga, ivhws, time)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("1", "插入失败")
	}

	Mutex.Unlock()

	return SuccessFail_("1", "记录成功")
}

//喜欢文章

func ArticleAddLike_(ivwga, rwhcs, uwhgc, mjkns string) string {
	Mutex.Lock()

	conn, err := Db.Begin()
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "事务开启失败")
	}
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	_, err = Db.Exec("insert into fuserlike (Rautaccount,Taid,Vaccount,Idate) values (?,?,?,?)", ivwga, rwhcs, uwhgc, time)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败1")
	}

	_, err = Db.Exec("update larticle set Klike = Klike + 1 where Xaid = ?", ivwga)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "更新失败2")
	}

	_, err = Db.Exec("insert into hmesslike (Ireceiver,Varticle,Ssender,Wdate) values (?,?,?,?)", ivwga, rwhcs, uwhgc, time)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败3")
	}

	symbols := strings.Split(mjkns, "|")

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ? and Otype = 0", uwhgc, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败4")
		}

		defer rows.Close()

		if rows.Next() {
			_, err = Db.Exec("Update vuserlabel set Lvalue = Lvalue + 6 where Xaccount = ? and Qlabel = ? and Otype = 0 and Lvalue <= ?", uwhgc, symbol, MaxLabel-6)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "更新失败5")
			}

			_, err = Db.Exec("Update vuserlabel set Lvalue = ? where Xaccount = ? and Qlabel = ? and Otype = 0 and Lvalue > ?", MaxLabel, uwhgc, symbol, MaxLabel-6)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "更新失败6")
			}
		} else {
			_, err = Db.Exec("Insert into vuserlabel(Xaccount,Qlabel,Lvalue,Otype) values(?,?,6,0)", uwhgc, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "插入失败7")
			}
		}
	}

	conn.Commit()
	Mutex.Unlock()

	return SuccessFail_("1", "XXX操作成功，具体说明到时候再议")
}

//取消喜欢文章
func ArticleDeletelike_(wqsvh, zshrs, uqvcj string) string {
	Mutex.Lock()
	conn, err := Db.Begin()
	if err != nil {
		log.Println("事物开启失败")
		Mutex.Unlock()
		return SuccessFail_("0", "事物开启失败")
	}

	_, err = Db.Exec("delete from fuserlike where Taid = ? and Vaccount = ?", wqsvh, zshrs)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "删除失败")
	}
	_, err = Db.Exec("update larticle set Klike = Klike - 1 where Xaid = ?", wqsvh)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "更新失败")
	}

	symbols := strings.Split(uqvcj, "|")

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ? and Otype = 0", zshrs, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败")
		}

		defer rows.Close()

		if rows.Next() {
			_, err = Db.Exec("update vuserlabel set Lvalue = Lvalue - 6 where Xaccount = ? and Qlabel = ? and Otype = 0 and Lvalue >= 6", zshrs, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "更新失败")
			}

			_, err = Db.Exec("update vuserlabel set Lvalue = 0 where Xaccount = ? and Qlabel = ? and Otype = 0 and Lvalue < 6", zshrs, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "更新失败")
			}
		}
	}

	conn.Commit()
	Mutex.Unlock()

	return SuccessFail_("1", "XXX操作成功，具体说明到时候再议")
}

//上传标签值(complete)

func ArtcileUploadSymbolNum_(wafhc, iryvn, yvhen string) string {
	Mutex.Lock()
	conn, err := Db.Begin()
	if err != nil {
		log.Println("事物开启失败")
		Mutex.Unlock()
		return SuccessFail_("0", "事物开启失败")
	}

	symbols := strings.Split(iryvn, "|")
	fmt.Println(symbols)

	for index := 0; index < len(symbols); index++ {
		symbol, _ := strconv.Atoi(symbols[index])

		rows, err := Db.Query("select * from vuserlabel where Xaccount = ? and  Qlabel = ?", wafhc, symbol)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败")
		}

		defer rows.Close()

		if rows.Next() {
			_, err = Db.Exec("Update vuserlabel set Lvalue = Lvalue + ? where Xaccount = ? and Qlabel = ? and Otype = 0", yvhen, wafhc, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "更新失败")
			}
		} else {
			_, err = Db.Exec("Insert into vuserlabel(Xaccount,Qlabel,Lvalue,Otype) values(?,?,6,0)", wafhc, symbol)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("1", "插入失败")
			}
		}
	}
	conn.Commit()
	Mutex.Unlock()

	return SuccessFail_("1", "XXX操作成功，具体说明到时候再议")
}

//新建文章标签(complete)

func ArticleUploadSymbol_(tgmbj string) string {
	Mutex.Lock()
	rows, err := Db.Query("select Salid from warticlelabel where Uname = ?", tgmbj)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
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
			Mutex.Unlock()
			return SuccessFail_("0", "插入失败")
		}
		newrows, err := Db.Query("select Salid from warticlelabel where Uname = ?", tgmbj)
		var Salid int
		if newrows.Next() {
			newrows.Scan(&Salid)
		}
		defer newrows.Close()

		post.Data = strconv.Itoa(Salid)
		newrows.Close()
	}
	rows.Close()
	Mutex.Unlock()

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

//编辑文章(complete)

func ArticleEdit_(ywjnc, ncdac, porjw, kvdjw, majsh, twgnk string) string {
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	Mutex.Lock()
	_, err := Db.Exec("update larticle set Dtitle = ?,Tcontent = ?,Kpicture = ?,Vlabel = ?,Rdate = ? where Xaid = ? and Vaccount = ?", ncdac, porjw, kvdjw, twgnk, time, ywjnc, majsh)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "更新失败")
	}
	Mutex.Unlock()

	return SuccessFail_("1", "文章编辑成功！")
}

//提交文章(complete)
func ArticleWrite_(twhck, mncsk, uvcns, yvhek, rwkcb, ovjsb string) string {
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")

	Mutex.Lock()
	_, err := Db.Query("insert into larticle (Xaid,Dtitle,Tcontent,Kpicture,Vaccount,Vlabel,Rdate) values (?,?,?,?,?,?,?) ", twhck, mncsk, uvcns, yvhek, rwkcb, ovjsb, time)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败")
	}
	Mutex.Unlock()
	return SuccessFail_("1", "发表文章成功！")
}
