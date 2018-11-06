const express=require("express");
const pool=require("../pool");
const router=express.Router();

router.get("/list",(req,res)=>{
    var pno=req.query.pno;            //当前页码
    var pageSize=req.query.pageSize;  //页大小

    if(!pno){
        pno=1;
    }
    if(!pageSize){
        pageSize=5;
    }
    var reg=/^[0-5]{1,}$/;
    if(!reg.test(pno)){
        res.send({code:-1,msg:"页码格式不正确"});
        return;
    }
    if(!reg.test(pageSize)){
        res.send({code:-2,msg:"页大小格式不正确"});
        return;
    }
    var obj = {pno:pno,pageSize:pageSize};
    var progress= 0;

    var sql="SELECT  count(id) as c FROM money_news";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        // console.log(1,result);
        // console.log(11,result[0].c);
        var pageCount = Math.ceil(result[0].c/pageSize);
        obj.pageCount = pageCount;

        progress+=50;
        if(progress==100){
            res.send({code:'1',msg:obj});
        }
    });

    var sql=" SELECT * ";
    sql+=" FROM money_news";
    sql+=" LIMIT ?,?";
    var offset=parseInt((pno-1)*pageSize);
    pageSize=parseInt(pageSize);
    pool.query(sql,[offset,pageSize],(err,result)=>{
        if(err) throw err;
        // console.log(2,result);
        progress+=50;
        if(progress==100){
            obj.data = result;
            // console.log(obj);
            res.send({code:'1',msg:obj});
        }
    });

});

//功能二:依据用户id查找新闻详细信息
router.get("/find",(req,res)=>{

    var id = req.query.id;
    // if(!id){
        
    // }
    var sql = " SELECT `id`, `title`, `content`,"
        sql +="  `click`, `cread`, `aswer`  "
        sql+= " `ctime` FROM `money_news` WHERE id=?";

    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send({code:1,msg:result});
    })
})
//http://localhost:3000/newslist/find?id=1

//功能三:分页显示评论列表
router.get("/commentlist",(req,res)=>{
  var pno =req.query.pno;
  var pageSize=req.query.pageSize;
  var nid=parseInt(req.query.nid);
 
  if(!pno){pno=1}
  if(!pageSize){pageSize=5}
 //console.log("1"+pno+pageSize+nid);
    var progress = 0;
    var obj ={pno:pno,pageSize:pageSize};

  var sql=" SELECT count(id) as c FROM money_comment";
      sql+=" WHERE nid=?";
  pool.query(sql,[nid],(err,result)=>{
      if(err) throw err;
      progress+=50;
      var pageCount = Math.ceil(result[0].c/pageSize);

      if(progress==100){
        res.send(obj);
      }
  })
  var offset=parseInt((pno-1)*pageSize);
  pageSize=parseInt(pageSize);      
  var sql=" SELECT `id`, `nid`,";            
      sql+=" `ctime`, `content`, ";
      sql+=" `username`, `isdel` ";
      sql+=" FROM `money_comment`";
      sql+=" WHERE nid=?";
	  sql+=" ORDER BY id DESC";
      sql+=" LIMIT ?,?";
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err) throw err;
      progress+=50;
      obj.data = result;
      if(progress==100){
        res.send(obj);
      }
  })
})
//http:localhost:3000/newslist/commentlist?pno=1&pageSize=5&nid=1

//功能四:添加一条评论
router.post("/saveComment",(req,res)=>{
   
    //console.log(req.body)
    var nid=parseInt(req.body.nid);
    
    var username=req.body.username;
    var content=req.body.content;
   // console.log("2"+nid+username+content);
    if(content.length<2){
     res.send({code:-1,msg:"评论内容必须大于2哦哦!"})
        return;
    }
       
    var sql=" INSERT INTO `money_comment`";
        sql+=" (`id`, `nid`, `ctime`, `content`, `username`, `isdel`) ";
        sql+=" VALUES (null,?,now(),?,?,0)";
    pool.query(sql,[nid,content,username],(err,result)=>{
      if (err)  throw err;
      //console.log(result);
      res.send({code:1,msg:"添加成功"});
    })
  })


//功能五:搜索关键词
router.get("/searchList",(req,res)=>{
    var keywords=req.query.keywords;
    //console.log(keywords)
    var sql=` SELECT * FROM money_search WHERE uname LIKE '%${keywords}%' OR company LIKE '%${keywords}%' OR ctime LIKE '%${keywords}%' OR content LIKE '%${keywords}%' OR title LIKE '%${keywords}%'`;
    //console.log(sql);
    pool.query(sql,keywords,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result})
    })
})
module.exports=router;       