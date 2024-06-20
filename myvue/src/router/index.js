import Vue from "vue";
import VueRouter from "vue-router";
import Index from "../views/Index";
import login from "../views/Login";
import Home from "../views/Home";
import TeacherManage from "../views/teacher/TeacherManage.vue";
import UserManage from "../views/user/UserManage";
import ReviewManage from "../views/review/ReviewManage";
import InfoPublishManage from "../views/infopublish/InfoPublishManage";
import DemandPublishManage from "../views/demandpublish/DemandPublishManage.vue";
import Register from '../views/Register.vue';
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
      path: '/register',
      name: 'Register',
      component: Register
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
          path:'/Teacher',
          component:TeacherManage,
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
        },
        {
          path: '/Review',
          component: ReviewManage,
          meta: {
            title: '评价反馈'
          }
        }
      ]
    }
  ]
});
