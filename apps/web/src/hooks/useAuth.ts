import { useState, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { apiClient } from '@/lib/api-client';

interface User {
  id: string;
  email: string;
  name: string;
  role: string;
}

interface LoginCredentials {
  email: string;
  password: string;
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
    const stored = localStorage.getItem('auth_user');
    return stored ? (JSON.parse(stored) as User) : null;
  });

  const isAuthenticated = user !== null && !!localStorage.getItem('auth_token');

  const login = useCallback(
    async (credentials: LoginCredentials) => {
      const response = await apiClient.post<{ token: string; user: User }>(
        '/auth/login',
        credentials,
      );
      const { token, user: loggedInUser } = response.data;
      localStorage.setItem('auth_token', token);
      localStorage.setItem('auth_user', JSON.stringify(loggedInUser));
      setUser(loggedInUser);
      navigate('/');
    },
    [navigate],
  );

  const logout = useCallback(() => {
    localStorage.removeItem('auth_token');
    localStorage.removeItem('auth_user');
    setUser(null);
    navigate('/login');
  }, [navigate]);

  return { user, isAuthenticated, login, logout };
}

export default useAuth;
