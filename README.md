# SpringBoot-shiro-vue
提供一套基于SpringBoot-shiro-vue的权限管理思路.前后端都加以控制,做到按钮/接口级别的权限

# 设计思路

### 核心

 每个登录用户拥有各自的N条**权限**,比如文章:查看/编辑/发布/删除

### 后端

基于 [RABC新解](http://globeeip.iteye.com/blog/1236167) . 

用户--角色--权限

后台接口只验证**权限**,不看角色.

角色的作用其实只是用来管理分配权限的,真正的验证只验证**权限** ,而不去管你是否是那种角色.体现在代码上就是接口上注解为```@RequiresPermissions("writer:list")``` ```@RequiresPermissions("writer:update")```  

而不是验证```@RequiresRoles(...)```  

### 前端

