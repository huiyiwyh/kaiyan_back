package data

import (
	"encoding/json"
	"log"
	"math/rand"
	"strconv"
	"time"
)

//搜索接口文档
//

//获取热门搜索(complete)

func SearchPopular_() string {

	rows, err := Db.Query("select * from view_history_search_popular")
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}
	record := 0
	for rows.Next() {
		record++
	}
	rows.Close()

	var post SearchPopular
	post.Data = make([]DataSearchPopular, 0)

	slice := make([]int, 0) //创建用于检验重复随机数的数组，存放已生成的随机数
	for index := 0; index < 10; index++ {
	Rand:
		rand := rand.New(rand.NewSource(time.Now().UnixNano()))
		num := rand.Intn(record)

		//用于检验随机数是否重复
		for i := 0; i < index; i++ {
			if slice[i] == num {
				goto Rand
			}
		}
		slice = append(slice, num)

		rows, err = Db.Query("select content from view_history_search_popular limit ?,10", num)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Query err")
		}

		for rows.Next() {
			var name string
			err = rows.Scan(&name)
			if err != nil {
				log.Println(err)

				return SuccessFail_("0", "Scan err")
			}

			data := DataSearchPopular{
				Name: name,
			}
			post.Data = append(post.Data, data)
		}
	}

	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("0", "There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取搜索记录(complete)

func SearchHistroy_(jehcd string) string {

	rows, err := Db.Query("select id,content from view_history_search where account = ? limit 10", jehcd)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "Query err")
	}

	var post SearchHistory
	post.Data = make([]DataSearchHistory, 0)
	for rows.Next() {
		var id, name string
		err = rows.Scan(&id, &name)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}
		data := DataSearchHistory{
			Id:   id,
			Name: name,
		}
		post.Data = append(post.Data, data)
	}

	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("0", "There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, _ := json.MarshalIndent(post, "", "  ")
	return string(result)
}

//清除搜索记录(complete)

func SearchDelete_(uejsh, yehjc string) string {

	_, err := Db.Exec("delete from yhissearch where Hsid = ? and jaccount = ?", uejsh, yehjc)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "can not delete")
	}

	return SuccessFail_("1", "")
}

//初步检索(complete)

func Search_(okshc string) string {
	okshc = "%" + okshc + "%"
	var post Search
	post.Data.User = make([]DataSearchUser, 0)
	post.Data.Article = make([]DataSearchArticle, 0)
	post.Data.Subject = make([]DataSearchSubject, 0)

	rows, err := Db.Query("select account,nickname,head from view_user where nickname like ? limit 4", okshc)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}

	for rows.Next() {
		var account, nickname, head string
		err = rows.Scan(&account, &nickname, &head)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}

		data := DataSearchUser{
			Account:  account,
			Nickname: nickname,
			Head:     head,
		}
		post.Data.User = append(post.Data.User, data)
	}
	rows.Close()

	rows, err = Db.Query("select id, name, thumbnail from view_subject where name like ? limit 4", okshc)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}

	for rows.Next() {
		var id, name, thumbnail string
		err = rows.Scan(&id, &name, &thumbnail)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}

		data := DataSearchSubject{
			Id:        id,
			Name:      name,
			Thumbnail: thumbnail,
		}
		post.Data.Subject = append(post.Data.Subject, data)
	}
	rows.Close()

	rows, err = Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where title like ? limit 4", okshc)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}

	for rows.Next() {
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}

		data := DataSearchArticle{
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
		post.Data.Article = append(post.Data.Article, data)
	}
	rows.Close()

	if len(post.Data.Article)+len(post.Data.Subject)+len(post.Data.User) < 1 {
		return SuccessFail_("0", "There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//检索相关用户(complete)

func SearchUser_(hwjco, irksh string) string {

	orune := []rune(hwjco)
	nrune := make([]rune, 2*len(orune)+1)
	nrune[0] = '%'
	index := 1

	for _, v := range orune {
		nrune[index] = v
		index++
		nrune[index] = '%'
		index++
	}

	limit, err := strconv.Atoi(irksh)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "Atoi err")
	}

	rows, err := Db.Query("select account,nickname,head from view_user where nickname like ? limit ?,8", string(nrune), limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}

	var post SearchUser
	post.Data = make([]DataSearchUser_, 0)
	for rows.Next() {
		var account, nickname, head, brief string
		err = rows.Scan(&account, &nickname, &head)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}

		data := DataSearchUser_{
			Account:  account,
			Nickname: nickname,
			Head:     head,
			Brief:    brief,
		}

		data.Article = make([]DataSearchUser_Article, 0)
		newrows, err := Db.Query("select title, id from view_article where account = ? limit 2", account)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Query err_")
		}

		for newrows.Next() {
			var id, title string
			err = newrows.Scan(&id, &title)
			if err != nil {
				log.Println(err)

				return SuccessFail_("0", "Scan err")
			}

			article := DataSearchUser_Article{
				Title: title,
				Id:    id,
			}
			data.Article = append(data.Article, article)
		}

		post.Data = append(post.Data, data)
	}

	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("0", "There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//检索相关专题(complete)

func SearchSubject_(hwjco, irksh string) string {

	orune := []rune(hwjco)
	nrune := make([]rune, 2*len(orune)+1)
	nrune[0] = '%'
	index := 1

	for _, v := range orune {
		nrune[index] = v
		index++
		nrune[index] = '%'
		index++
	}

	limit, err := strconv.Atoi(irksh)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "Atoi err")
	}

	rows, err := Db.Query("select id,name,thumbnail,brief,countFocus,countArticle from view_subject where name like ? limit ?,6", string(nrune), limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}

	var post SearchSubject
	post.Data = make([]DataSearchSubject_, 0)
	for rows.Next() {
		var id, name, thumbnail, brief string
		var countFocus, countArticle int
		err = rows.Scan(&id, &name, &thumbnail, &brief, &countFocus, &countArticle)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}

		data := DataSearchSubject_{
			Id:           id,
			Name:         name,
			Thumbnail:    thumbnail,
			Brief:        brief,
			CountFocus:   countFocus,
			CountArticle: countArticle,
		}
		post.Data = append(post.Data, data)
	}

	rows.Close()

	if len(post.Data) < 1 {
		return SuccessFail_("0", "There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

// 检索相关文章(complete)

func SearchArticle_(abehs, jwkah string) string {

	orune := []rune(abehs)
	nrune := make([]rune, 2*len(orune)+1)
	nrune[0] = '%'
	index := 1

	for _, v := range orune {
		nrune[index] = v
		index++
		nrune[index] = '%'
		index++
	}

	limit, err := strconv.Atoi(jwkah)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Atoi err")
	}

	rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where title like ? limit ?,4", string(nrune), limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Query err")
	}

	var post SearchArticle
	post.Data = make([]DataSearchArticle, 0)
	for rows.Next() {
		var id, subjectName, title, content, account, nickname, head, date, thumbnail string
		var sid, countComment, countLike, countRead int
		err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
		if err != nil {
			log.Println(err)

			return SuccessFail_("0", "Scan err")
		}

		data := DataSearchArticle{
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

	if len(post.Data) < 1 {
		return SuccessFail_("0", "There is no result")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}
