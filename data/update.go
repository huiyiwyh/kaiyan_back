package data

import (
	"log"
	"time"
)

func Update() {
	for {
		time.Sleep(time.Second * 86400)

		Mutex.Lock()
		rows, err := Db.Query("select Xaccount,Qlabel,Lvalue from vuserlabel")
		if err != nil {
			log.Println(err)
			Mutex.Unlock()
			return
		}

		defer rows.Close()

		for rows.Next() {
			var account, label string
			var value int
			err := rows.Scan(&account, &label, &value)
			if err != nil {
				log.Println(err)
				return
			}

			if value > 3 {
				value = value - 3
			} else {
				value = 0
			}
		}
	}
}
