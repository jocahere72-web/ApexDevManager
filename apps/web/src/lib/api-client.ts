import axios from 'axios';

const AUTH_ERROR_CODES = new Set([
  'TOKEN_EXPIRED',
  'INVALID_TOKEN',
  'AUTHENTICATION_REQUIRED',
  'token_expired',
  'invalid_token',
  'authentication_required',
]);

export const apiClient = axios.create({
  baseURL: '/api/v1',
  headers: {
    'Content-Type': 'application/json',
  },
});

function getAuthErrorCode(error: unknown) {
  if (!error || typeof error !== 'object' || !('response' in error)) return null;
  const response = (error as { response?: { data?: { error?: { code?: string }; code?: string } } })
    .response;
  return response?.data?.error?.code ?? response?.data?.code ?? null;
}

function shouldRedirectOn401(error: unknown) {
  if (!error || typeof error !== 'object' || !('response' in error)) return false;

  const axiosError = error as {
    config?: { authRedirectOn401?: boolean; url?: string };
    response?: { headers?: Record<string, string | undefined>; status?: number };
  };

  if (axiosError.response?.status !== 401) return false;
  if (axiosError.config?.authRedirectOn401) return true;
  if (window.location.pathname === '/login') return false;

  const authHeader = axiosError.response.headers?.['www-authenticate'] ?? '';
  const errorCode = getAuthErrorCode(error);

  return (
    (errorCode !== null && AUTH_ERROR_CODES.has(errorCode)) ||
    authHeader.toLowerCase().includes('invalid_token')
  );
}

function clearAuthSession() {
  localStorage.removeItem('apex_token');
  localStorage.removeItem('apex_refresh_token');
  localStorage.removeItem('apex_user');
}

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
    if (shouldRedirectOn401(error)) {
      clearAuthSession();
      window.location.href = '/login';
    }
    return Promise.reject(error);
  },
);

export default apiClient;
