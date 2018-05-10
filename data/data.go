package data

import (
	_ "database/sql"
	"log"
	"sync"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

var Mutex *sync.Mutex //互斥锁，每当有数据库操作时，要加锁，数据库操作完再解锁。

//初始化数据库
func init() {
	var err error
	Db, err = sqlx.Open("mysql", "root@/kaiyan")
	if err != nil {
		log.Fatalln(err)
	}
}
