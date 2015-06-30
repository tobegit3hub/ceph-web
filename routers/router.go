package routers

import (
	"github.com/astaxie/beego"
	"github.com/tobegit3hub/ceph-web/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})
}
