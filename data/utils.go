package data

import (
	_ "database/sql"
	"encoding/json"
	"log"
	"sync"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

var Db *sqlx.DB       //主数据库
var Mutex *sync.Mutex //读写互斥锁，每当有数据库操作时，要加锁，数据库操作完再解锁。

//初始化数据库
func init() {
	var err error
	Db, err = sqlx.Open("mysql", "root@/kaiyan")
	if err != nil {
		log.Fatalln(err)
	}
	Mutex = new(sync.Mutex)
}

//成功失败通用(complete)

func SuccessFail_(code, msg string) string {
	post := SuccessFail{
		Code: code,
		Msg:  msg,
	}
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

func FailMarshalIndent(err error) string {
	log.Println(err)
	return "transfer to json failed!"
}

func smsSend(phoneNum string) {

}
