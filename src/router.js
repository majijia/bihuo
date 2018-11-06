import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import HomeContainer from "./components/tabbar/HomeContainer"
import NewslistContainer from "./components/tabbar/NewslistContainer"
import PeopleContainer from "./components/tabbar/PeopleContainer"
import SearchContainer from "./components/tabbar/SearchContainer"
import Product_jinrongContainer from "./components/onetab/Product_jinrongContainer"
import LoginContainer from "./components/login/LoginContainer"
import RegisterContainer from "./components/login/RegisterContainer"
import AddproductContainer from "./components/onetab/AddproductContainer"
import MoneymoreContainer from "./components/onetab/MoneymoreContainer"
import NewsinfoContainer from "./components/communityes/NewsinfoContainer"
import SearchdetailContainer from "./components/search/SearchdetailContainer"
import Searchdetail_twoContainer from "./components/search/Searchdetail_twoContainer"
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/',component:HelloContainer},
    {path:'/home',component:HomeContainer},
    {path:'/newslist',component:NewslistContainer},
    {path:'/people',component:PeopleContainer},
    {path:'/search',component:SearchContainer},
    {path:'/addproduct',component:AddproductContainer},
    {path:'/product_jinrong',component:Product_jinrongContainer},
    {path:'/login',component:LoginContainer},
    {path:'/register',component:RegisterContainer},
    {path:'/newsinfo/:id',component:NewsinfoContainer},
    {path:'/moneymore',component:MoneymoreContainer},
    {path:'/searchdetail/:keywords',component:SearchdetailContainer},
    {path:'/searchdetail_two/:keywords',component:Searchdetail_twoContainer},
  ],linkActiveClass:"mui-active" 
})
