//1:引入模块 pool express
const pool = require("../pool");
const express = require("express");
//2:创建路由对象
var router = express.Router();
//功能一:用户希望获取图片轮播列表
//3:处理请示 GET /list 返回所有图片轮播数据
router.get("/list",(req,res)=>{
  var obj={code:1,msg:[
	  {id:1,img_url:"http://127.0.0.1:3000/img/home/banner1.jpg"},
	  {id:2,img_url:"http://127.0.0.1:3000/img/home/banner3.jpg"},
  ]};
  res.send(obj);
})

//4:导出当前路由模块
module.exports = router;