import type { RouteObject } from 'react-router-dom';
import MainLayout from '@/layouts/MainLayout';
import DashboardPage from '@/pages/DashboardPage';
import LoginPage from '@/pages/LoginPage';
import ConnectionsPage from '@/features/connections';
import EditorPage from '@/features/editor';
import AIStudioPage from '@/features/ai-studio';
import PRDBuilderPage from '@/features/prd-builder';
import PRDToPagePage from '@/features/prd-to-page';
import ChangeManagerPage from '@/features/change-manager';
import SchemaInspectorPage from '@/features/schema-inspector';
import ReleaseManagerPage from '@/features/release-manager';
import GovernancePage from '@/features/ai-governance';
import DependencyAnalyzerPage from '@/features/dependency-analyzer';
import AutoDocsPage from '@/features/auto-docs';
import TestStudioPage from '@/features/test-studio';
import KnowledgeEnginePage from '@/features/knowledge-engine';
import UsageIntelligencePage from '@/features/usage-intelligence';
import DashboardsPage from '@/features/dashboards';
import CodeFactoryPage from '@/features/code-factory';
import MarketplacePage from '@/features/marketplace';
import AdminPage from '@/features/admin';

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
      {
        path: '/editor',
        element: <EditorPage />,
      },
      {
        path: '/ai-studio',
        element: <AIStudioPage />,
      },
      {
        path: '/prd',
        element: <PRDBuilderPage />,
      },
      {
        path: '/page-gen',
        element: <PRDToPagePage />,
      },
      {
        path: '/change-manager/*',
        element: <ChangeManagerPage />,
      },
      {
        path: '/schema-inspector',
        element: <SchemaInspectorPage />,
      },
      {
        path: '/releases/*',
        element: <ReleaseManagerPage />,
      },
      {
        path: '/governance',
        element: <GovernancePage />,
      },
      {
        path: '/dependencies',
        element: <DependencyAnalyzerPage />,
      },
      {
        path: '/auto-docs',
        element: <AutoDocsPage />,
      },
      {
        path: '/test-studio',
        element: <TestStudioPage />,
      },
      {
        path: '/knowledge',
        element: <KnowledgeEnginePage />,
      },
      {
        path: '/usage',
        element: <UsageIntelligencePage />,
      },
      {
        path: '/dashboards',
        element: <DashboardsPage />,
      },
      {
        path: '/code-factory',
        element: <CodeFactoryPage />,
      },
      {
        path: '/marketplace',
        element: <MarketplacePage />,
      },
      {
        path: '/admin/*',
        element: <AdminPage />,
      },
    ],
  },
];
