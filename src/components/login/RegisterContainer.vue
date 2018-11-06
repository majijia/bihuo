<template>
   <div class="app">
      <img src="../../img/login/login_bac_03.png" class="login_bac">
      <div class="mui-input-row login">
						<label class="label"><img src="../../img/login/shouji.png" alt=""></label>
						<input type="text" class="mui-input-clear" placeholder="请输入用户名" v-model="uname">
			</div>
            <div class="mui-input-row login">
						<label class="label"><img src="../../img/login/pwd.png" alt=""></label>
						<input type="text" class="mui-input-clear" placeholder="请输入6-16为密码" v-model="upwd">
			</div>
            <div class="button">
                <button @click=register>立即注册</button>
            </div>
            <div class="now_login">
                已有账号?<router-link to="login"><span>立即登录</span></router-link>
            </div>
    </div>   
</template>
<script>
import {Toast} from "mint-ui"
    export default({
        data(){
            return{
                list:[],
                uname:"",
                upwd:""
            }
            
        },
        methods:{
           register(){
             var upwd=this.upwd;  
            if(!this.uname&&!this.upwd){
                 Toast("用户名或密码不能为空");
                 this.$router.push("/register")
            }
             else{
                 var url="http://127.0.0.1:3000/user/register?uname="+this.uname+"&upwd="+this.upwd;
             //console.log(this.uname)
             this.$http.get(url).then(res=>{
                 //console.log(result)
                  var reg=/^[0-9a-zA-Z]{6,16}$/;
                if(!reg.test(upwd)){
               Toast("密码格式不正确");
                return;
                 }
                  this.$router.push("/login")   
                 
             })
             }
           } 
        },
        created(){
        }
    })
</script>
<style>

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
.app div.now_login{
      margin-top:14px;
      text-align: center;
      color:#666;
}
.app div.now_login span{
    color:#26a2ff;
}
</style>

