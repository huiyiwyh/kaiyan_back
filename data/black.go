package data

import (
	"encoding/json"
	"log"
	"strconv"
)

//黑名单管理接口文档
//

//获取黑名单列表(complete)

func BlackList_(ewysj, uwyhe string) string {

	limit, err := strconv.Atoi(uwyhe)
	if err != nil {
		log.Println()
		return SuccessFail_("Atoi err")
	}

	rows, err := Db.Query("select account, nickname, head from view_blacklist where owner = ? limit ?,10", ewysj, limit)
	if err != nil {
		log.Println(err)

		return SuccessFail_("Query err")
	}

	var post BlackList
	post.Data = make([]DataBlackList, 0)
	for rows.Next() {
		var account, head, nickname string
		err = rows.Scan(&account, &nickname, &head)
		if err != nil {
			log.Println(err)

			return SuccessFail_("Scan err")
		}

		data := DataBlackList{
			Account:  account,
			Nickname: nickname,
			Head:     head,
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

//加入黑名单(comlpete)

func BlackAdd_(cjrhw, chewj string) string {

	_, err := Db.Query("insert into nblacklist(Hblackaccount,Vaccount) values (?,?)", chewj, cjrhw)
	if err != nil {
		log.Println(err)

		return SuccessFail_("failed")
	}

	var post SuccessFail
	post.Code = "1"
	post.Msg = "加入黑名单成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//移除黑名单用户(complete)

func BlackDelete_(cjnek string) string {
	id, err := strconv.Atoi(cjnek)
	if err != nil {
		log.Println(err)
		return SuccessFail_("Atoi err")
	}

	_, err = Db.Query("delete from nblacklist where Tbid = ?", id)
	if err != nil {
		log.Println(err)

		return SuccessFail_("failed")
	}

	var post SuccessFail
	post.Code = "1"
	post.Msg = "移除黑名单用户成功！"
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}
