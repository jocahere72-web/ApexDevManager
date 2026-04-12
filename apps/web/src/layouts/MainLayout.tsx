import { Outlet, NavLink, useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';

const navItems = [
  { to: '/', label: 'Dashboard', icon: '📊' },
  { to: '/connections', label: 'Connections', icon: '🔌' },
  { to: '/explorer', label: 'Explorer', icon: '🌳' },
  { to: '/editor', label: 'Code Editor', icon: '✏️' },
  { to: '/ai-studio', label: 'AI Studio', icon: '🤖' },
  { to: '/prd', label: 'PRD Builder', icon: '📋' },
  { to: '/page-gen', label: 'PRD to Page', icon: '📄' },
  { to: '/change-manager', label: 'Change Manager', icon: '🔄' },
  { to: '/schema-inspector', label: 'Schema Inspector', icon: '🗄️' },
  { to: '/releases', label: 'Releases', icon: '🚀' },
  { to: '/dependencies', label: 'Dependencies', icon: '🔗' },
  { to: '/auto-docs', label: 'Auto Docs', icon: '📝' },
  { to: '/test-studio', label: 'Test Studio', icon: '🧪' },
  { to: '/knowledge', label: 'Knowledge', icon: '📚' },
  { to: '/code-factory', label: 'Code Factory', icon: '🏭' },
  { to: '/marketplace', label: 'Marketplace', icon: '🛒' },
  { to: '/governance', label: 'AI Governance', icon: '🛡️' },
  { to: '/usage', label: 'Usage & Costs', icon: '💰' },
  { to: '/dashboards', label: 'Observability', icon: '📈' },
  { to: '/admin', label: 'Admin', icon: '⚙️' },
];

const linkStyle: React.CSSProperties = {
  display: 'flex',
  alignItems: 'center',
  gap: '0.5rem',
  padding: '0.5rem 0.75rem',
  borderRadius: '0.375rem',
  textDecoration: 'none',
  color: '#374151',
  fontSize: '0.85rem',
  transition: 'background-color 0.15s',
};

const activeLinkStyle: React.CSSProperties = {
  ...linkStyle,
  backgroundColor: '#e0e7ff',
  color: '#3730a3',
  fontWeight: 600,
};

function MainLayout() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif' }}>
      {/* Header */}
      <header style={{
        display: 'flex', alignItems: 'center', justifyContent: 'space-between',
        padding: '0 1.5rem', height: '3.5rem', borderBottom: '1px solid #e5e7eb',
        backgroundColor: '#1a1a2e', color: '#ffffff',
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
          <span style={{ fontSize: '1.25rem' }}>⚡</span>
          <h1 style={{ fontSize: '1.1rem', fontWeight: 700, margin: 0 }}>APEX Dev Manager</h1>
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
          <span style={{ fontSize: '0.85rem', color: '#a5b4fc' }}>
            {user?.displayName} ({user?.roles?.join(', ')})
          </span>
          <button
            onClick={logout}
            style={{
              padding: '0.35rem 0.75rem', backgroundColor: 'transparent', color: '#e5e7eb',
              border: '1px solid #4b5563', borderRadius: '0.375rem', cursor: 'pointer',
              fontSize: '0.8rem',
            }}
          >
            Sign Out
          </button>
        </div>
      </header>

      <div style={{ display: 'flex', flex: 1 }}>
        {/* Sidebar */}
        <aside style={{
          width: '15rem', borderRight: '1px solid #e5e7eb', backgroundColor: '#f8fafc',
          overflowY: 'auto', padding: '0.75rem 0.5rem',
        }}>
          <nav style={{ display: 'flex', flexDirection: 'column', gap: '0.125rem' }}>
            {navItems.map((item) => (
              <NavLink
                key={item.to}
                to={item.to}
                end={item.to === '/'}
                style={({ isActive }) => isActive ? activeLinkStyle : linkStyle}
              >
                <span style={{ fontSize: '1rem', width: '1.25rem', textAlign: 'center' }}>{item.icon}</span>
                {item.label}
              </NavLink>
            ))}
          </nav>
        </aside>

        {/* Main Content */}
        <main style={{ flex: 1, padding: '1.5rem', backgroundColor: '#ffffff', overflowY: 'auto' }}>
          <Outlet />
        </main>
      </div>
    </div>
  );
}

export default MainLayout;
