<template>
   <div class="app">
      <img src="../../img/login/login_bac_03.png" class="login_bac">
      <div class="mui-input-row login">
						<label class="label"><img src="../../img/login/shouji.png" alt=""></label>
						<input type="text" class="mui-input-clear uname" name="uname" v-model="uname" placeholder="请输入用户名">
			</div>
            <div class="mui-input-row login">
						<label class="label"><img src="../../img/login/pwd.png" alt=""></label>
						<input type="text" class="mui-input-clear upwd" name="upwd" v-model="upwd" placeholder="请输入密码">
			</div>
            <div class="button">
                <button @click="login" class="login_one">登 录</button>
            </div>
            <div class="register">
                <ul>
                    <li>
                        <router-link to="register">忘记密码?</router-link>
                    </li>
                    <li>
                        <router-link to="register">注册</router-link>
                    </li>
                    
                </ul>
            </div>
    </div>   
</template>
<script>
import {Toast} from "mint-ui"
  import qs from "qs"
  export default{
    name:"login",
    data(){
      return {
        uname:"",
        upwd:""
      }
    },
    methods:{
      login(){
        var self=this;
        //console.log(self.uname)
        this.$http.post("http://127.0.0.1:3000/user/signin",{
            uname:self.uname,upwd:self.upwd
          }
        ).then(res=>{
          if(res.data.ok==1){
            Toast("登录成功，返回首页");
            //在缓存中存值           属性    属性值
            sessionStorage.setItem("uname",self.uname)
            self.$router.push("/product_jinrong")
          }else{
            Toast("用户名或密码错误！");
          }
        })
      }
    },
    created(){
       
    }
  }
</script>
<style scoped>

  .app .login_bac{
      width:100%;
  }
  .app .login{
   border-bottom:1px solid #eee;
   margin-top:30px;
   display: flex;
   justify-content: flex-start;
   align-items: center;
   border-bottom:1px solid #eee;

   }
    .app .login:nth-child(3){
        margin-top:20px;
    }
    .app .login .label{
        width:70px;
    }
  .app .login img{
      width:24px;
      margin-left:50%;
      margin-right:20px;
     
  }
  .app .button{
      text-align: center;
  }
  .app .button button{
      width:80%;
      border-radius: 50px;
      padding:8px 0 8px 0;
      margin-top:60px;
      color:#fff;
      background-color:#26a2ff;
      font-size:18px;
  }
  .app-container{
      background-color:#fff;
      padding-bottom:116px;
  }
  .app .register>ul{
      width:89%;
      list-style: none;
      display: flex;
      justify-content: space-between;
      margin-top:14px;
      
  }
  .app .register>ul>li:nth-child(1) a{
      color:#999;
  }
  .app .register>ul>li:nth-child(2) a{
      color:#26a2ff;
  }
</style>

