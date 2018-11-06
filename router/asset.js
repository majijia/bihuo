const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/list",(req,res)=>{
  var {aid,aname1,count1,price1,aname2,count2,price2,aname3,count3,price3,aname4,count4,price4,}=req.query;
  var sql='SELECT a.aid,u.uname,a.aname1,a.count1,a.price1,a.aname2,a.count2,a.price2,a.aname3,a.count3,a.price3,a.aname4,a.count4,a.price4 FROM money_user u Inner Join money_asset a On u.uid=a.aid';
  //console.log(1,sql);
  pool.query(sql,(err,result)=>{
    if (err)  {throw err}
    else{
    res.send(result)
  };
    var sql1="INSERT INTO `money_asset`(`id`, `aid`, `aname1`, `count1`, `price1`,`aname2`, `count2`, `price2`,`aname3`, `count3`, `price3`,`aname4`, `count4`, `price4`) VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    pool.query(sql1,[aid,aname1,count1,price1,aname2,count2,price2,aname3,count3,price3,aname4,count4,price4],(err,result)=>{
    if(err) throw err;
  })
  res.send({code:1,msg:"数据更新成功"});
  })
})

module.exports=router;