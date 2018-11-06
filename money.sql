SET NAMES UTF8;
DROP DATABASE IF EXISTS money;
CREATE DATABASE money CHARSET=UTF8;
USE money;

/**用户信息**/
CREATE TABLE money_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);
/*插入用户信息*/
INSERT INTO money_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', '秦小雅', '0');


/*插入新闻表*/
CREATE TABLE money_news(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title   VARCHAR(255),
  content VARCHAR(2000),
  click   INT,
  ctime   DATETIME,
  cread   INT,
  aswer  INT   
);
INSERT INTO money_news VALUES(null,'121','123',0,now(),2,4);
INSERT INTO money_news VALUES(null,'122','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'123','123',0,now(),3,2);
INSERT INTO money_news VALUES(null,'124','123',0,now(),4,2);
INSERT INTO money_news VALUES(null,'125','123',0,now(),6,2);
INSERT INTO money_news VALUES(null,'126','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'127','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'128','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'129','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'1210','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'1211','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'1212','123',0,now(),1,3);
INSERT INTO money_news VALUES(null,'1213','123',0,now(),1,3);



#添加一个新列在原来表中
#购物车...

#创建评论信息表
#xz_comment id nid ctime content user_name isdel[1:0]
CREATE TABLE money_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nid        INT,
  ctime      DATETIME,
  content    VARCHAR(50),
  username   VARCHAR(25),
  isdel      INT
);
INSERT INTO money_comment VALUES(null,1,now(),'211','wh',0);
INSERT INTO money_comment VALUES(null,1,now(),'的减肥减肥看看','wh',0);
INSERT INTO money_comment VALUES(null,1,now(),'大哥大哥哥哥','wh',0);
INSERT INTO money_comment VALUES(null,1,now(),'泛泛而谈','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'255','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'001','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'0008954','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'5642','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'4210','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'001254','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'48','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'fg','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'zxf','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'211','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'211','wh',0);
INSERT INTO money_comment VALUES(null,2,now(),'211','lili',0);


/*创建搜索信息表*/
CREATE TABLE money_search(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname      VARCHAR(16),
  company    VARCHAR(32),
  ctime      DATETIME  ,   
  content    VARCHAR(50),
  title      VARCHAR(255),
  isdel      INT
);
INSERT INTO money_search VALUES(null,'史洪斌','上海欧派文化科技有限公司','2017-05-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'烽火台','欧洲欧派文化艺术有限公司','2017-05-10','每家一话，你目前在什么地方花钱最多？','一直有风格梦想:在海边买套小公寓，正攒钱呢',0);
INSERT INTO money_search VALUES(null,'小菲','云在指尖有限公司','2016-05-10','5:辛苦调查员了','新人必看:玩转社区与社区发帖规范',0);
INSERT INTO money_search VALUES(null,'伟人','广州欧派文化科技有限公司','2017-08-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'烽火台','上海欧派文化科技有限公司','2017-05-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'史洪斌','上海中合农发科技有限公司','2017-09-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'烽火台','上海欧派文化科技有限公司','2017-05-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'史洪斌','北京一电科技科技有限公司','2017-11-20','骗子们最喜欢的中国开头的组织名称，有你眼熟的吗1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'史洪斌','上海健康猫科技有限公司','2018-04-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'小菲','上海欧派文化科技有限公司','2017-05-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'史洪斌','上海健康猫科技有限公司','2017-05-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);
INSERT INTO money_search VALUES(null,'小菲','上海欧派文化科技有限公司','2017-12-10','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗','1骗子们最喜欢的中国开头的组织名称，有你眼熟的吗',0);


/*资产表*/
CREATE TABLE money_asset(
  id INT PRIMARY KEY AUTO_INCREMENT,
  aid     INT,
  aname1   VARCHAR(25),
  count1   INT,
  price1   DECIMAL(10,2),
  aname2   VARCHAR(25),
  count2   INT,
  price2   DECIMAL(10,2),
  aname3   VARCHAR(25),
  count3   INT,
  price3   DECIMAL(10,2),
  aname4   VARCHAR(25),
  count4   INT,
  price4   DECIMAL(10,2),
  aname5   VARCHAR(25),
  count5   INT,
  price5   DECIMAL(10,2),
);
INSERT INTO money_asset VALUES(null,null,'p2p',5,'5.99','基金',60,'10.65','债券',9990,'1','股票',20,'8.9','其他',1.11,'2');
INSERT INTO money_asset VALUES(null,null,'p2p',50,'5.99','基金',100,'9.65','债券',9990,'1','股票',20,'8.9','其他',1.11,'2');
INSERT INTO money_asset VALUES(null,null,'p2p',5,'5.99','基金',60,'10.65','债券',9990,'1','股票',20,'8.9','其他',1.11,'2');
INSERT INTO money_asset VALUES(null,null,'p2p',50,'5.99','基金',100,'9.65','债券',9990,'1','股票',20,'8.9','其他',1.11,'2');
