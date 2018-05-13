package main

import (
	"encoding/json"
	"fmt"

	"io/ioutil"
	"log"
	"os"
)

type Configuration struct {
	Address      string
	ReadTimeout  int64
	WriteTimeout int64
	Static       string
}

var config Configuration
var logger *log.Logger

func p(a ...interface{}) {
	fmt.Println(a)

}

func init() {
	file, err := os.Open("etc/config.json")
	defer file.Close()
	data, err := ioutil.ReadAll(file)
	if err != nil {
		panic("加载配置文件失败")
	}

	config = Configuration{}
	err = json.Unmarshal(data, &config)
	if err != nil {
		panic("解析配置文件失败")
	}

}

// 版本
func version() string {
	return "0.8"
	//基础
	//外域访问
	//增加Token
	//base64解密
	//base64图片上传
	//静态文件服务
	//每天更新机制
	//推荐算法
}
