import api from '@/utils/api'

export function getInfo(token) {
  return api({
    url: '/login/testGetInfo',
    method: 'get',
    params: {token}
  })
}


