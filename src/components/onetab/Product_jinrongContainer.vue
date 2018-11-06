<template>
   <div class="app container">
     <header class="mui-bar mui-bar-nav">
			<router-link to="home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">资产管理</h1>
		</header>
        <ul class="product_p">
            <li>
                <router-link to="moneymore">
                    <img src="../../img/home/p.png" alt="">
                </router-link>
            </li>
            <li>
                <router-link  to="moneymore">
                    <img src="../../img/home/jijin.png" alt="">
                </router-link>
            </li>
            <li>
                <router-link  to="moneymore">
                    <img src="../../img/home/zhaiquan.png" alt="">
                </router-link>
            </li>
            <li>
                <router-link  to="moneymore">
                    <img src="../../img/home/gupiao.png" alt="">
                </router-link>
            </li>
            <li>
                <router-link  to="addproduct">
                    <img src="../../img/home/zidingyi_01.png" alt="">
                </router-link>
            </li>
        </ul>
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
.app.container{
    height:562px;
}
.app .mui-bar{
    background-color: #26a2ff;
}
.app .product_p{
    display: flex;
    flex-direction: column;
    width:96%;
    padding-left:12px;
    text-align: center;
    align-items: center;
}
.app .product_p img{
    width:100%;
    height:74px;
    margin-top:12px;
}
h1.mui-title{
    color:#fff;
}
.mui-icon-back:before, .mui-icon-left-nav:before{
    color:#fff;
}
</style>

