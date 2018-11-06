<template>
 <div class="app-container">
     <!--顶部导航-->
     <mt-header fixed title="非凡烽火台"></mt-header>
     <!--router-view-->
    <router-view></router-view>
    <!--mui-tabbar-->
   
 </div>
</template>
<script>
    export default{
        data(){
            return {}
        },
        mounted(){
            
        }

    }
</script>
<style>
   .app-container{
     padding-top:40px;
     padding-bottom:50px;
     overflow-x:hidden;
     height:667px;
   }

 .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}

.mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
   font-size:11px;
   display:block;
   overflow:hidden;
   text-overflow:ellipsis;

}
.bac_color_common{
    width:100%;
    height:10px;
    background-color:#f3f3f3;
}
/*高度*/
.bacHeight{
    height:450px;
} 

</style>
