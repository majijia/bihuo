<template>
   <div class="app">
      <header class="mui-bar mui-bar-nav">
			<router-link to="product_jinrong" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">资产管理</h1>
		</header>
       <div class="bac_money">
           <img src="../../img/home/bac_money.png">
       </div>
       <div class="bac_money">
           <img src="../../img/home/bac_money.png">
       </div>
    </div>   
</template>
<script>
    export default({
        data(){
            return{
                list:[]
            }
            
        },
        methods:{},
        created(){}
    })
</script>
<style>
.app .bac_money img{
    width:375px;
    border-bottom: 1px solid #f3f3f3;
}
</style>

