package main

import (
	"log"
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

	// 错误处理（待定）
	mux.HandleFunc("/err", err)

	//作者接口
	mux.HandleFunc("/author/List", authorList)               //获取作者列表
	mux.HandleFunc("/author/ListRanking", authorListRanking) //获取作者排行榜

	//专题接口
	mux.HandleFunc("/subject/List", subjectList)                   //获取专题列表
	mux.HandleFunc("/subject/ListFocus", subjectListFocus)         //获取关注专题列表
	mux.HandleFunc("/subject/ListDetails", subjectListDetails)     //获取专题详情
	mux.HandleFunc("/subject/Add", subjectAdd)                     //新建专题
	mux.HandleFunc("/subject/Delete", subjectDelete)               //删除专题
	mux.HandleFunc("/subject/UploadSymbol", subjectUploadSymbol)   //新建专题标签
	mux.HandleFunc("/subject/Focus", subjectFocus)                 //关注专题
	mux.HandleFunc("/subject/CancleFocus", subjectCancleFocus)     //取消关注专题
	mux.HandleFunc("/article/Contribute", articleContribute)       //文章投稿
	mux.HandleFunc("/article/NotContribute", articleNotContribute) //获取未投稿文章

	//黑名单接口
	mux.HandleFunc("/black/List", blackList)     //获取黑名单列表
	mux.HandleFunc("/black/Add", blackAdd)       //加入黑名单
	mux.HandleFunc("/black/Delete", blackDelete) //移除黑名单用户

	//文章接口//用户

	mux.HandleFunc("/article/List", articleList)                       //获取文章列表
	mux.HandleFunc("/article/ListRec", articleListRec)                 //推荐
	mux.HandleFunc("/article/ListRanking", articleListRanking)         //获取文章排行榜
	mux.HandleFunc("/article/ListHistory", articleListHistory)         //获取历史记录
	mux.HandleFunc("/article/ListDetails", articleListDetails)         //获取文章详情
	mux.HandleFunc("/article/ListLike", articleListLike)               //获取喜欢文章
	mux.HandleFunc("/article/ListComment", articleListComment)         //获取文章评论
	mux.HandleFunc("/article/AddComment", articleAddComment)           //评论文章
	mux.HandleFunc("/article/AddHistory", articleAddHistory)           //记录文章阅读信息
	mux.HandleFunc("/article/AddLike", articleAddLike)                 //喜欢文章
	mux.HandleFunc("/article/DeleteLike", articleDeletelike)           //取消喜欢文章
	mux.HandleFunc("/article/UpLoadSymbolNum", articleUploadSymbolNum) //上传标签值
	mux.HandleFunc("/article/UploadSymbol", articleUploadSymbol)       //新建文章标签
	mux.HandleFunc("/article/UploadPicture", articleUploadPicture)     //图片上传
	mux.HandleFunc("/article/Write", articleWrite)                     //提交文章（撰写文章）
	mux.HandleFunc("/article/Edit", articleEdit)                       //编辑文章
	mux.HandleFunc("/article/Cancel", articleCancel)                   //放弃纂写文章

	//文章接口//管理员
	mux.HandleFunc("/article/NotExamine", articleNotExamine) //获取待审核文章
	mux.HandleFunc("/article/Examine", articleExamine)       //管理待审核文章

	//搜索接口
	mux.HandleFunc("/search", search)                //初步检索
	mux.HandleFunc("/search/User", searchUser)       //检索相关用户
	mux.HandleFunc("/search/Subject", searchSubject) //检索相关专题
	mux.HandleFunc("/search/Article", searchArticle) //检索相关文章
	mux.HandleFunc("/search/Popular", searchPopular) //获取热门搜索
	mux.HandleFunc("/search/History", searchHistory) //获取搜索记录
	mux.HandleFunc("/search/Delete", searchDelete)   //清除搜索记录

	//用户接口
	mux.HandleFunc("/user/Login", userLogin)                   //登陆
	mux.HandleFunc("/user/Logout", userLogout)                 //登出
	mux.HandleFunc("/user/Signup", userSignup)                 //注册
	mux.HandleFunc("/user/Details", userDetails)               //获取个人信息
	mux.HandleFunc("/user/ModifyHead", userModifyHead)         //修改用户头像
	mux.HandleFunc("/user/ModifyNickname", userModifyNickname) //修改用户昵称
	mux.HandleFunc("/user/ModifyBrief", userModifyBrief)       //修改个人简介
	mux.HandleFunc("/user/ModifyPassword", userModifyPassword) //修改登录密码
	mux.HandleFunc("/user/Dynamic", userDynamic)               //获取动态信息

	mux.HandleFunc("/user/ListMessage", userListMessage)               //获取私信列表
	mux.HandleFunc("/user/ListMessageDetails", userListMessageDetails) //查看私信内容
	mux.HandleFunc("/user/SearchFri", userSearchFri)                   //检索好友
	mux.HandleFunc("/user/SendMessage", userSendMessage)               //发送私信
	mux.HandleFunc("/user/ListComment", userListComment)               //获取评论列表
	mux.HandleFunc("/user/AddComment", userAddComment)                 //回复评论
	mux.HandleFunc("/user/ListLike", userListLike)                     //获取喜欢列表
	mux.HandleFunc("/user/ListFocus", userListFocus)                   //获取关注列表
	mux.HandleFunc("/user/ListHomeDetails", userListHomeDetails)       //获取用户主页信息
	mux.HandleFunc("/user/Focus", userFocus)                           //关注用户
	mux.HandleFunc("/user/CancelFocus", userCancelFocus)               //取消关注用户

	files := http.FileServer(http.Dir(config.Static))
	mux.Handle("/static/", http.StripPrefix("/static/", files)) //静态文件服务器

	server := &http.Server{
		Addr:           config.Address,
		Handler:        mux,
		ReadTimeout:    time.Duration(config.ReadTimeout * int64(time.Second)),
		WriteTimeout:   time.Duration(config.WriteTimeout * int64(time.Second)),
		MaxHeaderBytes: 1 << 20,
	}

	go update()

	err := server.ListenAndServe()
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
