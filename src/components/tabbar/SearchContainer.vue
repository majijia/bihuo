<template>
   <div class="app">
       <header class="mui-bar mui-bar-nav search_head">
			<router-link to="home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">搜索</h1>
		</header>
       <!--搜索-->
       <div class="search_one">
        <input type="text" placeholder="请输入您要查找的关键字" v-model="keywords">
        <router-link :to="'searchdetail/'+keywords">
          <img src="../../img/home/search_small.png" class="search_img">
        </router-link>
       </div>
       <!--标题-->
      <div class="search_title">
          <div>
              <p class="search_old">热门搜索</p>
              <ul class="search_hot">
                  <li><router-link to="searchdetail/中合农发">中合农发</router-link></li>
                  <li><router-link to="searchdetail/欧派文化">欧派文化</router-link></li>
                  <li><router-link to="searchdetail/云在指尖">云在指尖</router-link></li>
                  <li><router-link to="searchdetail/一电科技">一电科技</router-link></li>
                  <li><router-link to="searchdetail/健康猫">健康猫</router-link></li>
                   <li><router-link to="searchdetail/烽火台">烽火台</router-link></li>
                  <li><router-link to="searchdetail/小菲">小菲</router-link></li>
                  <li><router-link to="searchdetail/史海斌">史海斌</router-link></li>
                  <li><router-link to="searchdetail/欧派文化">欧派文化</router-link></li>
                  <li><router-link to="searchdetail/健康猫">健康猫</router-link></li>
              </ul>
          </div>
      </div>
      <my-tab></my-tab>
  </div>   
</template>
<script>
    import tab from "./tabbar.vue"
    export default({
        data(){
            return{
               keywords:"",
               search_list:[],
               history:[]    
            }
            
        },
        methods:{
           searchList(){
                this.history[this.history.length]=this.keywords 
           },
       
        },
        components:{
            "my-tab":tab
        },
        created(){
            this.searchList();
            
        },
        mounted(){
            
        },
        
        
    })
</script>
<style scoped>
.app{
    height:650px;
}
template{
    margin:0 auto;
    background: rgb(0, 132, 255);
}
.app .mui-title{
    color:#fff;
}
.mui-icon-back:before, .mui-icon-left-nav:before{
    color:#26a2ff;
}
.app .mui-bar.search_head{
    background-color:#26a2ff;
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
   .app .search_one img.search_img{
       position:absolute;
       width:16px;
       margin-right:20%;
       left:6%;
       margin-top:6%;
   }
  
  /*搜索框下的标题*/
  .app .search_title{
      margin-top: 18%;
  }
  .app ul{
      list-style: none;
  }
  .app .search_title {
      margin-top:18%;
  }

 /*搜索历史*/
 .app .search_old{
     padding-left:10px;
     font-size: 16px;
 }
/*热门搜索*/
.app .search_hot{
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
    padding:0 10px 0 10px;
    border-bottom:1px solid #eee;
}
.app .search_hot li{
    
    background-color:#eee;
    padding:3px 12px 3px 12px;
    margin:0 10px 10px 0;
    font-size: 10px;
}
.app .search_hot li a{
    color:#666;
}
/*搜索历史*/
.app .search_delet_old{
    padding-right:10px;
    display: flex;
    justify-content: space-between;
}
.app .search_delet_old .search_delet{
    width:24px;
    height:18px;
}
.app .search_old_title{
    padding-left:10px;
    margin-top:10px;
}
.app .search_old_title>li{
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin:0 0 10px 0;
    font-size: 16px;
    padding-bottom:12px;
    border-bottom: 1px solid #eee;
}
.app .search_old_title>li>img{
    width:18px;
    margin-right:12px;
}
.app .search_old_title>li a{
    color:#666;
}
</style>

