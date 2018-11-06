import Vue from 'vue'
import App from './App.vue'
import router from './router'

import'mint-ui/lib/style.css'
import axios from 'axios'

//为了使用session和cookie
axios.defaults.withCredentials=true;

Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'
//main.js  引入头部
import{Header,Button,Swipe,SwipeItem} from "mint-ui";
//注册组件
Vue.component(Header.name,Header);
Vue.component(Button.name,Button);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
import VueResource from "vue-resource";
Vue.use(VueResource);

//设置全局ajax请求的路径
Vue.http.options.root="http://127.0.0.1:3000/";
//设置全局ajax post访问格式
Vue.http.options.emulateJSON=true;

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
