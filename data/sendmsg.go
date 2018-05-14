package data

import (
	"io/ioutil"
	"net/http"
	"net/url"
)

func SmsSend() {

	smsSend("17816923160")
}

func smsSend(phone_number string) {

}

func HttpPostFormReq(api_url string, msg url.Values) ([]byte, error) {
	resp, err := http.PostForm(api_url, msg)
	if nil != resp {
		defer resp.Body.Close()
	}
	if err != nil {
		return nil, err
	}

	//读取json消息
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	return body, nil
}
