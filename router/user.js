const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.post("/signin",(req,res)=>{
  var {uname,upwd}=req.body;
 // console.log(1,req.body)
  var sql="select * from money_user where uname=? and upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) console.log(err);
    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8"
    });
    if(result.length>0){
      req.session.uid=result[0].uid;
      console.log(req.session.uid)
      res.write(JSON.stringify({ok:1}))
    }else
      res.write(JSON.stringify({
        ok:0, msg:"用户名或密码错误"
      }))
    res.end();
    //http://localhost:3000/users/signin/?uname=dingding&upwd=123456
  })
})

router.get("/islogin",(req,res)=>{
  if(req.session.uid!==undefined){
    var uid=req.session.uid;
    var sql="select * from money_user where uid=?";
    pool.query(sql,[uid],(err,result)=>{
      if(err) console.log(err);
      res.send({ok:1,uname:result[0].uname})
    })
  }else{
    res.send({ok:0})
  }
})
router.get("/signout",(req,res)=>{
 req.session.uid=undefined;
 res.send();
})
/*注册*/ 
router.get("/register",(req,res)=>{
    var {uname,upwd}=req.query;
    var reg=/^[0-9a-zA-Z]{6,16}$/;
    if(!reg.test(upwd)){
      res.send({code:-1,msg:"密码格式不正确"});
      return;
    }
    var sql="select * from money_user where uname=?";
    pool.query(sql,[uname],(err,result)=>{
      if(err) console.log(err);
      if(result.length>0) {
        res.send({ok:0,msg:"该用户名已存在！"});
         return}
      var sql1="INSERT INTO `money_user`(`uid`, `uname`, `upwd`, `email`, `phone`, `user_name`, `gender`) VALUES (null,?,?,null,null,null,null)";
      pool.query(sql1,[uname,upwd],(req,res)=>{
         if(err)  throw err;
       })
       res.send({ok:1,msg:"注册成功"})
     // res.send({ok:1,uname:result[0].uname})
    })
  
})


module.exports=router;