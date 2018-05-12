package data

import (
	"encoding/json"
	"log"
	"strconv"
)

//作者接口文档
//

//获取作者列表
// 1-关注作者列表的成功响应(complete)

func AuthorListFollow(geacg, iicje string) string {

	limit, err := strconv.Atoi(iicje)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()
	rows, err := Db.Query("select account,nickname,head,aid,title from view_author_focus where owner = ? limit ?,10", geacg, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post AuthorFollow
	post.Data = make([]DataAuthorFollow, 0)

	for rows.Next() {
		var account, nickname, head, aid, title string
		err = rows.Scan(&account, &nickname, &head, &aid, &title)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataAuthorFollow{
			Account:  account,
			Nickname: nickname,
			Head:     head,
			Aid:      aid,
			Title:    title,
		}
		post.Data = append(post.Data, data)
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

// 2-我的关注列表的成功响应(complete)

func AuthorListFollowAll(geacg, iicje string) string {
	limit, err := strconv.Atoi(iicje)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select account, nickname, head,countwords,countliked from view_userfocus where owner = ? limit ?,10", geacg, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post AuthorFollowAll
	post.Data = make([]DataAuthorFollowAll, 0)

	for rows.Next() {
		var account, nickname, head, countWords, countLiked string
		err = rows.Scan(&account, &nickname, &head, &countWords, &countLiked)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataAuthorFollowAll{
			Account:    account,
			Nickname:   nickname,
			Head:       head,
			CountWords: countWords,
			CountLiked: countLiked,
		}
		post.Data = append(post.Data, data)
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

// 3-我的粉丝列表的成功响应(complete)

func AuthorListFans(geacg, iicje string) string {
	limit, err := strconv.Atoi(iicje)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select account,nickname,head,countwords,countliked from view_userfocus where account = ? limit ?,10", geacg, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post AuthorFans
	post.Data = make([]DataAuthorFans, 0)

	for rows.Next() {
		var account, nickname, head, countWords, countLiked string
		err = rows.Scan(&account, &nickname, &head, &countWords, &countLiked)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataAuthorFans{
			Account:    account,
			Nickname:   nickname,
			Head:       head,
			CountWords: countWords,
			CountLiked: countLiked,
		}
		post.Data = append(post.Data, data)
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//获取作者排行榜(缺少对nil返回结果的判断和显示)

func AuthorListRanking_(jeheh string) string {
	limit, err := strconv.Atoi(jeheh)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select account, nickname, head, aid, title from view_rank_author limit ?,10", limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post AuthorRanking
	post.Data = make([]DataAuthorRanking, 0)

	for rows.Next() {
		var account, nickname, head, aid, title string
		err = rows.Scan(&account, &nickname, &head, &aid, &title)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataAuthorRanking{
			Account:  account,
			Nickname: nickname,
			Head:     head,
			Aid:      aid,
			Title:    title,
		}
		post.Data = append(post.Data, data)
	}

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}
