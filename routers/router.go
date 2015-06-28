package routers

import (
	"github.com/tobegit3hub/ceph-web/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
