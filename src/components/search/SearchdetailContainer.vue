<template>
    <div class="app_search">
        <header class="mui-bar mui-bar-nav">
            <router-link to="/search" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">搜索中心</h1>
		</header>
        <!--搜索-->
       <!--列表-->
        <div class="mui-card" v-for="item in list" :key=item.id>
            <div class="mui-card-header mui-card-media title">
                <img src="../../img/people/peo.png"/>
                <p>{{item.company}}</p>
            </div>
           
            <div class="mui-card-footer">
                <ul class="search_ul">
                    <li>
                        <p>法人代表人</p>
                        <p>{{item.uname}}</p>
                    </li>
                    <li>
                        <p>注册资本</p>
                        <p>￥1000.0000万</p>
                    </li>
                    <li>
                        <p>注册时间</p>
                        <p>2017-05-10</p>
                    </li>
                </ul>
            </div>
		</div>
        
    </div>
</template>
<script>
import {Toast} from "mint-ui"
    export default ({
        data(){
            return {
                keywords:this.$route.params.keywords,
                list:[]
            }
        },
        methods:{
            getSearchdetail_two(){
                
              var url="newslist/searchList?keywords="+this.keywords;
              this.$http.get(url).then(result=>{
                  //console.log(result);
                  this.list=result.body.msg;
                  //console.log(this.list); 
                  //console.log(result.body.msg)
                  if(result.body.msg.length==0){
                      Toast("亲~没有此结果哦！！！")
                  }     
        })
        
        }
        },
        created(){
            this.getSearchdetail_two();
        }
    })

</script>
<style scoped>
/*隐藏标题*/
.app_search .mui-bar{
    background-color:#26a2ff;
}
.app_search .mui-card{
    margin:16px 12px 10px 12px;
}
.app_search .mui-card .title{
   display: flex;
   justify-content: flex-start;
  text-align: center;
  border-bottom: 1px solid #eee;
}
.app_search .mui-card .title p{
      margin-left:10px;
      font-size: 16px;
      color:#666;
      margin-top:14px;
    }
    /*分割线*/
    .mui-card-header:after, .mui-card-footer:before{
        height:0px;
    }
    .mui-card-footer{
        background-color: #f9f9f9;
    }
    /*列表*/
    .app_search .mui-card .search_ul{
        width:100%;
        list-style: none;
        display: flex;
        justify-content: space-around;
        text-align: center;
    }
    .app_search .mui-card .search_ul li{
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
    }
.app_search .mui-card .search_ul li p{
        margin-bottom:4px;
        color:#333;
        }
.app_search .mui-card .search_ul li p:nth-child(1){
    color:#999;
}
.app-container{
    height:667px !important;
}
</style>
