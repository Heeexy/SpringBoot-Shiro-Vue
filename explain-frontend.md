# 前端权限代码说明

## 路由

​	路由分为两部分,一部分是固定的几个 ,比如/login,/404,另一部分是根据权限动态生成的.

​	`router/index.js`  里,动态路由都在 **asyncRouterMap**内,里面元素的关键属性为**menu** , 生成动态路由时,会根据用户权限json内的menuList里是否含有这个menu,来决定是否为此用户添加这个路由.

## 生成动态路由过程



1.  `permission.js`   vue-router的全局拦截器, 如果已登录状态而没有拿到用户的权限属性的话,说明还没查询用户权限信息,初始化动态路由

   ```javascript
   if (!store.getters.role) {
         store.dispatch('GetInfo').then(() => {
           next({...to})
         })
       }
   ```

2. `user.js` ,查询到用户权限信息,并且存入vuex

```json
 "userPermission":{  
         "menuList":[  
            "role",
            "user",
            "article"
         ],
         "roleId":1,
         "nickname":"超级用户",
         "roleName":"管理员",
         "permissionList":[  
            "article:list",
            "article:add",
            "user:list",
         ],
         "userId":10003
      }
```

为什么不在登录的时候一并返回呢? 因为页面F5刷新的时候,vuex信息会丢失,所以需要重新查询一遍这些权限信息. 当然,把权限信息存入cookie也可以解决.

拿到userPermission后,调用生成动态路由的方法

```javascript
store.dispatch('GenerateRoutes', userPermission).then(() => {
    router.addRoutes(store.getters.addRouters)
})
```

3. `store/modules/permission.js` 现在,我们已经拿到了用户的权限信息,再从`@/router/index` 内拿到**asyncRouterMap**,逐一比较便可知道为用户生成哪些路由了

## 页面元素

​	只需在按钮上添加 ` v-if="hasPerm('article:add')"` 就可以根据用户的权限来控制本页面元素(比如按钮)是否显示了.

​	hasPerm方法也非常简单 

```javascript
export function hasPermission(permission) {
  let myPermissions = store.getters.permissions;
  return myPermissions.indexOf(permission) > -1;
}
```