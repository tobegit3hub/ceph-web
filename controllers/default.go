package controllers

import (
        "fmt"
	"net/http"
	"io/ioutil"

	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {

     fmt.Println("hello")

     resp, _ := http.Get("http://192.168.99.100:5000/api/v0.1/health")
     defer resp.Body.Close()

     body, _ := ioutil.ReadAll(resp.Body)

     c.Data["foo"] = string(body)
     c.TplNames = "index.tpl"
}
