import axios from 'axios'

export const API_BASE_URL = 'http://172.20.10.2:8000/api'

const api = axios.create({
  baseURL: API_BASE_URL,
})

// Token helpers
const TOKEN_KEY = 'auth_token'

export const tokenService = {
  get: () => localStorage.getItem(TOKEN_KEY),
  set: (t) => localStorage.setItem(TOKEN_KEY, t),
  clear: () => localStorage.removeItem(TOKEN_KEY),
}

// attach token automatically
api.interceptors.request.use((config) => {
  const t = tokenService.get()
  if (t) config.headers.Authorization = `Bearer ${t}`
  return config
})

// Auth endpoints
export const authAPI = {
  async login(payload) {
    const { data } = await api.post('/login', payload)
    return data
  },
  async register(payload) {
    const { data } = await api.post('/register', payload)
    return data
  },
  async me() {
    const { data } = await api.get('/user')
    return data
  },
  async logout() {
    const { data } = await api.post('/logout')
    return data
  },
}

/* -------- Categories API -------- */
export const categoriesAPI = {
  list: async () => {
    const { data } = await api.get('/categories')
    return data
  },
  create: async (payload) => {
    const { data } = await api.post('/categories', payload)
    return data
  },
}

/* -------- Users API -------- */
export const usersAPI = {
  list: async (params = {}) => {
    const { data } = await api.get('/users', { params });
    return Array.isArray(data?.data) ? data.data : data;
  },
  get: async (id) => {
    const { data } = await api.get(`/users/${id}`);
    return data?.data ?? data;
  },
  create: async (payload) => {
    const { data } = await api.post('/users', payload);
    return data?.data ?? data;
  },
  update: async (id, payload) => {
    const { data } = await api.put(`/users/${id}`, payload);
    return data?.data ?? data;
  },
  delete: async (id) => {
    const { data } = await api.delete(`/users/${id}`);
    return data;
  },
};

/* -------- Admin Bookings API -------- */
export const adminBookingsAPI = {
  list: async (params = {}) => {
    const { data } = await api.get('/admin/bookings', { params });
    return data?.data ?? [];
  },
};

/* -------- Machines API -------- */
export const machinesAPI = {
  list: async () => {
    const { data } = await api.get('/machines')
    return data
  },
  get: async (id) => {
    const { data } = await api.get(`/machines/${id}`)
    return data
  },
  create: async (machine) => {
    const { data } = await api.post('/machines', machine)
    return data
  },
  update: async (id, machine) => {
    const { data } = await api.put(`/machines/${id}`, machine)
    return data
  },
  delete: async (id) => {
    const { data } = await api.delete(`/machines/${id}`)
    return data
  },
}

/* -------- Charges API -------- */
export const chargesAPI = {
  list: async (params = {}) => {
    const { data } = await api.get('/charges', { params })
    return data
  },
  listByMachine: async (machineId) => {
    const { data } = await api.get('/charges', { params: { machine_id: machineId } })
    return data
  },
  create: async (payload) => {
    const { data } = await api.post('/charges', payload)
    return data
  },
  delete: async (id) => {
    const { data } = await api.delete(`/charges/${id}`)
    return data
  },
}

/* -------- Machine Charge API -------- */
export const machineChargeAPI = {
  attach: (machineId, chargeId) => 
    api.post(`/machines/${machineId}/charges/${chargeId}`),

  detach: (machineId, chargeId) => 
    api.delete(`/machines/${machineId}/charges/${chargeId}`),

  sync: (machineId, chargeIds) => 
    api.put(`/machines/${machineId}/charges`, { charge_ids: chargeIds })
}

/* -------- Paramètres API -------- */
export const parametresAPI = {
  list: async (params = {}) => {
    const { data } = await api.get('/parametres', { params })
    return data
  },
  public: async (groupe = null) => {
    const params = groupe ? { groupe } : {}
    const { data } = await api.get('/parametres/public', { params })
    return data
  },
  get: async (cle) => {
    const { data } = await api.get(`/parametres/${cle}`)
    return data
  },
  createOrUpdate: async (payload) => {
    const { data } = await api.post('/parametres', payload)
    return data
  },
  update: async (id, payload) => {
    const { data } = await api.put(`/parametres/${id}`, payload)
    return data
  },
  delete: async (id) => {
    const { data } = await api.delete(`/parametres/${id}`)
    return data
  },
  bulkUpdate: async (parametres) => {
    const { data } = await api.post('/parametres/bulk-update', { parametres })
    return data
  },
}

export const workoutsAPI = {
  list: () => api.get('/workouts').then(r => r.data),
  create: (data) => api.post('/workouts', data).then(r => r.data),
}

export const branchesAPI = {
  list: () => api.get('/branches').then(r => r.data),
  create: (data) => api.post('/branches', data).then(r => r.data),
}

export const sessionsAPI = {
  list: () => api.get('/group-sessions').then(r => r.data),
  upcoming: () => api.get('/group-sessions/upcoming').then(r => r.data),
  available: () => api.get('/group-sessions/available').then(r => r.data),
}
// Replace your videosAPI with this:

/* -------- Videos API -------- */
export const videosAPI = {
  // Get all videos
  list: async () => {
    const { data } = await api.get('/videos')
    return data
  },
  
  // Get videos by coach
  listByCoach: async (coachId) => {
    const { data } = await api.get(`/coaches/${coachId}/videos`)
    return data
  },
  
  // Create a new video
  create: async (payload) => {
    const { data } = await api.post('/videos', payload)
    return data
  },
  
  // Delete a video
  delete: async (id) => {
    const { data } = await api.delete(`/videos/${id}`)
    return data
  },
}
export default api