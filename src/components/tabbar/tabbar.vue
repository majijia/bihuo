<template>
    <div class="app">
       <nav class="mui-bar mui-bar-tab" id="nav">
			<router-link class="mui-tab-item only" to="home">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</router-link>
			<router-link class="mui-tab-item only" to="newslist">
				<span class="mui-icon mui-icon-email"></span>
				<span class="mui-tab-label">社区</span>
			</router-link>
			<router-link class="mui-tab-item only" to="search">
				<span class="mui-icon mui-icon-search"></span>
				<span class="mui-tab-label">搜索</span>
			</router-link>
			<router-link class="mui-tab-item only" to="people">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">我的</span>
			</router-link>
		</nav>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                
            }
        },
        methods:{
               
                
              
               
        },
        
        created(){
           
        },
        computed:{
            
        }
    }
</script>
<style scoped>
.mui-bar.mui-bar-tab{
    background-color:#fff;
}
</style>