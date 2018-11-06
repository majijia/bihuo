<template>
   <div class="app">
       <mt-swipe :auto="4000" class="banner">
          <mt-swipe-item>
              <img src="../../img/home/banner1.jpg">
          </mt-swipe-item>
           <mt-swipe-item>
              <img src="../../img/home/banner3.jpg">
          </mt-swipe-item>
       </mt-swipe>
      <div class="mui-card">
				<div class="mui-card-header">资产管理</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						您还未添加资产
					</div>
                    <mt-button type="primary" size="small" @click="getMoney">{{title}}</mt-button>
				</div>
				<div class="mui-card-footer">
                   <ul>
                       <li><img src="../../img/home/jiantou.jpg">智能计算资产收益</li>
                       <li><img src="../../img/home/jiantou.jpg">风险及时报警</li>
                       <li><img src="../../img/home/jiantou.jpg">每日推送资产舆情</li>
                       <li><img src="../../img/home/jiantou.jpg">风险偏好评测</li>
                   </ul>
                </div>
		</div>
        <!--第二块-->
        <div class="basic">
            <h4>常用功能</h4>
            <div>多种场景 轻松使用</div>
        </div>
        <!--第三块-->
        <div class="card">  
            <router-link to="search"> 
                <img src="../../img/home/search.png">
             </router-link> 
             <router-link to="product_jinrong"> 
                <img src="../../img/home/pro.png">
             </router-link> 
             <router-link to="search"> 
                <img src="../../img/home/pingce.png">
             </router-link>
             <router-link to="search"> 
                <img src="../../img/home/product.png">
             </router-link>
        </div>


        <my-tab></my-tab>
    </div>
      
</template>
<script>
    import tab from './tabbar.vue' 
    export default({
        data(){
            return{
                list:[],
                title:"",
            }
            
        },
        methods:{
            getTitle(){
                if(sessionStorage.getItem("uname")){
                  this.title="资产详情";
                }
                else{
                  this.title="点击详情";
                }
            },
          getMoney(){ 
              if(this.title=="资产详情"){
                  this.$router.push("product_jinrong")
                  
              }
              else{
                  this.$router.push("login")
              }
          }
          
        },
        components:{
            "my-tab":tab
        },
        created(){
            this.getTitle();
           
        }
    })
</script>
<style>
.app{
    background-color:#fff;
}
/*banner*/
.app .banner{
    height:160px;
    margin-bottom:16px;
}
.app .banne mt-swipe-item{
    display: flex;
}
.app .banner img{
    width:100%;
}
/*第一部分*/
.mui-card .mui-card-header{
    font-size:18px ;
    font-weight: bold;
    padding:20px 0 0 10px;
}

.mui-card-footer ul>li>img{
    width:14px;
    margin-right:10px;

}
/*卡片第二部分*/
.mui-card-content{
    display: flex;
    justify-content: space-between;
    padding:10px;
    align-items: flex-end;
    
}
.mui-card-content .mui-card-content-inner{
    padding:0;
    font-size:16px;
    color: #999;
}
/*卡片第三部分*/
.mui-card-footer{
    background-color:#f0f2f5;
    margin:10px;
    height:70px;

}
.mui-card-footer ul{
    list-style: none;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    align-items: center;
    padding:0;
    font-size: 14px;
    color:#999;
}
/*第二主功能*/
.basic{
    margin:30px 0 10px 10px;
}
.basic div{
   font-size: 16px;
    color:#999; 
}
/*第三主功能*/
.card{
    display:flex;
    flex-wrap:wrap;
    justify-content:space-between;
    width:100%;
    padding:10px;
   
}
.card img{
    width:172px;
    height:100px;
    margin-bottom:10px;
}

.mui-card-header:after, .mui-card-footer:before{
    background-color: #fff;
}
</style>

