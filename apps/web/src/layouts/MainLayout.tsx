import { useState, useEffect, useCallback } from 'react';
import { Outlet, NavLink, useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';

interface NavItem {
  to: string;
  label: string;
  icon: string;
}

interface NavGroup {
  label: string;
  items: NavItem[];
}

const navGroups: NavGroup[] = [
  {
    label: 'Core',
    items: [
      { to: '/', label: 'Dashboard', icon: '📊' },
      { to: '/connections', label: 'Connections', icon: '🔌' },
      { to: '/explorer', label: 'Explorer', icon: '🌳' },
    ],
  },
  {
    label: 'Development',
    items: [
      { to: '/editor', label: 'Code Editor', icon: '✏️' },
      { to: '/ai-studio', label: 'AI Studio', icon: '🤖' },
    ],
  },
  {
    label: 'Requirements',
    items: [
      { to: '/prd', label: 'PRD Builder', icon: '📋' },
      { to: '/page-gen', label: 'PRD to Page', icon: '📄' },
    ],
  },
  {
    label: 'ALM',
    items: [
      { to: '/change-manager', label: 'Change Manager', icon: '🔄' },
      { to: '/schema-inspector', label: 'Schema Inspector', icon: '🗄️' },
      { to: '/releases', label: 'Releases', icon: '🚀' },
    ],
  },
  {
    label: 'Analysis',
    items: [
      { to: '/dependencies', label: 'Dependencies', icon: '🔗' },
      { to: '/auto-docs', label: 'Auto Docs', icon: '📝' },
      { to: '/test-studio', label: 'Test Studio', icon: '🧪' },
      { to: '/knowledge', label: 'Knowledge', icon: '📚' },
    ],
  },
  {
    label: 'Operations',
    items: [
      { to: '/code-factory', label: 'Code Factory', icon: '🏭' },
      { to: '/marketplace', label: 'Marketplace', icon: '🛒' },
      { to: '/usage', label: 'Usage & Costs', icon: '💰' },
      { to: '/dashboards', label: 'Observability', icon: '📈' },
    ],
  },
  {
    label: 'Admin',
    items: [
      { to: '/governance', label: 'AI Governance', icon: '🛡️' },
      { to: '/admin', label: 'Admin', icon: '⚙️' },
    ],
  },
];

const MOBILE_BREAKPOINT = 768;
const SIDEBAR_OPEN_WIDTH = '15rem';
const SIDEBAR_COLLAPSED_WIDTH = '3.5rem';

function MainLayout() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const [isMobile, setIsMobile] = useState(() => window.innerWidth < MOBILE_BREAKPOINT);
  const [sidebarOpen, setSidebarOpen] = useState(() => window.innerWidth >= MOBILE_BREAKPOINT);
  const [mobileDrawerOpen, setMobileDrawerOpen] = useState(false);
  const [collapsedGroups, setCollapsedGroups] = useState<Record<string, boolean>>({});

  useEffect(() => {
    const handleResize = () => {
      const mobile = window.innerWidth < MOBILE_BREAKPOINT;
      setIsMobile(mobile);
      if (mobile) {
        setSidebarOpen(false);
        setMobileDrawerOpen(false);
      } else {
        setSidebarOpen(true);
        setMobileDrawerOpen(false);
      }
    };
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  const toggleSidebar = useCallback(() => {
    if (isMobile) {
      setMobileDrawerOpen((prev) => !prev);
    } else {
      setSidebarOpen((prev) => !prev);
    }
  }, [isMobile]);

  const toggleGroup = useCallback((label: string) => {
    setCollapsedGroups((prev) => ({ ...prev, [label]: !prev[label] }));
  }, []);

  const closeMobileDrawer = useCallback(() => {
    setMobileDrawerOpen(false);
  }, []);

  const firstName = user?.displayName?.split(' ')[0] ?? 'User';
  const primaryRole = user?.roles?.[0] ?? '';

  const sidebarWidth = sidebarOpen ? SIDEBAR_OPEN_WIDTH : SIDEBAR_COLLAPSED_WIDTH;
  const showLabels = isMobile ? true : sidebarOpen;

  const linkStyle = (isActive: boolean): React.CSSProperties => ({
    display: 'flex',
    alignItems: 'center',
    gap: showLabels ? '0.5rem' : '0',
    padding: showLabels ? '0.45rem 0.75rem' : '0.45rem 0',
    justifyContent: showLabels ? 'flex-start' : 'center',
    borderRadius: '0.375rem',
    textDecoration: 'none',
    color: isActive ? '#3730a3' : '#374151',
    backgroundColor: isActive ? '#e0e7ff' : 'transparent',
    fontWeight: isActive ? 600 : 400,
    fontSize: '0.85rem',
    transition: 'background-color 0.15s, padding 0.2s',
    whiteSpace: 'nowrap',
    overflow: 'hidden',
  });

  const renderSidebarContent = () => (
    <nav style={{ display: 'flex', flexDirection: 'column', gap: '0.25rem' }}>
      {navGroups.map((group) => {
        const isCollapsed = collapsedGroups[group.label] ?? false;
        return (
          <div key={group.label} style={{ marginBottom: '0.25rem' }}>
            {/* Group header */}
            {showLabels ? (
              <button
                onClick={() => toggleGroup(group.label)}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  width: '100%',
                  padding: '0.35rem 0.75rem',
                  border: 'none',
                  background: 'none',
                  cursor: 'pointer',
                  fontSize: '0.7rem',
                  fontWeight: 600,
                  color: '#6b7280',
                  textTransform: 'uppercase',
                  letterSpacing: '0.05em',
                }}
              >
                {group.label}
                <span style={{
                  fontSize: '0.6rem',
                  transition: 'transform 0.2s',
                  transform: isCollapsed ? 'rotate(-90deg)' : 'rotate(0deg)',
                }}>
                  ▼
                </span>
              </button>
            ) : (
              <div style={{
                borderBottom: '1px solid #e5e7eb',
                margin: '0.25rem 0.5rem',
              }} />
            )}

            {/* Group items */}
            {!isCollapsed && (
              <div style={{ display: 'flex', flexDirection: 'column', gap: '0.0625rem' }}>
                {group.items.map((item) => (
                  <NavLink
                    key={item.to}
                    to={item.to}
                    end={item.to === '/'}
                    onClick={isMobile ? closeMobileDrawer : undefined}
                    style={({ isActive }) => linkStyle(isActive)}
                    title={!showLabels ? item.label : undefined}
                  >
                    <span style={{
                      fontSize: '1rem',
                      width: '1.25rem',
                      textAlign: 'center',
                      flexShrink: 0,
                    }}>
                      {item.icon}
                    </span>
                    {showLabels && <span>{item.label}</span>}
                  </NavLink>
                ))}
              </div>
            )}
          </div>
        );
      })}
    </nav>
  );

  return (
    <div style={{
      display: 'flex',
      flexDirection: 'column',
      minHeight: '100vh',
      fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
    }}>
      {/* Header */}
      <header style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 1rem',
        height: '3.5rem',
        borderBottom: '1px solid #e5e7eb',
        backgroundColor: '#1a1a2e',
        color: '#ffffff',
        zIndex: 20,
        position: 'relative',
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          {/* Hamburger / toggle button */}
          <button
            onClick={toggleSidebar}
            style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '2rem',
              height: '2rem',
              background: 'none',
              border: 'none',
              color: '#e5e7eb',
              cursor: 'pointer',
              fontSize: '1.2rem',
              borderRadius: '0.25rem',
              flexShrink: 0,
            }}
            aria-label={sidebarOpen || mobileDrawerOpen ? 'Collapse sidebar' : 'Expand sidebar'}
          >
            {(isMobile && mobileDrawerOpen) ? '✕' : '☰'}
          </button>
          <span style={{ fontSize: '1.25rem' }}>⚡</span>
          <h1 style={{ fontSize: '1.1rem', fontWeight: 700, margin: 0 }}>APEX Dev Manager</h1>
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
          <span style={{ fontSize: '0.85rem', color: '#c7d2fe' }}>{firstName}</span>
          {primaryRole && (
            <span style={{
              fontSize: '0.65rem',
              fontWeight: 600,
              color: '#e0e7ff',
              backgroundColor: '#3730a3',
              padding: '0.15rem 0.5rem',
              borderRadius: '9999px',
              textTransform: 'uppercase',
              letterSpacing: '0.04em',
            }}>
              {primaryRole}
            </span>
          )}
          <button
            onClick={logout}
            style={{
              padding: '0.35rem 0.75rem',
              backgroundColor: 'transparent',
              color: '#e5e7eb',
              border: '1px solid #4b5563',
              borderRadius: '0.375rem',
              cursor: 'pointer',
              fontSize: '0.8rem',
            }}
          >
            Sign Out
          </button>
        </div>
      </header>

      <div style={{ display: 'flex', flex: 1, position: 'relative' }}>
        {/* Mobile overlay backdrop */}
        {isMobile && mobileDrawerOpen && (
          <div
            onClick={closeMobileDrawer}
            style={{
              position: 'fixed',
              top: '3.5rem',
              left: 0,
              right: 0,
              bottom: 0,
              backgroundColor: 'rgba(0,0,0,0.4)',
              zIndex: 30,
            }}
          />
        )}

        {/* Sidebar - desktop inline / mobile overlay */}
        {(!isMobile || mobileDrawerOpen) && (
          <aside style={{
            width: isMobile ? '16rem' : sidebarWidth,
            minWidth: isMobile ? '16rem' : sidebarWidth,
            borderRight: '1px solid #e5e7eb',
            backgroundColor: '#f8fafc',
            overflowY: 'auto',
            overflowX: 'hidden',
            padding: '0.75rem 0.5rem',
            transition: isMobile ? 'none' : 'width 0.2s ease, min-width 0.2s ease',
            ...(isMobile
              ? {
                  position: 'fixed',
                  top: '3.5rem',
                  left: 0,
                  bottom: 0,
                  zIndex: 40,
                  boxShadow: '4px 0 12px rgba(0,0,0,0.15)',
                }
              : {}),
          }}>
            {renderSidebarContent()}
          </aside>
        )}

        {/* Main Content */}
        <main style={{
          flex: 1,
          padding: '1.5rem',
          backgroundColor: '#ffffff',
          overflowY: 'auto',
        }}>
          <Outlet />
        </main>
      </div>
    </div>
  );
}

export default MainLayout;
