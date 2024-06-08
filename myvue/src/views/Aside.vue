<template>
  <el-menu
    background-color="#545c64"
    text-color="#fff"
    active-text-color="#ffd04b"
    style="height: 100vh"
    default-active="/Home"
    :collapse="isCollapse"
    :collapse-transition="false"
    router
  >
   <el-menu-item index="/Home">
     <i class="el-icon-s-home"></i>
     <span slot="title">首页</span>
   </el-menu-item>
    <el-menu-item :index="'/'+item.menuClick" v-for="(item,i) in menu" :key="i" >
      <i :class="item.menuIcon"></i>
      <span slot="title">{{item.menuName}}</span>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  name: "Aside",
  data(){
    return{
      menu:[
        {
          menuClick:'Admin',
          menuName:'教师管理',
          menuIcon:'el-icon-s-custom'
        },
        {
          menuClick:'User',
          menuName:'学生管理',
          menuIcon:'el-icon-user-solid'
        },
        {
          menuClick:'InfoPublish',
          menuName:'家教信息',
          menuIcon:'el-icon-takeaway-box'
        },
        {
          menuClick:'DemandPublish',
          menuName:'学生信息',
          menuIcon:'el-icon-takeaway-box'
        },
        {
          menuClick:'Review',//终于找到你
          menuName:'评价反馈',
          menuIcon:'el-icon-office-building'
        }
      ]
    }
  },

  props:{
    isCollapse:Boolean
  }
}
</script>

<style scoped>

</style>
