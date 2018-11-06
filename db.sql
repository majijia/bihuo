#db.sql 项目数据库脚本文件
#14:44
#1:创建库    web1806
#注意:库名;表名;列名;英文数字全小写
#常见项目故障就是英文大小写造成
#问题:我自己开发项目一切 OK,上传公司服务器失败
# 自己电脑window 不区分大小写字母
# 公司服务器 linux 严格区分大小写
#注意:mysql bug 编码utf8
#知识储备:公司项目针对手机端(apple)
#将utf8-->utf8mb4
CREATE DATABASE web1806 CHARSET=utf8;
#2:进入      web1806
USE web1806;
#3:创建用户名 xz_user(针对登录)
#建议:用户密码8位以上(有大写;小写;数字;特殊字符)
CREATE TABLE xz_user(
  uid   INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd  VARCHAR(32)
);
INSERT INTO xz_user VALUES(null,'tom',md5('123'));
INSERT INTO xz_user VALUES(null,'dongdong',md5('123'));
INSERT INTO xz_user VALUES(null,'jerry',md5('123'));

#功能一:登录(对数据库查询操作)
#SELECT * FROM xz_user 
#WHERE  uname = 'tom' AND upwd = md5('123');
#建议:
#SELECT count(uid) as c FROM xz_user
#WHERE  uname = 'tom' AND upwd = md5('123');
#图片轮播表 xz_imagelist
CREATE TABLE xz_imagelist(
  id      INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title   VARCHAR(50)
);
INSERT INTO xz_imagelist VALUES(null,
'http://127.0.0.1:3000/img/banner1.png',
'图片1');
INSERT INTO xz_imagelist VALUES(null,
'http://127.0.0.1:3000/img/banner2.png',
'图片2');
INSERT INTO xz_imagelist VALUES(null,
'http://127.0.0.1:3000/img/banner3.png',
'图片3');
INSERT INTO xz_imagelist VALUES(null,
'http://127.0.0.1:3000/img/banner4.png',
'图片4');
#查询:获取;(SELECT )图片轮播所有数据
#添加;保存;插入新数据(INSERT)
#修改数据;更新;(UPDATE)
SELECT id,img_url,title FROM xz_imagelist;

#新闻表 id title ctime click img_url price
#(1)货币数据要求不能任何出差,金融行业
# price INT 单位分  100.50 -> 10050
#(2)为了提高数据健状性
[添加冗余列;muid;mtime]
# i1 int,i2 int,v1 varchar,v2 varchar
# 防止1 2年后，系统升级，为xz_news 添加2列
# 对系统影响比较小
#muid 修改数据用户编号 mtime修改时间
#              [添加删除历史记录表]
#xz_user(uid,uname,upwd)    xz_h_user(uid,uname,upwd)
#[删除用户]              ->  INSERT INTO 

CREATE TABLE xz_news(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title   VARCHAR(255),
  content VARCHAR(2000),
  click   INT,
  img_url VARCHAR(255),
  price   DECIMAL(10,2),
  ctime   DATETIME
);
INSERT INTO xz_news VALUES(null,'121','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'122','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'123','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'124','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'125','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'126','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'127','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'128','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'129','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1210','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1211','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1212','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1213','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1214','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1215','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1216','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1217','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1218','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1219','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1220','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1221','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());
INSERT INTO xz_news VALUES(null,'1233','123',0,
'http://127.0.0.1:3000/banner1.png',0,now());

#添加一个新列在原来表中
#购物车...