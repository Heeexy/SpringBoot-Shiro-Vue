import store from '../store'

export function hasPermission(permission) {
  permission=permission.trim()
  let myPermissions = store.getters.permissions;
  return myPermissions.indexOf(permission) > -1;
}
