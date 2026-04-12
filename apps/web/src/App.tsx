import { Routes, Route, Navigate } from 'react-router-dom';
import { lazy, Suspense } from 'react';
import MainLayout from '@/layouts/MainLayout';
import DashboardPage from '@/pages/DashboardPage';
import LoginPage from '@/pages/LoginPage';
import { useAuth } from '@/hooks/useAuth';

// Lazy load feature pages
const ConnectionsPage = lazy(() => import('@/features/connections'));
const ExplorerPage = lazy(() => import('@/features/explorer'));
const EditorPage = lazy(() => import('@/features/editor'));
const AIStudioPage = lazy(() => import('@/features/ai-studio'));
const PRDBuilderPage = lazy(() => import('@/features/prd-builder'));
const PRDToPagePage = lazy(() => import('@/features/prd-to-page'));
const ChangeManagerPage = lazy(() => import('@/features/change-manager'));
const SchemaInspectorPage = lazy(() => import('@/features/schema-inspector'));
const ReleaseManagerPage = lazy(() => import('@/features/release-manager'));
const GovernancePage = lazy(() => import('@/features/ai-governance'));
const DependencyAnalyzerPage = lazy(() => import('@/features/dependency-analyzer'));
const AutoDocsPage = lazy(() => import('@/features/auto-docs'));
const TestStudioPage = lazy(() => import('@/features/test-studio'));
const KnowledgeEnginePage = lazy(() => import('@/features/knowledge-engine'));
const UsageIntelligencePage = lazy(() => import('@/features/usage-intelligence'));
const DashboardsPage = lazy(() => import('@/features/dashboards'));
const CodeFactoryPage = lazy(() => import('@/features/code-factory'));
const MarketplacePage = lazy(() => import('@/features/marketplace'));
const ClientsPage = lazy(() => import('@/features/clients'));
const IssuesPage = lazy(() => import('@/features/issues'));
const AdminPage = lazy(() => import('@/features/admin'));
const LLMProvidersPage = lazy(() => import('@/features/admin/components/LLMProviders'));

function ProtectedRoute({ children }: { children: React.ReactNode }) {
  const { isAuthenticated } = useAuth();
  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }
  return <>{children}</>;
}

const Loading = () => (
  <div style={{ padding: '2rem', color: '#6b7280' }}>Loading...</div>
);

function App() {
  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />
      <Route
        element={
          <ProtectedRoute>
            <MainLayout />
          </ProtectedRoute>
        }
      >
        <Route path="/" element={<DashboardPage />} />
        <Route path="/clients/*" element={<Suspense fallback={<Loading />}><ClientsPage /></Suspense>} />
        <Route path="/issues/*" element={<Suspense fallback={<Loading />}><IssuesPage /></Suspense>} />
        <Route path="/connections/*" element={<Suspense fallback={<Loading />}><ConnectionsPage /></Suspense>} />
        <Route path="/explorer" element={<Suspense fallback={<Loading />}><ExplorerPage /></Suspense>} />
        <Route path="/editor" element={<Suspense fallback={<Loading />}><EditorPage /></Suspense>} />
        <Route path="/ai-studio" element={<Suspense fallback={<Loading />}><AIStudioPage /></Suspense>} />
        <Route path="/prd" element={<Suspense fallback={<Loading />}><PRDBuilderPage /></Suspense>} />
        <Route path="/page-gen" element={<Suspense fallback={<Loading />}><PRDToPagePage /></Suspense>} />
        <Route path="/change-manager/*" element={<Suspense fallback={<Loading />}><ChangeManagerPage /></Suspense>} />
        <Route path="/schema-inspector" element={<Suspense fallback={<Loading />}><SchemaInspectorPage /></Suspense>} />
        <Route path="/releases/*" element={<Suspense fallback={<Loading />}><ReleaseManagerPage /></Suspense>} />
        <Route path="/governance" element={<Suspense fallback={<Loading />}><GovernancePage /></Suspense>} />
        <Route path="/dependencies" element={<Suspense fallback={<Loading />}><DependencyAnalyzerPage /></Suspense>} />
        <Route path="/auto-docs" element={<Suspense fallback={<Loading />}><AutoDocsPage /></Suspense>} />
        <Route path="/test-studio" element={<Suspense fallback={<Loading />}><TestStudioPage /></Suspense>} />
        <Route path="/knowledge" element={<Suspense fallback={<Loading />}><KnowledgeEnginePage /></Suspense>} />
        <Route path="/usage" element={<Suspense fallback={<Loading />}><UsageIntelligencePage /></Suspense>} />
        <Route path="/dashboards" element={<Suspense fallback={<Loading />}><DashboardsPage /></Suspense>} />
        <Route path="/code-factory" element={<Suspense fallback={<Loading />}><CodeFactoryPage /></Suspense>} />
        <Route path="/marketplace" element={<Suspense fallback={<Loading />}><MarketplacePage /></Suspense>} />
        <Route path="/admin/*" element={<Suspense fallback={<Loading />}><AdminPage /></Suspense>} />
        <Route path="/llm-providers" element={<Suspense fallback={<Loading />}><LLMProvidersPage /></Suspense>} />
      </Route>
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}

export default App;
