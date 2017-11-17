const getters = {
  sidebar: state => state.app.sidebar,
  visitedViews: state => state.app.visitedViews,

  nickname: state => state.user.nickname,
  userId: state => state.user.userId,
  avatar: state => state.user.avatar,
  role: state => state.user.role,
  menus: state => state.user.menus,
  permissions: state => state.user.permissions,

  permission_routers: state => state.permission.routers,
  addRouters: state => state.permission.addRouters
}
export default getters
