<template>
   <div class="app">
      <header class="mui-bar mui-bar-nav">
			<router-link to="product_jinrong" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">自定义添加产品</h1>
            <router-link to="product_jinrong">
            <h5 class="title_sure" @click="more_sure">确定</h5>
            </router-link>
		</header>
        <ul class="add_ul">
            <li>
                <p>产品名称</p>
                <input type="text" placeholder="请输入产品名称">
            </li>
            <li>
                <p>公司名称</p>
                <input type="text" placeholder="请输入产品名称(选填)">
            </li>
            <li>
                <p>投资本金</p>
                <input type="text" placeholder="请输入投资本金">
            </li>
            <li>
                <h5>p2p</h5>
                <input type="text" placeholder="请填写购买数量" v-model="count1">
                <input type="text" placeholder="请填写价位" v-model="price1">
            </li>
            <li>
                <h5>基金</h5>
                <input type="text" placeholder="请填写购买数量" v-model="count2">
                <input type="text" placeholder="请填写价位" v-model="price2">
            </li>
            <li>
                <h5>债券</h5>
                <input type="text" placeholder="请填写购买数量" v-model="count3">
                <input type="text" placeholder="请填写价位" v-model="price3">
            </li>
            <li>
                <h5>股票</h5>
                <input type="text" placeholder="请填写购买数量" v-model="count4">
                <input type="text" placeholder="请填写价位" v-model="price4">
            </li>
        </ul>

    </div>   
</template>
<script>
    export default({
        data(){
            return{
                list:[],
                count1:"",
                price1:"",
                count2:"",
                price2:"",
                count3:"",
                price3:"",
                count4:"",
                price4:"",
            }
            
        },
        methods:{
            more_sure(){
                var url="asset/list?count1="+this.count1+"&price1="+this.price1
                +"&count2="+this.count2+"&price2="+this.price2+"&count3="+this.count3+"&price3="+this.price3+"&count4="+this.count4+"&price4="+this.price4;

                 this.$http.get(url).then(result=>{
                     console.log(result);
                })
            }
        },
        created(){}
    })
</script>
<style>
.title_sure{
    color:#fff;
    margin-top:4%;
    margin-left:92%;
}
.add_ul{
    list-style: none;
    padding-left:10px;
}
.add_ul li{
    width:96%;
}
</style>

