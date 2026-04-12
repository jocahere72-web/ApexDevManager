import axios from 'axios';

export const apiClient = axios.create({
  baseURL: '/api/v1',
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request interceptor: attach JWT token and tenant ID
apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('apex_token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    const tenantId = localStorage.getItem('apex_tenant_id');
    if (tenantId) {
      config.headers['x-tenant-id'] = tenantId;
    }
    return config;
  },
  (error) => Promise.reject(error),
);

// Response interceptor: handle 401 by redirecting to login
apiClient.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('apex_token');
      localStorage.removeItem('apex_user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  },
);

export default apiClient;
