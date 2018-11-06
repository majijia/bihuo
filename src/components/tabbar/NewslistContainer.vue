<template>
   <div class="app">
       <header class="mui-bar mui-bar-nav search_head">
			<router-link to="home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">社区</h1>
		</header>
       <!--搜索-->
       <div class="search_one">
        <input type="text" placeholder="请输入您要查找的关键字" v-model="keywords">
        <router-link :to="'searchdetail_two/'+keywords">
          <img src="../../img/home/search_small.png">
        </router-link>
       </div>
       <!--广告图-->
       <div class="ad_img">
          <img src="../../img/home/banner03.png">
        </div>
        <!--卡片--> 
        <router-link to="newsinfo"><div class="mui-card card_one card_only">
                <ul class="card-title">
                    <li><img src="../../img/home/bac_small.png" /></li>
                    <li>烽火台-小菲</li>
                </ul>
                <p class="new_tittle">新人必看:玩转社区与社区发帖规范</p>
                <p class="bac_title">5:辛苦调查员了</p>
				<ul class="btn_bac">
                    <li>精华</li>
                    <li>置顶</li>
                </ul>
                <ul class="bac_subtitle">
                    <li>15回答</li>
                    <li>773阅读</li>
                    <li><router-link to="newsinfo/9"><mt-button type="primary" size="small" class="aswer">回答</mt-button></router-link></li>
                </ul>		
		</div>
        </router-link>
        <router-link to="#">
        <div class="mui-card card_one card_two" v-for="item in list">
                <ul class="card-title">
                    <li><img src="../../img/home/bac_small.png" /></li>
                    <li>烽火台-小菲</li>
                </ul>
                <p class="new_tittle">{{item.title}}</p>
                <p class="bac_title">{{item.content}}</p>
				<ul class="btn_bac">
                    <li>精华</li>
                    <li>置顶</li>
                </ul>
                <ul class="bac_subtitle">
                    <li>{{item.aswer}}回答</li>
                    <li>{{item.cread}}阅读</li>
                    <li><router-link :to="'newsinfo/'+item.id"><mt-button type="primary" size="small" class="aswer">回答</mt-button></router-link></li>
                </ul>
				
		</div>
        </router-link>
        <mt-button id="more" type="primary" size="large" class="more" @click="getMore">查看更多</mt-button>
        <my-tab></my-tab>
  </div>   
</template>
<script>
    import {Toast} from "mint-ui"
    import tab from './tabbar.vue' 
    export default({
        data(){
            return{
                list:[],
                pageIndex:0,
                p:0,
                keywords:""
            }            
        },
        methods:{
            getMore(){
                 var more=document.getElementById("more");
                /*this.pageIndex++;
                var url="newslist/list?pno="+this.pageIndex;
                this.$http.get(url).then(result=>{
                    //this.list=result.body.msg.data;
                    this.list=this.list.concat(result.body.msg.data);
                });*/
                this.pageIndex++;
                if(this.pageIndex==this.p-1){
                    more.style.display="none";
                }               
                var url="newslist/list?pno="+this.pageIndex;
                    //console.log(this.pageIndex);
                this.$http.get(url).then(result=>{
                   //this.list=result.body.msg.data;
                   //console.log(result.body.msg.data)
                    this.list=this.list.concat(result.body.msg.data);
                   //console.log(this.list)
                })
            },
            getNewsList(){
                var url="http://127.0.0.1:3000/newslist/list";
                this.$http.get(url).then(result=>{
                    //console.log(result);
                    if(result.body.code==1){
                        this.list=result.body.msg.data;
                        //console.log(this.list)
                        this.p=result.body.msg.pageCount            
                    }
                    else{
                        Toast("加载新闻分页失败...");
                    }
                })
            }
        },
        components:{
            "my-tab":tab
        },
        created(){
            this.getNewsList();     
        }
    })
</script>
<style scoped>
.mui-icon-back:before, .mui-icon-left-nav:before{
    color:#26a2ff;
}
template{
    margin:0 auto;
}
.app .search_one{
    text-align: center;
    font-size:10px;
    width: 94%;
    display: flex;
    justify-content: space-around;
    position: relative;
    left:0;
} 
   .app .search_one input{
      padding:0;
      width:100%;
      position:absolute;
      padding-left:10%;
      border-radius: 8px;
      margin:10px 0 10px 10px;
      border-color: #eee;
      box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 3px;                                                                           
   }
   .app .search_one img{
       position:absolute;
       width:16px;
       margin-right:20%;
       left:6%;
       margin-top:6%;
   }
   .app .ad_img{
       height:100px;
       text-align: center; 
     }
   .app .ad_img img{
       width:94%;
       border-radius: 4px;
       margin:0 10px 10px 10px;
       position: relative;
       top:60%;
   }
   /*卡片新闻*/
   .app .mui-card.card_one{
       margin-top:16%;
       width:94%;
   }
   .app .mui-card.card_one.card_two{
       margin-top:4%;
       width:94%;
   }
   .app .card_one .card-title{
       list-style: none;
       display: flex;
       flex-direction: row;
       align-items: center;
       padding-left:10px;
       margin-bottom:5px;
       
   }
   .app .card_one .card-title>li>img{
       width:30px;
       margin-right:10px;
      
   }
 .app .card_one .new_tittle{
     margin-left:10px;
     font-size:16px;
     color:#333;
 }
 .app .card_one .bac_title{
     background-color:#f1f1f1;
     width:94%;
     margin-left:10px;
     padding:10px;
     white-space:nowrap;text-overflow:ellipsis;overflow:hidden;
 }
 .app .card_one .btn_bac{
     list-style: none;
     display: flex;
     justify-content: flex-start;
     padding:0px 10px 0 10px;
     margin:0;
 }
 .app .card_one .btn_bac>li:nth-child(1){
     background-color: rgb(205, 239, 255);
     padding:3px 14px 3px 14px;
     color: rgb(29, 146, 255);
     font-size: 13px;
 }
 .app .card_one .btn_bac>li:nth-child(2){
     background-color: rgb(205, 255, 240);
     padding:3px 14px 3px 14px;
     color: rgb(1, 163, 87);
     font-size: 13px;
     margin-left:10px;
 }
 .app .card_one .bac_subtitle{
     list-style: none;
     display: flex;
     justify-content: flex-start;
     align-items: flex-end;
     color:#999;
     padding-left:10px;
 }
 .app .card_one .bac_subtitle li{
     margin-right:5px;

 }
  .app .card_one.card_only .bac_subtitle li:nth-child(3){
      margin:0;
  }
 
 .app .card_one .bac_subtitle li:nth-child(3){
     margin-left:7%;
 }
 .app card_one:nth-child(2) .bac_subtitle label.mint-button--small.aswer{
     margin-left:100%;
 }
 .mint-button--small.aswer{
     margin-left:174px;
 }
.app div:nth-child(4),.app div:nth-child(5){
    margin-top:10px;
}
.app .more{
    margin-bottom:10px;
}
</style>

