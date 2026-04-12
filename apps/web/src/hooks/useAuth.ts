import { useState, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { apiClient } from '@/lib/api-client';

interface User {
  id: string;
  email: string;
  displayName: string;
  tenantId: string;
  roles: string[];
  isActive: boolean;
}

interface LoginCredentials {
  email: string;
  password: string;
}

interface LoginResponse {
  success: boolean;
  data: {
    user: User;
    accessToken: string;
    refreshToken: string;
    expiresIn: number;
  };
}

interface UseAuthReturn {
  user: User | null;
  isAuthenticated: boolean;
  login: (credentials: LoginCredentials) => Promise<void>;
  logout: () => void;
}

export function useAuth(): UseAuthReturn {
  const navigate = useNavigate();
  const [user, setUser] = useState<User | null>(() => {
    const stored = localStorage.getItem('apex_user');
    return stored ? (JSON.parse(stored) as User) : null;
  });

  const isAuthenticated = user !== null && !!localStorage.getItem('apex_token');

  const login = useCallback(
    async (credentials: LoginCredentials) => {
      // Get tenant ID from slug first
      const tenantId = localStorage.getItem('apex_tenant_id') || '';

      const response = await apiClient.post<LoginResponse>(
        '/auth/login',
        credentials,
        {
          headers: {
            'x-tenant-id': tenantId,
          },
        },
      );

      const { accessToken, refreshToken, user: loggedInUser } = response.data.data;
      localStorage.setItem('apex_token', accessToken);
      localStorage.setItem('apex_refresh_token', refreshToken);
      localStorage.setItem('apex_user', JSON.stringify(loggedInUser));
      localStorage.setItem('apex_tenant_id', loggedInUser.tenantId);
      setUser(loggedInUser);
      navigate('/');
    },
    [navigate],
  );

  const logout = useCallback(() => {
    localStorage.removeItem('apex_token');
    localStorage.removeItem('apex_refresh_token');
    localStorage.removeItem('apex_user');
    setUser(null);
    navigate('/login');
  }, [navigate]);

  return { user, isAuthenticated, login, logout };
}

export default useAuth;
