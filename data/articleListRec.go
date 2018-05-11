package data

import (
	"fmt"
	"log"
	"sort"
	"strconv"
	"strings"
)

//对用户的各个标签值进行排序

//查询文章表中所有文章，
//将标签值与用户完全重合的挑选出来，按照用户标签值排序
//将标签值与用户部分重合的挑选出来，按照用户标签值排序

type RecArticle struct {
	ArticleId string
	LabelNum  int
}

type UserLabel struct {
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

func ArticleListRec(Account string) string {

	labels_num_user := make([]UserLabel, 0) //存放用户标签和值(string,int)
	labels_user := make([]string, 0)        //存放用户标签(string)
	Recartciles := make([]RecArticle, 0)    //存放文章ID(string)-----最终
	recartcilesmatchall := make([]RecArticle, 0)
	recartcilesmatch := make([]RecArticle, 0)

	conn, err := Db.Begin()
	if err != nil {
		log.Println(err)

		return SuccessFail_("0", "Conn err")
	}

	//先查看用户的标签，再查找文章附带标签
	rows, err := Db.Query("select Qlabel,Lvalue from vuserlabel where Xaccount = ? and Otype = 0", Account)
	if err != nil {
		log.Println(err)
		conn.Rollback()
		return SuccessFail_("0", "Query err1")
	}

	for rows.Next() {
		var label int
		var labelnum int
		rows.Scan(&label, &labelnum)
		//fmt.Println(label, labelnum)
		labels_num_user = append(labels_num_user, UserLabel{Label: strconv.Itoa(label), LabelNum: labelnum})
		labels_user = append(labels_user, strconv.Itoa(label))
	}
	//fmt.Println(labels_num_user)
	//fmt.Println(labels_user)

	rows, err = Db.Query("select Xaid,Vlabel from larticle")
	if err != nil {
		log.Println(err)
		conn.Rollback()
		return SuccessFail_("0", "Query err2")
	}
	for rows.Next() {
		var articleid, labelstring string
		rows.Scan(&articleid, &labelstring)

		labels_article := strings.Split(labelstring, "_") //存放文章标签(string)

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
			return SuccessFail_("0", "Query err3")
		}
		if labelmatch == 4 && !newRows.Next() {
			recartcilesmatchall = append(recartcilesmatchall, RecArticle{ArticleId: articleid, LabelNum: labelnum})
		} else if labelmatch <= 3 && labelmatch >= 1 && !newRows.Next() {
			recartcilesmatch = append(recartcilesmatch, RecArticle{ArticleId: articleid, LabelNum: labelnum})
		}
		newRows.Close()
	}

	rows.Close()

	conn.Commit()

	sort.Sort(RecArticleSlice(recartcilesmatchall))
	//fmt.Println(recartcilesmatchall)

	sort.Sort(RecArticleSlice(recartcilesmatch))
	//fmt.Println(recartcilesmatch)

	for index := 0; index < len(recartcilesmatchall); index++ {
		Recartciles = append(Recartciles, recartcilesmatchall[index])
	}

	for index := 0; index < len(recartcilesmatch); index++ {
		Recartciles = append(Recartciles, recartcilesmatch[index])
	}

	fmt.Println(Recartciles)
	return ""
}
