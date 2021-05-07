const TokenKey = 'token'


/**
 * 获取缓存数据
 * @param key
 * @returns {string|null}
 */
export const getStorage = function(key) {
  if (localStorage.getItem(key)) {
    return localStorage.getItem(key);
  }
  return null;
};

/**
 * 缓存数据
 * @param key
 * @param value
 */
export const setStorage = function(key, value) {
  localStorage.setItem(key, value);
};

/**
 * 删除缓存数据
 * @param key 'key1' | 'key1 key2 key3'
 */
export const delStorage = function(key) {
  if (!key) return;
  const keys = key.split(" ");
  keys.forEach(key => {
    if (localStorage.getItem(key)) {
      localStorage.removeItem(key);
    }
  });
};

/**
 * 清空缓存数据
 */
export const clearStorage = function() {
  localStorage.clear();
};
export function getToken() {
  return getStorage(TokenKey);
}

export function setToken(token) {
  console.log(token)
  return setStorage(TokenKey, token)
}

export function removeToken() {
  return delStorage(TokenKey)
}
