//app.js
//1:加载模块 express
const express = require("express");
const routerImageList=require("./router/imagelist");
const routerNewsList=require("./router/newslist");
const session =require("express-session");
const routerUser=require("./router/user");
const routerAsset=require("./router/asset");
//①引入第三方模块
const bodyParse =require("body-parser");

//2:创建express
var app = express();
app.use(bodyParse.urlencoded({extended:false}));
//2.1:加载处理跨域模块
const cors = require("cors");
//2.2:允许哪个地址跨域访问
app.use(cors({
    origin:["http://127.0.0.1:3001",
        "http://localhost:3001",
        "http://127.0.0.1:3000"],
    credentials:true
}));
//3:绑定监听端口 3000
app.listen(3000);
//4:指定静态目录 public
//__dirname 当前程序所有目录完整路径
//console.log(__dirname)
app.use(express.static(__dirname+"/public"));
app.use(session({
    secret:'随机字符串',
    resave:false,
    saveUninitialized:true
  }));
app.use("/imagelist",routerImageList);
app.use("/newslist",routerNewsList);
app.use("/user",routerUser);
app.use("/asset",routerAsset);
