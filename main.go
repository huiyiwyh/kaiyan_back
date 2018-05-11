package main

import (
	"net/http"
	"time"
)

func main() {
	p("kaiyan", version(), "started at", config.Address)

	mux := http.NewServeMux()

	//
	// 定义所有的路由
	// 处理器定义在其他index.go文件
	//

	// 主页
	mux.HandleFunc("/", index)

	// 错误处理（待定）
	mux.HandleFunc("/err", err)

	//作者接口
	mux.HandleFunc("/author/List", authorList)
	mux.HandleFunc("/author/ListRanking", authorListRanking)

	//专题接口
	mux.HandleFunc("/subject/List", subjectList)
	mux.HandleFunc("/subject/ListFocus", subjectListFocus)
	mux.HandleFunc("/subject/ListDetails", subjectListDetails)
	mux.HandleFunc("/subject/Add", subjectAdd)
	mux.HandleFunc("/subject/Delete", subjectDelete)
	mux.HandleFunc("/subject/UploadSymbol", subjectUploadSymbol)
	mux.HandleFunc("/subject/Focus", subjectFocus)
	mux.HandleFunc("/subject/CancleFocus", subjectCancleFocus)
	mux.HandleFunc("/article/Contribute", articleContribute)
	mux.HandleFunc("/article/NotContribute", articleNotContribute)

	//黑名单接口
	mux.HandleFunc("/black/List", blackList)
	mux.HandleFunc("/black/Add", blackAdd)
	mux.HandleFunc("/black/Delete", blackDelete)

	//文章接口//用户

	mux.HandleFunc("/article/List", articleList)
	mux.HandleFunc("/article/ListRec", articleListRec)
	mux.HandleFunc("/article/ListRanking", articleListRanking)
	mux.HandleFunc("/article/ListHistory", articleListHistory)
	mux.HandleFunc("/article/ListDetails", articleListDetails)
	mux.HandleFunc("/article/ListLike", articleListLike)
	mux.HandleFunc("/article/ListComment", articleListComment)
	mux.HandleFunc("/article/AddComment", articleAddComment)
	mux.HandleFunc("/article/AddHistory", articleAddHistory)
	mux.HandleFunc("/article/AddLike", articleAddLike)
	mux.HandleFunc("/article/DeleteLike", articleDeletelike)
	mux.HandleFunc("/article/UpLoadSymbolNum", articleUploadSymbolNum)
	mux.HandleFunc("/article/UploadSymbol", articleUploadSymbol)
	mux.HandleFunc("/article/UploadPicture", articleUploadPicture)
	mux.HandleFunc("/article/Write", articleWrite)
	mux.HandleFunc("/article/Edit", articleEdit)
	mux.HandleFunc("/article/Cancel", articleCancel)

	//文章接口//管理员
	mux.HandleFunc("/article/NotExamine", articleNotExamine)
	mux.HandleFunc("/article/Examine", articleExamine)

	//搜索接口
	mux.HandleFunc("/search", search)
	mux.HandleFunc("/search/User", searchUser)
	mux.HandleFunc("/search/Subject", searchSubject)
	mux.HandleFunc("/search/Article", searchArticle)
	mux.HandleFunc("/search/Popular", searchPopular)
	mux.HandleFunc("/search/History", searchHistory)
	mux.HandleFunc("/search/Delete", searchDelete)

	//用户接口
	mux.HandleFunc("/user/Login", userLogin)
	mux.HandleFunc("/user/Logout", userLogout)
	mux.HandleFunc("/user/SignUp", userSignUp)
	mux.HandleFunc("/user/Info", userInfo)
	mux.HandleFunc("/user/ModifyHead", userModifyHead)
	mux.HandleFunc("/user/ModifyNickname", userModifyNickname)
	mux.HandleFunc("/user/ModifyBrief", userModifyBrief)
	mux.HandleFunc("/user/ModifyPassword", userModifyPassword)
	mux.HandleFunc("/user/Dynamic", userDynamic)

	server := &http.Server{
		Addr:           config.Address,
		Handler:        mux,
		ReadTimeout:    time.Duration(config.ReadTimeout * int64(time.Second)),
		WriteTimeout:   time.Duration(config.WriteTimeout * int64(time.Second)),
		MaxHeaderBytes: 1 << 20,
	}

	server.ListenAndServe()
}
