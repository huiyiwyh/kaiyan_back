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
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select account, nickname, head from view_blacklist where owner = ? limit ?,10", ewysj, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post BlackList
	post.Data = make([]DataBlackList, 0)
	for rows.Next() {
		var account, head, nickname string
		err = rows.Scan(&account, &nickname, &head)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataBlackList{
			Account:  account,
			Nickname: nickname,
			Head:     head,
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

//加入黑名单(comlpete)

func BlackAdd_(cjrhw, chewj string) string {
	Mutex.Lock()
	_, err := Db.Query("insert into nblacklist(Hblackaccount,Vaccount) values (?,?)", chewj, cjrhw)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败")
	}
	Mutex.Unlock()

	return SuccessFail_("1", "加入黑名单成功！")
}

//移除黑名单用户(complete)

func BlackDelete_(cjnek string) string {
	id, err := strconv.Atoi(cjnek)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()
	_, err = Db.Query("delete from nblacklist where Tbid = ?", id)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "删除失败")
	}
	Mutex.Unlock()
	return SuccessFail_("1", "移除黑名单用户成功！")
}
