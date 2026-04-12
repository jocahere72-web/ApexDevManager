import { useCallback, useEffect, useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
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
      { to: '/issues', label: 'Issues', icon: '📋' },
      { to: '/clients', label: 'Clients', icon: '🏢' },
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

function MainLayout() {
  const { user, logout } = useAuth();
  const [isMobile, setIsMobile] = useState(() => window.innerWidth < MOBILE_BREAKPOINT);
  const [sidebarOpen, setSidebarOpen] = useState(() => window.innerWidth >= MOBILE_BREAKPOINT);
  const [mobileDrawerOpen, setMobileDrawerOpen] = useState(false);
  const [collapsedGroups, setCollapsedGroups] = useState<Record<string, boolean>>({});

  useEffect(() => {
    const handleResize = () => {
      const mobile = window.innerWidth < MOBILE_BREAKPOINT;
      setIsMobile(mobile);
      setMobileDrawerOpen(false);
      setSidebarOpen(!mobile);
    };

    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  const toggleSidebar = useCallback(() => {
    if (isMobile) {
      setMobileDrawerOpen((current) => !current);
      return;
    }

    setSidebarOpen((current) => !current);
  }, [isMobile]);

  const toggleGroup = useCallback((label: string) => {
    setCollapsedGroups((current) => ({ ...current, [label]: !current[label] }));
  }, []);

  const closeMobileDrawer = useCallback(() => {
    setMobileDrawerOpen(false);
  }, []);

  const firstName = user?.displayName?.split(' ')[0] ?? 'User';
  const primaryRole = user?.roles?.[0] ?? '';
  const showLabels = isMobile || sidebarOpen;

  const shellClassName = [
    'app-shell',
    !sidebarOpen && !isMobile ? 'app-shell-collapsed' : '',
    mobileDrawerOpen ? 'app-shell-mobile-open' : '',
  ]
    .filter(Boolean)
    .join(' ');

  return (
    <div className={shellClassName}>
      <header className="app-topbar">
        <div className="app-brand">
          <button
            type="button"
            className="app-icon-button"
            onClick={toggleSidebar}
            aria-label={sidebarOpen || mobileDrawerOpen ? 'Collapse sidebar' : 'Expand sidebar'}
          >
            {isMobile && mobileDrawerOpen ? 'x' : 'menu'}
          </button>
          <div className="app-brand-mark" aria-hidden="true">
            A
          </div>
          <div>
            <h1 className="app-brand-title">APEX Dev Manager</h1>
            <p className="app-brand-subtitle">Oracle APEX delivery workspace</p>
          </div>
        </div>

        <div className="app-topbar-actions">
          <div className="app-user-chip">
            <strong>{firstName}</strong>
            {primaryRole && <span>{primaryRole}</span>}
          </div>
          {primaryRole && <span className="app-role-pill">{primaryRole}</span>}
          <button type="button" className="app-button" onClick={logout}>
            Sign out
          </button>
        </div>
      </header>

      <div className="app-body">
        {isMobile && mobileDrawerOpen && (
          <button
            type="button"
            className="app-mobile-backdrop"
            aria-label="Close navigation"
            onClick={closeMobileDrawer}
          />
        )}

        <aside className="app-sidebar">
          <nav className="app-nav" aria-label="Main navigation">
            {navGroups.map((group) => {
              const isCollapsed = collapsedGroups[group.label] ?? false;

              return (
                <section className="app-nav-group" key={group.label}>
                  {showLabels ? (
                    <button
                      type="button"
                      className="app-nav-group-button"
                      onClick={() => toggleGroup(group.label)}
                    >
                      <span>{group.label}</span>
                      <span className="app-nav-chevron">{isCollapsed ? '+' : '-'}</span>
                    </button>
                  ) : (
                    <div className="app-nav-divider" />
                  )}

                  {!isCollapsed && (
                    <div className="app-nav-items">
                      {group.items.map((item) => (
                        <NavLink
                          key={item.to}
                          to={item.to}
                          end={item.to === '/'}
                          className={({ isActive }) =>
                            `app-nav-link${isActive ? ' app-nav-link-active' : ''}`
                          }
                          onClick={isMobile ? closeMobileDrawer : undefined}
                          title={!showLabels ? item.label : undefined}
                        >
                          <span className="app-nav-icon" aria-hidden="true">
                            {item.icon}
                          </span>
                          <span className="app-nav-label">{item.label}</span>
                        </NavLink>
                      ))}
                    </div>
                  )}
                </section>
              );
            })}
          </nav>
        </aside>

        <main className="app-main">
          <Outlet />
        </main>
      </div>
    </div>
  );
}

export default MainLayout;
