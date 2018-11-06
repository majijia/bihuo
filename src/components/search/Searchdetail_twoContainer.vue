<template>
   <div class="app">
       <header class="mui-bar mui-bar-nav search_head">
			<router-link to="/newslist" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">搜索中心</h1>
		</header>
       
        <!--卡片--> 
        <router-link to="newsinfo"><div class="mui-card card_one card_only" v-for="item in list" :key=item.id>
                <ul class="card-title">
                    <li><img src="../../img/home/bac_small.png" /></li>
                    <li>{{item.uname}}</li>
                </ul>
                <p class="new_tittle">{{item.title}}</p>
                <p class="bac_title">{{item.content}}</p>
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
        
  </div>   
</template>
<script>
    import {Toast} from "mint-ui"
    
    export default({
        data(){
            return{
                list:[],
                keywords:this.$route.params.keywords
            }           
        },
        methods:{
           getSearchdetail_two(){
              var url="newslist/searchList?keywords="+this.keywords;
              this.$http.get(url).then(result=>{
                  //console.log(result);
                  this.list=result.body.msg;
                  //console.log(this.list);
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
/*卡片*/
.app .mui-card.card_one.card_only{
    margin-top:20px;
}
template{
    margin:0 auto;
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

