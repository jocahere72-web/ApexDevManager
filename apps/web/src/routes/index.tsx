import type { RouteObject } from 'react-router-dom';
import MainLayout from '@/layouts/MainLayout';
import DashboardPage from '@/pages/DashboardPage';
import LoginPage from '@/pages/LoginPage';
import ConnectionsPage from '@/features/connections';

export const routes: RouteObject[] = [
  {
    path: '/login',
    element: <LoginPage />,
  },
  {
    element: <MainLayout />,
    children: [
      {
        path: '/',
        element: <DashboardPage />,
      },
      {
        path: '/connections/*',
        element: <ConnectionsPage />,
      },
    ],
  },
];
