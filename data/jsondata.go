package data

type SuccessFail struct {
	Code string            `json:"code"`
	Msg  string            `json:"msg"`
	Data []DataSuccessFail `json:"data"`
}

type DataSuccessFail struct {
}

//作者接口文档
//获取作者列表
//1-关注作者列表的成功响应

type AuthorFollow struct {
	Code string             `json:"code"`
	Msg  string             `json:"msg"`
	Data []DataAuthorFollow `json:"data"`
}

type DataAuthorFollow struct {
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
	Aid      string `json:"aid"`
	Title    string `json:"title"`
}

// 2-我的关注列表的成功响应

type AuthorFollowAll struct {
	Code string                `json:"code"`
	Msg  string                `json:"msg"`
	Data []DataAuthorFollowAll `json:"data"`
}

type DataAuthorFollowAll struct {
	Account    string `json:"account"`
	Nickname   string `json:"nickname"`
	Head       string `json:"head"`
	CountWords string `json:"countWords"`
	CountLiked string `json:"countLiked"`
}

// 3-我的粉丝列表的成功响应

type AuthorFans struct {
	Code string           `json:"code"`
	Msg  string           `json:"msg"`
	Data []DataAuthorFans `json:"data"`
}

type DataAuthorFans struct {
	Account    string `json:"account"`
	Nickname   string `json:"nickname"`
	Head       string `json:"head"`
	CountWords string `json:"countWords"`
	CountLiked string `json:"countLiked"`
}

//获取作者排行榜
type AuthorRanking struct {
	Code string              `json:"code"`
	Msg  string              `json:"msg"`
	Data []DataAuthorRanking `json:"data"`
}

type DataAuthorRanking struct {
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
	Aid      string `json:"aid"`
	Title    string `json:"title"`
}

//专题接口文档
//

//新建专题标签

type SubjectUploadSymbol struct {
	Code string `json:"code"`
	Msg  string `json:"msg"`
	Data string `json:"data"`
}

//获取关注专题列表

type SubjectListFocus struct {
	Code string                 `json:"code"`
	Msg  string                 `json:"msg"`
	Data []DataSubjectListFocus `json:"data"`
}

type DataSubjectListFocus struct {
	Id           int    `json:"id"`
	Name         string `json:"name"`
	Brief        string `json:"brief"`
	Thumbnail    string `json:"thumbnail"`
	CountArticle int    `json:"countArticle"`
	CountFocus   int    `json:"countFocus"`
}

//获取专题列表

type SubjectList struct {
	Code string            `json:"code"`
	Msg  string            `json:"msg"`
	Data []DataSubjectList `json:"data"`
}

type DataSubjectList struct {
	Id           int    `json:"id"`
	Name         string `json:"name"`
	Nickname     string `json:"nickname"`
	Thumbnail    string `json:"thumbnail"`
	CountArticle int    `json:"countArticle"`
	CountFocus   int    `json:"countFocus"`
	Date         string `json:"date"`
}

//获取专题详情

type SubjectDetails struct {
	Code string             `json:"code"`
	Msg  string             `json:"msg"`
	Data DataSubjectDetails `json:"data"`
}

type DataSubjectDetails struct {
	IsOwned bool                   `json:"isOwned"`
	Info    DataSubjectDetailsInfo `json:"info"`
}

type DataSubjectDetailsInfo struct {
	Id           int    `json:"id"`
	Name         string `json:"name"`
	Brief        string `json:"brief"`
	Thumbnail    string `json:"thumbnail"`
	Owner        string `json:"owner"`
	Nickname     string `json:"nickname"`
	CountArticle int    `json:"countArticle"`
	CountFocus   int    `json:"countFocus"`
	Label        string `json:"label"`
}

//新建专题

//删除专题

//文章投稿

//获取未投稿文章

type ArticleNotContribute struct {
	Code string                     `json:"code"`
	Msg  string                     `json:"msg"`
	Data []DataArticleNotContribute `json:"data"`
}

type DataArticleNotContribute struct {
	Title string `json:"title"`
}

//获取待审核文章

type ArticleNotExamine struct {
	Code string                  `json:"code"`
	Msg  string                  `json:"msg"`
	Data []DataArticleNotExamine `json:"data"`
}

type DataArticleNotExamine struct {
	Id       int    `josn:"id"`
	Aid      string `json:"aid"`
	Title    string `json:"title"`
	Nickname string `json:"nickname"`
	Account  string `json:"account"`
	Head     string `json:"head"`
	Date     string `json:"date"`
}

//管理待审核文章

//黑名单管理接口文档
//

//获取黑名单列表

type BlackList struct {
	Code string          `json:"code"`
	Msg  string          `json:"msg"`
	Data []DataBlackList `json:"data"`
}

type DataBlackList struct {
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
}

//加入黑名单

//移除黑名单用户

//搜索接口文档
//

//获取热门搜索

type SearchPopular struct {
	Code string              `json:"code"`
	Msg  string              `json:"msg"`
	Data []DataSearchPopular `json:"data"`
}

type DataSearchPopular struct {
	Name string `json:"name"`
}

//获取搜索记录
type SearchHistory struct {
	Code string              `json:"code"`
	Msg  string              `json:"msg"`
	Data []DataSearchHistory `json:"data"`
}

type DataSearchHistory struct {
	Id   string `json:"id"`
	Name string `json:"name"`
}

//清除搜索记录

//初步检索

type Search struct {
	Code string     `json:"code"`
	Msg  string     `json:"msg"`
	Data DataSearch `json:"data"`
}

type DataSearch struct {
	User    []DataSearchUser    `json:"user"`
	Subject []DataSearchSubject `json:"subject"`
	Article []DataSearchArticle `json:"article"`
}

type DataSearchUser struct {
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
}
type DataSearchSubject struct {
	Id        string `json:"id"`
	Name      string `json:"name"`
	Thumbnail string `json:"thumbnail"`
}
type DataSearchArticle struct {
	Id           string `json:"id"`
	Sid          int    `json:"sid"`
	SubjectName  string `json:"subjectName"`
	Title        string `json:"title"`
	Content      string `json:"content"`
	Account      string `json:"account"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//检索相关用户
type SearchUser struct {
	Code string            `json:"code"`
	Msg  string            `json:"msg"`
	Data []DataSearchUser_ `json:"data"`
}

type DataSearchUser_ struct {
	Account  string                   `json:"account"`
	Nickname string                   `json:"nickname"`
	Head     string                   `json:"head"`
	Brief    string                   `json:"brief"`
	Article  []DataSearchUser_Article `json:"article"`
}

type DataSearchUser_Article struct {
	Title string `json:"title"`
	Id    string `json:"id"`
}

//检索相关专题

type SearchSubject struct {
	Code string               `json:"code"`
	Msg  string               `json:"msg"`
	Data []DataSearchSubject_ `json:"data"`
}

type DataSearchSubject_ struct {
	Id           string `json:"id"`
	Name         string `json:"name"`
	Thumbnail    string `json:"thumbnail"`
	Brief        string `json:"brief"`
	CountArticle int    `json:"countArticle"`
	CountFocus   int    `json:"countFocus"`
}

//检索相关文章

type SearchArticle struct {
	Code string              `json:"code"`
	Msg  string              `json:"msg"`
	Data []DataSearchArticle `json:"data"`
}

//用户接口文档
//

//获取个人信息

type UserInfo struct {
	Code string       `json:"code"`
	Msg  string       `json:"msg"`
	Data DataUserInfo `json:"data"`
}

type DataUserInfo struct {
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Brief        string `json:"brief"`
	CountFocus   int    `json:"countFocus"`
	CountFans    int    `json:"countFans"`
	CountLike    int    `json:"countLike"`
	CountArticle int    `json:"countArticle"`
	CountSubject int    `json:"countsubject"`
	Indexback    string `json:"indexback"`
	CountWords   int    `json:"countwords"`
	CountLiked   int    `json:"countLiked"`
}

//修改用户头像

//修改用户昵称

//修改个人简介

//修改登录密码

//获取动态信息

type UserDynamic struct {
	Code string            `json:"code"`
	Msg  string            `json:"msg"`
	Data []DataUserDynamic `json:"data"`
}

type DataUserDynamic struct {
	Key   string `json:"key"`
	Value string `json:"value"`
	Type  int    `json:"type"`
	Date  string `json:"date"`
}

//文章接口文档
//

//获取文章列表

//None

type ArticleListWithNone struct {
	Code string                    `json:"code"`
	Msg  string                    `json:"msg"`
	Data []DataArticleListWithNone `json:"data"`
}

type DataArticleListWithNone struct {
	Id           string `json:"id"`
	Sid          int    `json:"sid"`
	SubjectName  string `json:"subjectName"`
	Title        string `json:"title"`
	Content      string `json:"content"`
	Account      string `json:"account"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//Subject

type ArticleListWithSubject struct {
	Code string                       `json:"code"`
	Msg  string                       `json:"msg"`
	Data []DataArticleListWithSubject `json:"data"`
}

type DataArticleListWithSubject struct {
	Id           string `json:"id"`
	Title        string `json:"title"`
	Account      string `json:"account"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//Account

type ArticleListWithAccount struct {
	Code string                       `json:"code"`
	Msg  string                       `json:"msg"`
	Data []DataArticleListWithAccount `json:"data"`
}

type DataArticleListWithAccount struct {
	Id           string `json:"id"`
	Sid          int    `json:"sid"`
	SubjectName  string `json:"subjectName"`
	Title        string `json:"title"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//获取文章排行榜

type ArticleRanking struct {
	Code string               `json:"code"`
	Msg  string               `json:"msg"`
	Data []DataArticleRanking `json:"data"`
}

type DataArticleRanking struct {
	Id           string `json:"id"`
	Sid          int    `json:"sid"`
	SubjectName  string `json:"subjectName"`
	Title        string `json:"title"`
	Content      string `json:"content"`
	Account      string `json:"account"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//获取喜欢文章

type ArticleLike struct {
	Code string            `json:"code"`
	Msg  string            `json:"msg"`
	Data []DataArticleLike `json:"data"`
}
type DataArticleLike struct {
	Id           int    `json:"id"`
	Author       string `json:"author"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Aid          string `json:"aid"`
	Title        string `json:"title"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//获取历史记录

type ArticleHistory struct {
	Code string               `json:"code"`
	Msg  string               `json:"msg"`
	Data []DataArticleHistory `json:"data"`
}

type DataArticleHistory struct {
	Id           int    `json:"id"`
	Author       string `json:"author"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Aid          string `json:"aid"`
	Title        string `json:"title"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
}

//获取文章详情

type ArticleDetails struct {
	Code string             `json:"code"`
	Msg  string             `json:"msg"`
	Data DataArticleDetails `json:"data"`
}

type DataArticleDetails struct {
	IsLiked bool                   `json:"isLiked"`
	Article DataArticleDetailsInfo `json:"article"`
}

type DataArticleDetailsInfo struct {
	Id           string `json:"id"`
	Account      string `json:"account"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Sid          int    `json:"sid"`
	SubjectName  string `json:"subjectName"`
	Title        string `json:"title"`
	Content      string `json:"content"`
	Date         string `json:"date"`
	Thumbnail    string `json:"thumbnail"`
	CountComment int    `json:"countComment"`
	CountLike    int    `json:"countLike"`
	CountRead    int    `json:"countRead"`
	Label        string `json:"label"`
}

//获取文章评论
type ArticleComment struct {
	Code string               `json:"code"`
	Msg  string               `json:"msg"`
	Data []DataArticleComment `json:"data"`
}

type DataArticleComment struct {
	Article    string                         `json:"article"`
	Sender     string                         `json:"sender"`
	Nickname   string                         `json:"nickname"`
	Head       string                         `json:"head"`
	Receiver   string                         `json:"receiver"`
	Date       string                         `json:"date"`
	Content    string                         `json:"content"`
	SubComment []DataArticleCommentSubComment `json:"subComment"`
}

type DataArticleCommentSubComment struct {
	Article  string `json:"article"`
	Sender   string `json:"sender"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
	Receiver string `json:"receiver"`
	Date     string `json:"date"`
	Content  string `json:"content"`
}

//评论文章

//记录文章阅读信息

//喜欢文章

//取消喜欢文章

//上传标签值

//新建文章标签
type ArticleUploadSymbol struct {
	Code string `json:"code"`
	Msg  string `json:"msg"`
	Data string `json:"data"`
}

//图片上传

type ArticleUnloadPicture struct {
	Code string `json:"code"`
	Msg  string `json:"msg"`
	Data string `json:"data"`
}

//放弃纂写文章

//提交文章

//接口文档
//

//获取私信列表

type UserListMessage struct {
	Code string                `json:"code"`
	Msg  string                `json:"msg"`
	Data []DataUserListMessage `json:"data"`
}

type DataUserListMessage struct {
	Id       string `json:"id"`
	Sender   string `json:"sender"`
	Receiver string `json:"receiver"`
	IsRead   bool   `json:"isRead"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
	Content  string `json:"content"`
	Date     string `json:"date"`
}

//查看私信内容

type UserListMessageDetails struct {
	Code string                       `json:"code"`
	Msg  string                       `json:"msg"`
	Data []DataUserListMessageDetails `json:"data"`
}

type DataUserListMessageDetails struct {
	Id       string `json:"id"`
	Sender   string `json:"sender"`
	Receiver string `json:"receiver"`
	Content  string `json:"content"`
	Head     string `json:"head"`
	Date     string `json:"date"`
	IsRead   bool   `json:"isRead"`
}

//检索好友

type UserSearchFri struct {
	Code string              `json:"code"`
	Msg  string              `json:"msg"`
	Data []DataUserSearchFri `json:"data"`
}

type DataUserSearchFri struct {
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
}

//发送私信

//获取评论列表

type UserListComment struct {
	Code string                `json:"code"`
	Msg  string                `json:"msg"`
	Data []DataUserListComment `json:"data"`
}

type DataUserListComment struct {
	Sender   string `json:"sender"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
	Content  string `json:"content"`
	Date     string `json:"date"`
	Article  string `json:"article"`
	Title    string `json:"title"`
}

//回复评论

//获取喜欢列表
type UserListLike struct {
	Code string             `json:"code"`
	Msg  string             `json:"msg"`
	Data []DataUserListLike `json:"data"`
}

type DataUserListLike struct {
	Sender   string `json:"sender"`
	Nickname string `json:"nickname"`
	Head     string `json:"head"`
	Article  string `json:"article"`
	Title    string `json:"title"`
	Date     string `json:"date"`
}

//获取关注列表

type UserListFocus struct {
	Code string              `json:"code"`
	Msg  string              `json:"msg"`
	Data []DataUserListFocus `json:"data"`
}

type DataUserListFocus struct {
	Sender   string `json:"sender"`
	Nickname string `json:"nickname"`
	Date     string `json:"date"`
}

//获取用户主页信息

type UserListHomeDetails struct {
	Code string                  `json:"code"`
	Msg  string                  `json:"msg"`
	Data DataUserListHomeDetails `json:"data"`
}

type DataUserListHomeDetails struct {
	IsFocused    bool   `json:"isFocused"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Brief        string `json:"brief"`
	CountFocus   int    `json:"countFocus"`
	CountFans    int    `json:"countFans"`
	CountLike    int    `json:"countLike"`
	CountArticle int    `json:"countArticle"`
	CountSubject int    `json:"countSubject"`
	Indexback    string `json:"indexback"`
	CountWords   int    `json:"countWords"`
	CountLiked   int    `json:"countLiked"`
}

//关注用户

//取消关注用户

//获取专题消息列表

//Token

type UserLogin struct {
	Code string        `json:"code"`
	Msg  string        `json:"msg"`
	Data DataUserLogin `json:"data"`
}

type DataUserLogin struct {
	Account      string `json:"account"`
	Nickname     string `json:"nickname"`
	Head         string `json:"head"`
	Brief        string `json:"brief"`
	CountFocus   int    `json:"countFocus"`
	CountFans    int    `json:"countFans"`
	CountLike    int    `json:"countLike"`
	CountArticle int    `json:"countArticle"`
	CountSubject int    `json:"countsubject"`
	Indexback    string `json:"indexback"`
	CountWords   int    `json:"countwords"`
	CountLiked   int    `json:"countLiked"`
	Token        string `json:"token"`
}
