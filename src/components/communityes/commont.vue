<template>
   <div class="app">
      <h4>回答</h4>
            <div class="aswer_replay" v-for="item in list" :key="item.id">
                <ul class="awser_ul_two">
                    <li>
                        <ul class="aswer_ul_three">
                            <li><img src="../../img/people/peo.png"></li>
                            <li>
                                <ul class="aswer_ul_four">
                                    <li>{{item.username}}</li>
                                    <li>{{item.content}}</li>
                                </ul>
                            </li>
                        </ul>
                        
                    </li>
                </ul> 
                <div class="leave"></div> 
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
        methods:{
           getCommontList(){  
               this.$http.get("newslist/commentlist?nid="+this.id).then(result=>{
               console.log(result);
               this.list=result.body.data;
               console.log(this.list);
               })
           }
        },
        created(){
           this.getCommontList();
        },
        props:["id"]   //接收父组件的id
    })
</script>
<style scoped>

/*评论-回答*/
.app .aswer_main .aswer_replay>.awser_ul_two{
    padding-left:0px;
    }
.app .aswer_main .aswer_replay .aswer_ul_three{
    list-style: none;
    display: flex;
    padding-left: 0;
}
.app .aswer_main .aswer_replay .aswer_ul_three>li>img{
    width:34px;
}
.aswer_ul_four,.aswer_ul_five{
    list-style: none;
    padding-left: 10px;
}
.aswer_ul_four>li{
    margin-top:10px;
}
.aswer_ul_four>li:nth-child(1){
    font-size: 16px;
    color:#999;
}
.aswer_ul_four>li:nth-child(2){
    margin-top:14px;
}

.leave{
    border-bottom:1px solid #eee;
}

</style>

