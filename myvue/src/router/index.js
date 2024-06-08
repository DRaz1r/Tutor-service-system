import Vue from "vue";
import VueRouter from "vue-router";
import main from "../views/Main";
import Index from "../views/Index";
import login from "../views/Login";
import Home from "../views/Home";
import AdminManage from "../views/admin/AdminManage";
import UserManage from "../views/user/UserManage";
import StorageManage from "../views/storage/StorageManage";
import GoodsTypeManage from "../views/goodstype/GoodsTypeManage";
import GoodsManage from "../views/goods/GoodsManage";
import RecordManage from "../views/record/RecordManage";
import InfoPublishManage from "../views/infopublish/InfoPublishManage";
import DemandPublishManage from "../views/demandpublish/DemandPublishManage.vue";
//安装路由
Vue.use(VueRouter);
const VueRouterPush=VueRouter.prototype.push
VueRouter.prototype.push=function push(to){
  return VueRouterPush.call(this,to).catch(err=>err)
}
//导出路由
export default new VueRouter({
  routes:[
    {
      path:'/',
      component:login
    },
    {
      path:'/Index',
      component:Index,
      children:[{
        path:'/Home',
        component:Home,
        meta:{
          title:'首页'
        }
      },
        {
          path:'/Admin',
          component:AdminManage,
          meta:{
            title:'教师管理'
          }
        },
        {
          path:'/User',
          component:UserManage,
          meta:{
            title:'学生管理'
          }
        },
        {
          path: '/Storage',
          component: StorageManage,
          meta: {
            title: '仓库管理'
          }
        },
        {
          path: '/GoodsType',
          component: GoodsTypeManage,
          meta: {
            title: '分类管理'
          }
        },
        {
          path: '/Record',
          component: RecordManage,
          meta: {
            title: '记录管理'
          }
        },
        {
          path: '/Goods',
          component: GoodsManage,
          meta: {
            title: '分类管理'
          }
        },
        {
          path: '/InfoPublish',
          component: InfoPublishManage,
          meta: {
            title: '家教信息'
          }
        },
        {
          path: '/DemandPublish',
          component: DemandPublishManage,
          meta: {
            title: '学生信息'
          }
        }
      ]
    }
  ]
});
