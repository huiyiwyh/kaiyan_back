package data

import (
	"encoding/json"
	"kaiyan/utils"

	"log"
	"strconv"
	"time"
)

//用户接口文档
//

//登陆

func UserLogin_(bhtdm, opawe string) string {
	Mutex.Lock()
	rows, err := Db.Query("select account,nickname,head,brief,countFocus,countFans,countLike,countArticle,countSubject,indexback,countWords,countLiked from view_user where account = ? and password = ?", bhtdm, opawe)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}
	defer rows.Close()
	Mutex.Unlock()

	var post UserLogin

	if rows.Next() {
		var account, nickname, head, brief, indexback string
		var countFocus, countFans, countLike, countArticle, countSubject, countWords, countLiked int
		err = rows.Scan(&account, &nickname, &head, &brief, &countFocus, &countFans, &countLike, &countArticle, &countSubject, &indexback, &countWords, &countLiked)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		token := utils.CreateToken()

		post.Data = DataUserLogin{
			Account:      account,
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
			Token:        token,
		}
	} else {
		return SuccessFail_("0", "用户名或密码错误")
	}

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//登出

//注册
func UserSignup_(ywhft, iuqng string) string {
	Mutex.Lock()

	rows, err := Db.Query("select * from ruser where Raccount = ?", ywhft)
	if err != nil {
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	if rows.Next() {
		Mutex.Unlock()
		return SuccessFail_("0", "已存在该用户")
	} else {
		//生成一个随机数（6位），并发送给用户
		//smsSend(ywhft, randNum)
		//将生成的code，放入levelDB
	}

	_, err = Db.Exec("insert into ruser(Raccount,Hnickname,Ipassword) values (?,?,?)", ywhft, "u"+ywhft, iuqng)
	if err != nil {
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败")
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
		return SuccessFail_("0", "查询失败")
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
			return SuccessFail_("0", "赋值失败")
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
	_, err := Db.Exec("SET SQL_SAFE_UPDATES = 0;update ruser set Uhead = ? where Raccount = ?;SET SQL_SAFE_UPDATES = 1;", yshuc, hcnsg)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "更新失败")
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
		return SuccessFail_("0", "更新失败")
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
		return SuccessFail_("0", "更新失败")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "修改个人简介成功！")
}

//修改登录密码(complete)(后期需要加上加密解密)

func UserModifyPassword_(jksnd, nklsh, wrqsd string) string {
	Mutex.Lock()
	_, err := Db.Exec("SET SQL_SAFE_UPDATES = 0;update ruser set Ipassword = ? where Raccount = ? and Ipassword = ?;SET SQL_SAFE_UPDATES = 1;", wrqsd, jksnd, nklsh)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "更新失败")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "修改登录密码成功！")
}

//获取动态信息(complete)

func UserDynamic_(nhcjs, asxcd string) string {
	Mutex.Lock()
	rows, err := Db.Query("select `key`,value,type,date from view_action where account = ? and date < ? limit 10", nhcjs, asxcd)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
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
			return SuccessFail_("0", "赋值失败")
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

//获取私信列表

func UserListMessage_(cjfhe, jhsyd string) string {

	limit, err := strconv.Atoi(cjfhe)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()

	rows, err := Db.Query("select id,sender,receiver,isRead,nickname,head,content,date from view_message_list where receiver = ? limit ?,8", jhsyd, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	Mutex.Unlock()

	var post UserListMessage
	post.Data = make([]DataUserListMessage, 0)

	for rows.Next() {
		var id, sender, receiver, nickname, head, content, date string
		var isRead bool

		err := rows.Scan(&id, &sender, &receiver, &isRead, &nickname, &head, &content, &date)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserListMessage{
			Id:       id,
			Sender:   sender,
			Receiver: receiver,
			IsRead:   isRead,
			Nickname: nickname,
			Head:     head,
			Content:  content,
			Date:     date,
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

//查看私信内容

func UserListMessageDetails_(vijry, shjed, ovpis string) string {
	Mutex.Lock()
	rows, err := Db.Query("select id,sender,receiver,content,head,date,isRead from view_message where sender IN (?, ?)", ovpis, shjed)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()
	Mutex.Unlock()

	var post UserListMessageDetails
	post.Data = make([]DataUserListMessageDetails, 0)

	for rows.Next() {
		var id, sender, receiver, content, head, date string
		var isRead bool
		err := rows.Scan(&id, &sender, &receiver, &content, &head, &date, &isRead)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserListMessageDetails{
			Id:       id,
			Sender:   sender,
			Receiver: receiver,
			Content:  content,
			Head:     head,
			Date:     date,
			IsRead:   isRead,
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

//检索好友

func UserSearchFri_(cjeys string) string {
	orune := []rune(cjeys)
	nrune := make([]rune, 2*len(orune)+1)
	nrune[0] = '%'
	index := 1

	for _, v := range orune {
		nrune[index] = v
		index++
		nrune[index] = '%'
		index++
	}

	Mutex.Lock()
	rows, err := Db.Query("select account,nickname,head from view_author_focus where nickname like ?", cjeys)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()
	Mutex.Unlock()

	var post UserSearchFri
	post.Data = make([]DataUserSearchFri, 0)

	for rows.Next() {
		var account, nickname, head string
		err := rows.Scan(&account, &nickname, &head)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserSearchFri{
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

//发送私信

func UserSendMessage_(vjegs, viokr, tshef string) string {
	Mutex.Lock()
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	_, err := Db.Exec("insert into smessage (Esender,Oreceiver,Pcontent,Rdate) values (?,?,?,?)", viokr, vjegs, tshef, time)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败")
	}
	Mutex.Unlock()

	return SuccessFail_("1", "私信传音成功！")
}

//获取评论列表
func UserListComment_(jchem, sjcne string) string {
	Mutex.Lock()
	rows, err := Db.Query("select sender,nickname,head,content,date,article,title from view_comment where account = ? and date < ?", jchem, sjcne)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()
	Mutex.Unlock()

	var post UserListComment
	post.Data = make([]DataUserListComment, 0)

	for rows.Next() {
		var sender, nickname, head, content, date, article, title string
		err := rows.Scan(&sender, &nickname, &head, &content, &date, &article, &title)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserListComment{
			Sender:   sender,
			Nickname: nickname,
			Head:     head,
			Content:  content,
			Date:     date,
			Article:  article,
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

//回复评论

func UserAddComment_(yshen, pcohe, hwtsa, qshey string) string {
	Mutex.Lock()
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	_, err := Db.Query("insert into dmesscomment(Dreceiver,Vsender,Scontent,Particle,Odate)", yshen, pcohe, hwtsa, qshey, time)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "插入失败")
	}

	Mutex.Unlock()

	return SuccessFail_("1", "回复评论成功！")
}

//获取喜欢列表
func UserListLike_(isujw, hwknc string) string {
	limit, err := strconv.Atoi(hwknc)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()
	rows, err := Db.Query("select sender,nickname,head,article,title,date from view_messlike where account = ? limit ?,8", isujw, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()
	Mutex.Unlock()

	var post UserListLike
	post.Data = make([]DataUserListLike, 0)

	for rows.Next() {
		var sender, nickname, head, date, article, title string
		err := rows.Scan(&sender, &nickname, &head, &article, &title, &date)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserListLike{
			Sender:   sender,
			Nickname: nickname,
			Head:     head,
			Article:  article,
			Title:    title,
			Date:     date,
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

//获取关注列表

func UserListFocus_(msnch, ocibe string) string {
	limit, err := strconv.Atoi(ocibe)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "字符串转字符失败")
	}

	Mutex.Lock()
	rows, err := Db.Query("select sender,nickname,date from view_messfocus where account = ? limit ?,8", msnch, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()
	Mutex.Unlock()

	var post UserListFocus
	post.Data = make([]DataUserListFocus, 0)

	for rows.Next() {
		var sender, nickname, date string
		err := rows.Scan(&sender, &nickname, &date)
		if err != nil {
			log.Println(err)
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserListFocus{
			Sender:   sender,
			Nickname: nickname,
			Date:     date,
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

//获取用户主页信息

func UserListHomeDetails_(wtxhn, yjwmk string) string {
	Mutex.Lock()
	rows, err := Db.Query("select nickname,head,brief,countFocus,countFans,countLike,countArticle,countSubject,indexback,countWords,countLiked from view_user", yjwmk)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	defer rows.Close()

	var post UserListHomeDetails

	for rows.Next() {
		var nickname, head, brief, indexback string
		var countFocus, countFans, countLike, countArticle, countSubject, countWords, countLiked int
		err := rows.Scan(&nickname, &head, &brief, &countFocus, &countFans, &countLike, countArticle, &countSubject, &indexback, &countWords, &countLiked)
		if err != nil {
			log.Println(err)
			Mutex.Unlock()
			return SuccessFail_("0", "赋值失败")
		}

		data := DataUserListHomeDetails{
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
		post.Data = data
	}

	rows, err = Db.Query("select * from hautfocus where Tautaccount = ? and Daccount = ?", wtxhn, yjwmk)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")

	}
	if rows.Next() {
		post.Data.IsFocused = true
	} else {
		post.Data.IsFocused = false
	}

	Mutex.Unlock()
	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//关注用户

func UserFocus_(wjvhw, okbaj string) string {
	Mutex.Lock()
	timestamp := time.Now().Unix()
	tm := time.Unix(timestamp, 0)
	time := tm.Format("2006-01-02 15:04")
	_, err := Db.Query("insert into hautfocus(Tautaccount,Daccount,Fdate) values (?,?,?)", wjvhw, okbaj, time)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "关注成功")
}

//取消关注用户

func UserCancelFocus_(ivneh, oapcw string) string {
	Mutex.Lock()
	_, err := Db.Query("delete from hautfocus where Tautaccount = ? and Daccount = ?", ivneh, oapcw)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "取消关注成功")
}
