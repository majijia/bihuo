<template>
   <div class="app bacHeight">
      <header class="mui-bar mui-bar-nav">
			<router-link to="/newslist" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">问题详情</h1>
		</header>
        <div class="aswer_main">
            <h4>{{newsinfo.title}}</h4>
            <ul class="awser_ul_one">
                <li>{{newsinfo.aswer}}回答</li>
                <li>{{newsinfo.cread}}阅读</li>
            </ul>
            <ul class="aswer card-title">
                <li><img src="../../img/home/bac_small.png" /></li>
                <li>烽火台-小菲</li>
            </ul>
            <div class="aswer_title">{{newsinfo.content}}</div>
            <!--评论区域-->
            <commont_one :id="this.id"></commont_one>   <!--id:发送父组件的id-->
            <!-- <h4>回答</h4>
            <div class="aswer_replay">
                <ul class="awser_ul_two">
                    <li>
                        <ul class="aswer_ul_three">
                            <li><img src="../../img/people/peo.png"></li>
                            <li>
                                <ul class="aswer_ul_four">
                                    <li>烽火台-小菲</li>
                                    <li>对，非常好</li>
                                    <li>
                                        <ul class="aswer_ul_five">
                                            <li><router-link to="#" class="aswer_ul_li">回复</router-link></li>
                                            <li><router-link to="#">删除</router-link></li>
                                        </ul>
                                        
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        
                    </li>
                </ul> 
                <div class="leave"></div> 
            </div>  -->
               
        </div>
       <div class="tab_community">
           <input type="text" placeholder="请输入您的评论" v-model="msg">
           <button @click="postCommont">提交</button>
       </div>
    </div>   
</template>
<script>
import commont from "./commont.vue"
import {Toast} from "mint-ui";
    export default({
        data(){
            return{
                newsinfo:{},
                id:this.$route.params.id,
                msg:""
            }
            
        },
        methods:{
            postCommont(){
              var username="匿名用户";
              var nid=this.id;
              var content=this.msg;
              //console.log(username+":"+nid+":"+content)
              var url="newslist/saveComment";
              console.log(nid);
              var obj={nid:nid,content:content,username:username};
              //console.log(obj)
              this.$http.post(url,obj).then(result=>{
                  //console.log(result)
                  if(result.body.code==1){
                      //说明成功--取消内容
                      this.msg="";
                      //提示成功
                      Toast(result.body.msg);
                      
                     // console.log(1,this.list)
                     setTimeout(function(){
                       location.reload();
                     },500)
                     
                  }
                  else{
                     Toast(result.body.msg); 
                  }
              })
            },
           getNewsInfo(){
               var url="newslist/find?id="+this.id;
               this.$http.get(url).then(result=>{
                   this.newsinfo=result.body.msg[0];
                   
               })
           } 
        },
        created(){
            this.getNewsInfo();
        },
        components:{
           "commont_one":commont
        }
    })
</script>
<style scoped>
/*整体*/
.app .aswer_main{
    margin:6% 3% 0 3%;
}
.app .aswer_main .awser_ul_one{
    list-style: none;
    display: flex;
    padding-left: 0;
    font-size: 14px;
    color:#999;
}
.app .aswer_main .awser_ul_one li{
    margin-right: 10px;
}
/*头像*/
.app .aswer.card-title{
    list-style: none;
    display: flex;
    align-items: center;
    padding-left:0;
    margin-top:10px;
}
.app .aswer.card-title>li>img{
    width:30px;
}
.app .aswer.card-title>li:nth-child(2){
    color:#666;
    font-size: 16px;
    margin-left:5px;
}
/*内容*/
.app .aswer_main .aswer_title{
    font-size: 18px;
    color:#333;
    margin-bottom:15px;
    padding-bottom:15px;
    border-bottom:1px solid #eee;

}
/*评论-回答*/
.app .aswer_main .aswer_replay>.awser_ul_two{
    padding-left:0px;
    }
.app .aswer_main .aswer_replay .aswer_ul_three{
    list-style: none;
    display: flex;
    padding-left: 0;
}
.app .aswer_main .aswer_replay .aswer_ul_three>li>img{
    width:34px;
}
.aswer_ul_four,.aswer_ul_five{
    list-style: none;
    padding-left: 10px;
}
.aswer_ul_four>li{
    margin-top:10px;
}
.aswer_ul_four>li:nth-child(1){
    font-size: 16px;
    color:#999;
}
.aswer_ul_four>li:nth-child(2){
    margin-top:14px;
}
.aswer_ul_five{
    display: flex;
    justify-content: space-between;
    width:300px;
    padding-left:0;
    margin-top:20px;
    font-size: 13px;
}
.aswer_ul_five>li .aswer_ul_li{
    border:1px solid #eee;
    color:#999;
    padding:2px 10px 2px 10px;
}
.leave{
    border:1px solid #eee;
}
.mui-bar mui-bar-tab{
    z-index: 10;
}
/*评论*/
.app .tab_community{
    display: flex;
    width:100%;
    height:120px;
    background-color: #fff;
    justify-content: space-around;
    position: fixed;
    top:617px;
    line-height: 120px;
    box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 8px; 
}
.app .tab_community input{
    width:70%;
    border-radius: 20px;
    height:36px;
    margin-bottom: 0;
    margin-top:7px;
    border:1px solid #ccc;
}
.app .tab_community button{
    padding:4px 24px 4px 24px;
    height:36px;
    border-radius: 20px;
    margin-top:7px;
    border:1px solid #ccc;
    background-color: #26a2ff;
    color:#fff;
    font-size: 16px;
}
</style>

