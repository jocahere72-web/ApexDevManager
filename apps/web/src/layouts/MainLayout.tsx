import { Outlet } from 'react-router-dom';

function MainLayout() {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
      <header
        style={{
          display: 'flex',
          alignItems: 'center',
          padding: '0 1.5rem',
          height: '3.5rem',
          borderBottom: '1px solid #e5e7eb',
          backgroundColor: '#ffffff',
        }}
      >
        <h1 style={{ fontSize: '1.25rem', fontWeight: 700, margin: 0 }}>APEX Dev Manager</h1>
      </header>

      <div style={{ display: 'flex', flex: 1 }}>
        <aside
          style={{
            width: '16rem',
            borderRight: '1px solid #e5e7eb',
            padding: '1rem',
            backgroundColor: '#f9fafb',
          }}
        >
          {/* Sidebar navigation placeholder */}
          <nav>
            <p style={{ color: '#6b7280', fontSize: '0.875rem' }}>Navigation placeholder</p>
          </nav>
        </aside>

        <main style={{ flex: 1, padding: '1.5rem' }}>
          <Outlet />
        </main>
      </div>
    </div>
  );
}

export default MainLayout;
