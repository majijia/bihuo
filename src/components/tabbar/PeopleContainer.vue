<template>
   <div class="app">
     <!--头部-->
     <header class="mui-bar mui-bar-nav">
			<router-link to="home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left mui_before"></router-link>
			<h1 class="mui-title">个人中心</h1>
		</header>
     <ul class="mui-table-view mui-table-view-chevron">
          <li class="mui-table-view-cell mui-media">
            <a class="mui-navigate-right" href="#account">
              <img class="mui-media-object mui-pull-left head-img" id="head-img" src="../../img/people/peo.png">
              <div class="mui-media-body">
                {{uname}}
                <p class='mui-ellipsis'>账号:11152</p>
              </div>
            </a>
          </li>
			</ul>
      <ul class="second">
        <li>0
          <p>未读消息</p>
        </li>
        <li>0
          <p>订单</p>
        </li>
        <li>1
          <p>积分</p>
        </li>
      </ul>
      <div class="ad">
        <img src="../../img/people/ad.png">
      </div>
      <ul class="main">
        <li><img src="../../img/people/huiyuanzhongxin.png"></li>
        <li>会员中心</li>
        <li><img src="../../img/people/jiantou.png" alt=""></li>
      </ul>
      <ul class="main">
        <li><img src="../../img/people/wodezicahn.png"></li>
        <li>我的资产</li>
        <li><img src="../../img/people/jiantou.png" alt=""></li>
      </ul>
      <ul class="main">
        <li><img src="../../img/people/zichanyuqing.png"></li>
        <li>资产舆情</li>
        <li><img src="../../img/people/jiantou.png" alt=""></li>
      </ul>
      <ul class="main">
        <li><img src="../../img/people/myshoucang.png"></li>
        <li>我的收藏</li>
        <li><img src="../../img/people/jiantou.png" alt=""></li>
      </ul>
      <ul class="main">
        <li><img src="../../img/people/shequguanzhu.png"></li>
        <li>社区关注</li>
        <li><img src="../../img/people/jiantou.png" alt=""></li>
      </ul>
      <ul class="main">
        <li><img src="../../img/people/set.png"></li>
        <li>设置</li>
        <li class="set"><img src="../../img/people/jiantou.png" alt=""></li>
      </ul>
      <my-tab></my-tab>
   </div>
</template>

<script >
   import tab from './tabbar.vue'
   export default({
   data() {
     return{
       uname:""
     }
   },
   methods:{
     islogin(){
      //  var url="http://127.0.0.1:3000/user/islogin";
      //  this.$http.get(url).then(result=>{
      //    console.log(result);
      //  })
      if(sessionStorage.getItem("uname")){
        //在缓存中读取该值 
        this.uname=sessionStorage.getItem("uname")
      }
     }
   },
   created(){
     this.islogin();
     
   },
   components:{
    "my-tab":tab
    }
   })
</script>
<style scoped>
#head-img p.mui-ellipsis img{
  width:10px;
}
.second{
  display: flex;
  list-style: none;
  justify-content: space-around;
  padding:0;
  margin:14px 0 5px 0;
}
.second li{
  align-items: center;
  display: flex;
  flex-direction: column
}
.app .ad{
  text-align: center;
}
.app .ad img{
  width:94%;
  height:50px;
}
.app .main{
  list-style: none;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding:0 0 10px 10px;
  border-bottom:1px solid #eee;
}
.app .main img{
  width:32px;
  margin-right:12px;
}
.app .main li:nth-child(2){
  margin-right:60%;
}
/*设置*/
.app .main li:nth-child(3).set img{
  margin-left:103%;
}
.app .main li:nth-child(3)>img{
  width:20px;
}
.mui-icon-back:before, .mui-icon-left-nav:before{
  color:#26a2ff;
}
</style>