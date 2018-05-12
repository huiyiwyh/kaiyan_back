package data

import (
	"encoding/json"
	"log"
	"strconv"
	"time"
)

//获取私信列表

func UserListMessage_(cjfhe, jhsyd string) string {

	limit, err := strconv.Atoi(cjfhe)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "Atoi err")
	}

	Mutex.Lock()

	rows, err := Db.Query("select id,sender,receiver,isRead,nickname,head,content,date from view_message_list where receiver = ? limit ?,8", jhsyd, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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

func UserListDetails_(vijry, shjed, ovpis string) string {
	Mutex.Lock()
	rows, err := Db.Query("select id,sender,receiver,content,head,date,isRead from view_message where sender IN (?, ?)", ovpis, shjed)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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
		return SuccessFail_("0", "Insert err")
	}
	Mutex.Unlock()

	return SuccessFail_("1", "私信传音成功！")
}

//获取评论列表
func UserListComment_(jchem, sjcne string) string {
	Mutex.Lock()
	rows, err := Db.Query("select sender,nickname,head,content,date,article,title from view_comment where account = ? and data < ?", jchem, sjcne)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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
		return SuccessFail_("0", "Insert err")
	}

	Mutex.Unlock()

	return SuccessFail_("1", "回复评论成功！")
}

//获取喜欢列表
func UserListLike_(isujw, hwknc string) string {
	limit, err := strconv.Atoi(hwknc)
	if err != nil {
		log.Println(err)
		return SuccessFail_("0", "Atoi err")
	}

	Mutex.Lock()
	rows, err := Db.Query("select sender,nickname,head,article,title,date from view_messlike where account = ? limit ?,8", isujw, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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
		return SuccessFail_("0", "Atoi err")
	}

	Mutex.Lock()
	rows, err := Db.Query("select sender,nickname,date from view_messfocus where account = ? limit ?,8", msnch, limit)
	if err != nil {
		log.Println(err)
		Mutex.Unlock()
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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
		return SuccessFail_("0", "Query err")
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
			return SuccessFail_("0", "Scan err")
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
		return SuccessFail_("0", "Query err")
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
		return SuccessFail_("0", "Query err")
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
		return SuccessFail_("0", "Query err")
	}

	Mutex.Unlock()
	return SuccessFail_("1", "取消关注成功")
}

//获取专题消息列表
