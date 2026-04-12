import axios from 'axios';

export const apiClient = axios.create({
  baseURL: '/api/v1',
  headers: { 'Content-Type': 'application/json' },
});

let isRefreshing = false;
let refreshQueue: Array<{ resolve: (v: any) => void; reject: (e: any) => void }> = [];

function processQueue(error: any, token: string | null) {
  refreshQueue.forEach(({ resolve, reject }) => {
    error ? reject(error) : resolve(token);
  });
  refreshQueue = [];
}

function clearAndRedirect() {
  localStorage.removeItem('apex_token');
  localStorage.removeItem('apex_refresh_token');
  localStorage.removeItem('apex_user');
  if (window.location.pathname !== '/login') {
    window.location.href = '/login';
  }
}

// Request interceptor: attach JWT + tenant ID
apiClient.interceptors.request.use((config) => {
  const token = localStorage.getItem('apex_token');
  if (token) config.headers.Authorization = `Bearer ${token}`;
  const tenantId = localStorage.getItem('apex_tenant_id');
  if (tenantId) config.headers['x-tenant-id'] = tenantId;
  return config;
});

// Response interceptor: auto-refresh on 401
apiClient.interceptors.response.use(
  (response) => response,
  async (error) => {
    const originalRequest = error?.config;
    if (!originalRequest) return Promise.reject(error);

    const is401 = error?.response?.status === 401;
    const alreadyRetried = originalRequest._retry;
    const isAuthCall =
      originalRequest.url?.includes('/auth/login') ||
      originalRequest.url?.includes('/auth/refresh') ||
      originalRequest.url?.includes('/auth/tenant');

    if (!is401 || alreadyRetried || isAuthCall) {
      return Promise.reject(error);
    }

    // Only attempt token refresh for auth-related 401 codes.
    // Other 401s (e.g. permission denied) are rejected so the caller can handle them.
    const AUTH_ERROR_CODES = ['TOKEN_EXPIRED', 'INVALID_TOKEN', 'AUTHENTICATION_REQUIRED'];
    const errorCode =
      error?.response?.data?.error?.code ?? error?.response?.data?.code;
    if (errorCode && !AUTH_ERROR_CODES.includes(errorCode)) {
      return Promise.reject(error);
    }

    // Try refresh
    if (isRefreshing) {
      return new Promise((resolve, reject) => {
        refreshQueue.push({
          resolve: (token: string) => {
            originalRequest._retry = true;
            originalRequest.headers.Authorization = `Bearer ${token}`;
            resolve(apiClient(originalRequest));
          },
          reject,
        });
      });
    }

    isRefreshing = true;
    originalRequest._retry = true;

    try {
      const refreshToken = localStorage.getItem('apex_refresh_token');
      const tenantId = localStorage.getItem('apex_tenant_id');
      if (!refreshToken || !tenantId) throw new Error('No refresh token');

      const res = await axios.post('/api/v1/auth/refresh', { refreshToken }, {
        headers: { 'x-tenant-id': tenantId, 'Content-Type': 'application/json' },
      });

      const newToken = res.data?.data?.accessToken;
      const newRefresh = res.data?.data?.refreshToken;
      if (!newToken) throw new Error('Refresh failed');

      localStorage.setItem('apex_token', newToken);
      if (newRefresh) localStorage.setItem('apex_refresh_token', newRefresh);

      processQueue(null, newToken);
      originalRequest.headers.Authorization = `Bearer ${newToken}`;
      return apiClient(originalRequest);
    } catch (refreshError) {
      processQueue(refreshError, null);
      clearAndRedirect();
      return Promise.reject(refreshError);
    } finally {
      isRefreshing = false;
    }
  },
);

export default apiClient;
