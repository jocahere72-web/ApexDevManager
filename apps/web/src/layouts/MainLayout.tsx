import { useCallback, useEffect, useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useAuth } from '@/hooks/useAuth';

interface NavItem {
  to: string;
  labelKey: string;
  icon: string;
}

interface NavGroup {
  labelKey: string;
  items: NavItem[];
}

const navGroups: NavGroup[] = [
  {
    labelKey: 'navGroups.pipeline',
    items: [
      { to: '/requirements/new', labelKey: 'nav.newRequirement', icon: '➕' },
      { to: '/requirements/inbox', labelKey: 'nav.devLeadInbox', icon: '📥' },
      { to: '/pipeline', labelKey: 'nav.pipeline', icon: '🔄' },
    ],
  },
  {
    labelKey: 'navGroups.core',
    items: [
      { to: '/', labelKey: 'nav.dashboard', icon: '📊' },
      { to: '/issues', labelKey: 'nav.issues', icon: '📋' },
      { to: '/clients', labelKey: 'nav.clients', icon: '🏢' },
      { to: '/connections', labelKey: 'nav.connections', icon: '🔌' },
      { to: '/explorer', labelKey: 'nav.explorer', icon: '🌳' },
    ],
  },
  {
    labelKey: 'navGroups.development',
    items: [
      { to: '/editor', labelKey: 'nav.editor', icon: '✏️' },
      { to: '/ai-studio', labelKey: 'nav.aiStudio', icon: '🤖' },
    ],
  },
  {
    labelKey: 'navGroups.requirements',
    items: [
      { to: '/prd', labelKey: 'nav.prd', icon: '📋' },
      { to: '/page-gen', labelKey: 'nav.pageGen', icon: '📄' },
    ],
  },
  {
    labelKey: 'navGroups.alm',
    items: [
      { to: '/change-manager', labelKey: 'nav.changeManager', icon: '🔄' },
      { to: '/schema-inspector', labelKey: 'nav.schemaInspector', icon: '🗄️' },
      { to: '/releases', labelKey: 'nav.releases', icon: '🚀' },
    ],
  },
  {
    labelKey: 'navGroups.analysis',
    items: [
      { to: '/dependencies', labelKey: 'nav.dependencies', icon: '🔗' },
      { to: '/auto-docs', labelKey: 'nav.autoDocs', icon: '📝' },
      { to: '/test-studio', labelKey: 'nav.testStudio', icon: '🧪' },
      { to: '/knowledge', labelKey: 'nav.knowledge', icon: '📚' },
    ],
  },
  {
    labelKey: 'navGroups.operations',
    items: [
      { to: '/code-factory', labelKey: 'nav.codeFactory', icon: '🏭' },
      { to: '/marketplace', labelKey: 'nav.marketplace', icon: '🛒' },
      { to: '/usage', labelKey: 'nav.usage', icon: '💰' },
      { to: '/dashboards', labelKey: 'nav.dashboards', icon: '📈' },
    ],
  },
  {
    labelKey: 'navGroups.admin',
    items: [
      { to: '/governance', labelKey: 'nav.governance', icon: '🛡️' },
      { to: '/users', labelKey: 'nav.users', icon: '👥' },
      { to: '/admin', labelKey: 'nav.admin', icon: '⚙️' },
      { to: '/llm-providers', labelKey: 'nav.llmProviders', icon: '🧠' },
    ],
  },
];

const MOBILE_BREAKPOINT = 768;

function MainLayout() {
  const { t, i18n } = useTranslation();
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
            <h1 className="app-brand-title">{t('app.name')}</h1>
            <p className="app-brand-subtitle">{t('app.subtitle')}</p>
          </div>
        </div>

        <div className="app-topbar-actions">
          <div className="app-user-chip">
            <strong>{firstName}</strong>
            {primaryRole && <span>{primaryRole}</span>}
          </div>
          {primaryRole && <span className="app-role-pill">{primaryRole}</span>}
          <button
            type="button"
            className="app-button"
            onClick={() => {
              const next = i18n.language === 'es' ? 'en' : 'es';
              i18n.changeLanguage(next);
              localStorage.setItem('apex_lang', next);
            }}
          >
            {i18n.language === 'es' ? 'EN' : 'ES'}
          </button>
          <button type="button" className="app-button" onClick={logout}>
            {t('auth.signOut')}
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
              const isCollapsed = collapsedGroups[group.labelKey] ?? false;

              return (
                <section className="app-nav-group" key={group.labelKey}>
                  {showLabels ? (
                    <button
                      type="button"
                      className="app-nav-group-button"
                      onClick={() => toggleGroup(group.labelKey)}
                    >
                      <span>{t(group.labelKey)}</span>
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
                          title={!showLabels ? t(item.labelKey) : undefined}
                        >
                          <span className="app-nav-icon" aria-hidden="true">
                            {item.icon}
                          </span>
                          <span className="app-nav-label">{t(item.labelKey)}</span>
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
