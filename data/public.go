package data

import (
	"encoding/json"
	"log"
	"os"
)

func FailMarshalIndent(err error) string {
	log.Println(err)
	return "transfer to json failed!"
}

//成功失败通用(complete)

func SuccessFail_(msg string) string {
	post := SuccessFail{
		Code: "0",
		Msg:  msg,
	}
	post.Data = make([]DataSuccessFail, 0)

	result, err := json.MarshalIndent(post, "", "  ")
	if err != nil {
		return FailMarshalIndent(err)
	}

	return string(result)
}

//上传文件操作
func PathExists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return false, err
}

func CreateDir(_dir string) {
	var err error
	exist, err := PathExists(_dir)
	if err != nil {
		log.Println(err)
	}
	if exist {
		log.Println(err)
	}
	// 创建文件夹
	err = os.MkdirAll(_dir, os.ModePerm)
	if err != nil {
		log.Println(err)
	}
}
