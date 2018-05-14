package data

import (
	"encoding/json"
	"fmt"
	"log"
	"sort"
	"strconv"
	"strings"
)

//对用户的各个标签值进行排序

//查询文章表中所有文章
//将标签值与用户完全重合的挑选出来，按照用户标签值排序
//将标签值与用户部分重合的挑选出来，按照用户标签值排序

type RecArticle struct {
	ArticleId string
	LabelNum  int
}

type UserLabelArticle struct {
	Label    string
	LabelNum int
}

type RecArticleSlice []RecArticle

func (a RecArticleSlice) Len() int { // 重写 Len() 方法
	return len(a)
}
func (a RecArticleSlice) Swap(i, j int) { // 重写 Swap() 方法
	a[i], a[j] = a[j], a[i]
}
func (a RecArticleSlice) Less(i, j int) bool { // 重写 Less() 方法， 从大到小排序
	return a[j].LabelNum < a[i].LabelNum
}

func ArticleListRec_(Account string) string {

	labels_num_user := make([]UserLabelArticle, 0) //存放用户标签和值(string,int)
	labels_user := make([]string, 0)               //存放用户标签(string)
	Recartciles := make([]RecArticle, 0)           //存放文章ID(string)-----最终
	recartcilesmatchall := make([]RecArticle, 0)
	recartcilesmatch := make([]RecArticle, 0)

	Mutex.Lock()
	conn, err := Db.Begin()
	if err != nil {
		log.Println("事物开启失败")
		Mutex.Unlock()
		return SuccessFail_("0", "事物开启失败")
	}

	//先查看用户的标签，再查找文章附带标签
	rows, err := Db.Query("select Qlabel,Lvalue from vuserlabel where Xaccount = ? and Otype = 0", Account)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败1")
	}

	defer rows.Close()

	for rows.Next() {
		var label int
		var labelnum int
		err := rows.Scan(&label, &labelnum)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "赋值失败1")
		}
		fmt.Println(label, labelnum)
		labels_num_user = append(labels_num_user, UserLabelArticle{Label: strconv.Itoa(label), LabelNum: labelnum})
		labels_user = append(labels_user, strconv.Itoa(label))
	}
	fmt.Println(labels_num_user)
	fmt.Println(labels_user)

	rows, err = Db.Query("select Xaid,Vlabel from larticle")
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败2")
	}
	for rows.Next() {
		var articleid, labelstring string
		err := rows.Scan(&articleid, &labelstring)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "赋值失败2")
		}

		labels_article := strings.Split(labelstring, "|") //存放文章标签(string)

		labelmatch := 0
		labelnum := 0

		for i := 0; i < len(labels_user); i++ {
			for j := 0; j < len(labels_article); j++ {
				if labels_user[i] == labels_article[j] {
					labelmatch++
					labelnum = labelnum + labels_num_user[i].LabelNum
				}
			}
		}
		//查阅该文章时否被该用户阅读过
		newRows, err := Db.Query("select * from view_article_history where account = ? and aid = ?", Account, articleid)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败3")
		}

		defer newRows.Close()

		if labelmatch == 4 && !newRows.Next() {
			recartcilesmatchall = append(recartcilesmatchall, RecArticle{ArticleId: articleid, LabelNum: labelnum})
		} else if labelmatch <= 3 && labelmatch >= 1 && !newRows.Next() {
			recartcilesmatch = append(recartcilesmatch, RecArticle{ArticleId: articleid, LabelNum: labelnum})
		}
	}

	sort.Sort(RecArticleSlice(recartcilesmatchall))
	fmt.Println(recartcilesmatchall)

	sort.Sort(RecArticleSlice(recartcilesmatch))
	fmt.Println(recartcilesmatch)

	for index := 0; index < len(recartcilesmatchall); index++ {
		Recartciles = append(Recartciles, recartcilesmatchall[index])
	}

	for index := 0; index < len(recartcilesmatch); index++ {
		Recartciles = append(Recartciles, recartcilesmatch[index])
	}

	var post ArticleListNone
	post.Data = make([]DataArticleListNone, 0)

	for index := 0; index < len(Recartciles); index++ {
		rows, err := Db.Query("select id,sid,subjectName,title,content,account,nickname,head,date,thumbnail,countComment,countLike,countRead from view_article where id = ?", Recartciles[index].ArticleId)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败")
		}

		defer rows.Close()

		if rows.Next() {
			var id, subjectName, title, content, account, nickname, head, date, thumbnail string
			var sid, countComment, countLike, countRead int
			err = rows.Scan(&id, &sid, &subjectName, &title, &content, &account, &nickname, &head, &date, &thumbnail, &countComment, &countLike, &countRead)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
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
	}

	conn.Commit()
	Mutex.Unlock()

	post.Code = "1"
	post.Msg = ""
	result, err := json.MarshalIndent(post, "", " ")
	if err != nil {
		return FailMarshalIndent(err)
	}
	fmt.Println(Recartciles)

	return string(result)

}
