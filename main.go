package main

import (
	"github.com/astaxie/beego"
	_ "github.com/tobegit3hub/ceph-web/routers"
)

func main() {
	beego.Run()
}
