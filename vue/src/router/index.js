import Vue from 'vue'
import Router from 'vue-router'
// in development env not use Lazy Loading,because Lazy Loading too many pages will cause webpack hot update too slow.so only in production use Lazy Loading
/* layout */
import Layout from '../views/layout/Layout'

const _import = require('./_import_' + process.env.NODE_ENV)
Vue.use(Router)
/**
 * icon : the icon show in the sidebar
 * hidden : if `hidden:true` will not show in the sidebar
 * redirect : if `redirect:noredirect` will not redirct in the levelbar
 * noDropdown : if `noDropdown:true` will not has submenu in the sidebar
 * meta : `{ role: ['admin'] }`  will control the page role
 **/
export const constantRouterMap = [
  {path: '/login', component: _import('login/index'), hidden: true},
  {path: '/404', component: _import('404'), hidden: true},
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    name: '首页',
    hidden: true,
    children: [{path: 'dashboard', component: _import('dashboard/index')}]
  }
]
export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({y: 0}),
  routes: constantRouterMap
})
export const asyncRouterMap = [

  {
    path: '/system',
    component: Layout,
    redirect: 'noredirect',
    name: '功能模块',
    icon: 'system',
    children: [
      {path: 'article', component: _import('article/article'), name: '文章', menu: 'article'},
    ]
  },
  {
    path: '/user',
    component: Layout,
    redirect: 'noredirect',
    name: '用户权限',
    icon: '管理员',
    children: [
      {path: '', component: _import('user/user'), name: '用户列表', menu: 'user'},
    ]
  },
  {path: '*', redirect: '/404', hidden: true}
]
