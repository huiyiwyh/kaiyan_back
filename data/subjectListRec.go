package data

import (
	"encoding/json"
	"log"
	"sort"
	"strconv"
	"strings"
)

//对用户的各个标签值进行排序

//查询专题表中所有文章，
//将标签值与用户完全重合的挑选出来，按照用户标签值排序
//将标签值与用户部分重合的挑选出来，按照用户标签值排序

type RecSubject struct {
	SubjectId string
	LabelNum  int
}

type UserLabelSubject struct {
	Label    string
	LabelNum int
}

type RecSubjectSlice []RecSubject

func (a RecSubjectSlice) Len() int { // 重写 Len() 方法
	return len(a)
}
func (a RecSubjectSlice) Swap(i, j int) { // 重写 Swap() 方法
	a[i], a[j] = a[j], a[i]
}
func (a RecSubjectSlice) Less(i, j int) bool { // 重写 Less() 方法， 从大到小排序
	return a[j].LabelNum < a[i].LabelNum
}

func SubjectListRec_(Account string) string {

	labelsNumUser := make([]UserLabelSubject, 0) //存放用户标签和值(string,int)
	labelsUser := make([]string, 0)              //存放用户标签(string)
	RecSubjects := make([]RecSubject, 0)         //存放文章ID(string)-----最终
	recSubjectsMatchall := make([]RecSubject, 0)
	recSubjectsMatch := make([]RecSubject, 0)

	Mutex.Lock()
	conn, err := Db.Begin()
	if err != nil {
		log.Println("事物开启失败")
		Mutex.Unlock()
		return SuccessFail_("0", "事物开启失败")
	}

	//先查看用户的标签，再查找专题附带标签
	rows, err := conn.Query("select Qlabel,Lvalue from vuserlabel where Xaccount = ? and Otype = 0", Account)
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
		//fmt.Println(label, labelnum)
		labelsNumUser = append(labelsNumUser, UserLabelSubject{Label: strconv.Itoa(label), LabelNum: labelnum})
		labelsUser = append(labelsUser, strconv.Itoa(label))
	}
	//fmt.Println(labels_num_user)
	//fmt.Println(labels_user)

	rows, err = conn.Query("select Usid,Blabel from hsubject")
	if err != nil {
		log.Println(err)
		conn.Rollback()
		Mutex.Unlock()
		return SuccessFail_("0", "查询失败2")
	}
	for rows.Next() {
		var subjectId, labelString string
		err := rows.Scan(&subjectId, &labelString)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "赋值失败2")
		}

		labelsSubject := strings.Split(labelString, "|") //存放专题标签(string)

		labelMatch := 0
		labelNum := 0

		for i := 0; i < len(labelsUser); i++ {
			for j := 0; j < len(labelsSubject); j++ {
				if labelsUser[i] == labelsSubject[j] {
					labelMatch++
					labelNum = labelNum + labelsNumUser[i].LabelNum
				}
			}
		}

		if labelMatch == 4 {
			recSubjectsMatchall = append(recSubjectsMatchall, RecSubject{SubjectId: subjectId, LabelNum: labelNum})
		} else if labelMatch <= 3 && labelMatch >= 1 {
			recSubjectsMatch = append(recSubjectsMatch, RecSubject{SubjectId: subjectId, LabelNum: labelNum})
		}
	}

	sort.Sort(RecSubjectSlice(recSubjectsMatchall))
	//fmt.Println(recartcilesmatchall)

	sort.Sort(RecSubjectSlice(recSubjectsMatch))
	//fmt.Println(recartcilesmatch)

	for index := 0; index < len(recSubjectsMatchall); index++ {
		RecSubjects = append(RecSubjects, recSubjectsMatchall[index])
	}

	for index := 0; index < len(recSubjectsMatch); index++ {
		RecSubjects = append(RecSubjects, recSubjectsMatch[index])
	}

	//fmt.Println(RecSubjects)
	var post SubjectList
	post.Data = make([]DataSubjectList, 0)

	for index := 0; index < len(RecSubjects); index++ {
		rows, err := Db.Query("select id ,name, nickname,thumbnail,countArticle,countFocus,date from view_subject where id = ?", RecSubjects[index].SubjectId)
		if err != nil {
			log.Println(err)
			conn.Rollback()
			Mutex.Unlock()
			return SuccessFail_("0", "查询失败")
		}

		defer rows.Close()

		for rows.Next() {
			var id, name, nickname, thumbnail, date string
			var countArticle, countFocus int
			err = rows.Scan(&id, &name, &nickname, &thumbnail, &countArticle, &countFocus, &date)
			if err != nil {
				log.Println(err)
				conn.Rollback()
				Mutex.Unlock()
				return SuccessFail_("0", "赋值失败")
			}

			data := DataSubjectList{
				Id:           id,
				Name:         name,
				Nickname:     nickname,
				Thumbnail:    thumbnail,
				CountArticle: countArticle,
				CountFocus:   countFocus,
				Date:         date,
			}
			post.Data = append(post.Data, data)
		}
	}

	conn.Commit()
	Mutex.Unlock()

	post.Code = "1"
	post.Msg = ""

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}
