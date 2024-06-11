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
    <el-menu-item :index="'/'+item.menuclick" v-for="(item,i) in getMenu" :key="i" >
      <i :class="item.menuicon"></i>
      <span slot="title">{{item.menuname}}</span>
    </el-menu-item>
  </el-menu>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "Aside",
  data(){
    return{
    }
  },
  created: {
    ...mapGetters(["getMenu"])
  },
  computed: {
    ...mapGetters(["getMenu"])
  },
  props:{
    isCollapse:Boolean
  }
}
</script>

<style scoped>

</style>
