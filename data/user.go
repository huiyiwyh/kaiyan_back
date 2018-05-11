package data

import (
	"encoding/json"
	"fmt"
	"log"
)

//用户接口文档
//

//验证
func Authenticate(bhtdm, opawe string) bool {
	Mutex.Lock()
	rows, err := Db.Query("select * from ruser where Raccount = ? and Ipassword = ?", bhtdm, opawe)
	if err != nil {
		Mutex.Unlock()
		return false
	}

	defer rows.Close()

	if rows.Next() {
		fmt.Println("Yes")
		Mutex.Unlock()
		return true
	}

	fmt.Println("No")
	Mutex.Unlock()
	return false
}

//登陆

//登出

//注册
func UserSignUp_(ywhft, urhsf, iuqng string) string {
	Mutex.Lock()
	_, err := Db.Exec("insert into ruser(Raccount,Hnickname,Ipassword,Jbrief) values (?,?,?,?)", ywhft, urhsf, iuqng, " ")
	if err != nil {
		Mutex.Unlock()
		return SuccessFail_("0", "Insert err")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "通过XXX待审核文章成功！")
}

//获取个人信息(complete)

func UserDetails_(jchen string) string {
	Mutex.Lock()
	rows, err := Db.Query("select nickname,head,brief,countFocus,countFans,countLike,countArticle,countSubject,indexback,countWords,countLiked from view_user where account = ?", jchen)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
	}
	defer rows.Close()
	Mutex.Unlock()

	var post UserInfo

	for rows.Next() {
		var nickname, head, brief, indexback string
		var countFocus, countFans, countLike, countArticle, countSubject, countWords, countLiked int
		err = rows.Scan(&nickname, &head, &brief, &countFocus, &countFans, &countLike, &countArticle, &countSubject, &indexback, &countWords, &countLiked)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "Scan err")
		}

		post.Data = DataUserInfo{
			Nickname:     nickname,
			Head:         head,
			Brief:        brief,
			CountFocus:   countFocus,
			CountFans:    countFans,
			CountLike:    countLike,
			CountArticle: countArticle,
			CountSubject: countSubject,
			Indexback:    indexback,
			CountWords:   countWords,
			CountLiked:   countLiked,
		}
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//修改用户头像(complete)

func UserModifyHead_(hcnsg, yshuc string) string {
	Mutex.Lock()
	_, err := Db.Exec("update ruser set Uhead = ? where Raccount = ?", yshuc, hcnsg)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Update err")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "修改头像成功！")
}

//修改用户昵称(complete)

func UserModifyNickname_(ashce, ytesh string) string {
	Mutex.Lock()
	_, err := Db.Exec("update ruser set Hnickname = ? where Raccount = ?", ytesh, ashce)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Update err")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "修改用户昵称成功！")
}

//修改个人简介(complete)

func UserModifyBrief_(tehas, bncjs string) string {
	Mutex.Lock()
	_, err := Db.Exec("update ruser set Jbrief = ? where Raccount = ?", bncjs, tehas)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Update err")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "修改个人简介成功！")
}

//修改登录密码(complete)(后期需要加上加密解密)

func UserModifyPassword_(jksnd, nklsh, wrqsd string) string {
	Mutex.Lock()
	_, err := Db.Exec("update ruser set Ipassword = ? where Raccount = ? and Ipassword = ?", wrqsd, jksnd, nklsh)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Update err")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "修改登录密码成功！")
}

//获取动态信息(complete)

func UserDynamic_(nhcjs, asxcd string) string {
	Mutex.Lock()
	rows, err := Db.Query("select `key`,value,type,date from view_action where account = ? and date > ? limit 10", nhcjs, asxcd)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
	}

	Mutex.Unlock()

	var post UserDynamic
	post.Data = make([]DataUserDynamic, 0)
	for rows.Next() {
		var key, value, date string
		var type_ int
		err = rows.Scan(&key, &value, &type_, &date)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "Scan err")
		}

		data := DataUserDynamic{
			Key:   key,
			Value: value,
			Type:  type_,
			Date:  date,
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
