import { useState, type CSSProperties, type ChangeEvent } from 'react';
import { useNavigate } from 'react-router-dom';
import { useConnections } from '../hooks/useConnections';
import HealthBadge from './HealthBadge';
import type { ConnectionFilters, ConnectionStatus, Environment } from '@/services/connections.api';

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function ConnectionList() {
  const navigate = useNavigate();

  const [filters, setFilters] = useState<ConnectionFilters>({
    search: '',
    environment: '',
    status: '',
    page: 1,
    pageSize: 20,
  });

  const { data, isLoading, isError, error } = useConnections(filters);

  // -- Filter handlers -------------------------------------------------------

  const handleSearchChange = (e: ChangeEvent<HTMLInputElement>) => {
    setFilters((prev) => ({ ...prev, search: e.target.value, page: 1 }));
  };

  const handleEnvChange = (e: ChangeEvent<HTMLSelectElement>) => {
    setFilters((prev) => ({
      ...prev,
      environment: e.target.value as Environment | '',
      page: 1,
    }));
  };

  const handleStatusChange = (e: ChangeEvent<HTMLSelectElement>) => {
    setFilters((prev) => ({
      ...prev,
      status: e.target.value as ConnectionStatus | '',
      page: 1,
    }));
  };

  const goToPage = (page: number) => {
    setFilters((prev) => ({ ...prev, page }));
  };

  // -- Formatting helpers ----------------------------------------------------

  const formatDate = (iso: string | null) => {
    if (!iso) return '--';
    try {
      return new Date(iso).toLocaleString();
    } catch {
      return iso;
    }
  };

  // -- Styles ----------------------------------------------------------------

  const containerStyle: CSSProperties = { display: 'flex', flexDirection: 'column', gap: '1rem' };

  const headerStyle: CSSProperties = {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    flexWrap: 'wrap',
    gap: '0.75rem',
  };

  const filterBarStyle: CSSProperties = {
    display: 'flex',
    gap: '0.75rem',
    alignItems: 'center',
    flexWrap: 'wrap',
  };

  const inputStyle: CSSProperties = {
    padding: '0.5rem 0.75rem',
    border: '1px solid #d1d5db',
    borderRadius: '0.375rem',
    fontSize: '0.875rem',
    minWidth: '14rem',
  };

  const selectStyle: CSSProperties = {
    ...inputStyle,
    minWidth: '10rem',
    cursor: 'pointer',
  };

  const newBtnStyle: CSSProperties = {
    padding: '0.5rem 1rem',
    backgroundColor: '#2563eb',
    color: '#ffffff',
    fontWeight: 600,
    fontSize: '0.875rem',
    border: 'none',
    borderRadius: '0.375rem',
    cursor: 'pointer',
  };

  const tableStyle: CSSProperties = {
    width: '100%',
    borderCollapse: 'collapse',
    fontSize: '0.875rem',
  };

  const thStyle: CSSProperties = {
    textAlign: 'left',
    padding: '0.75rem 1rem',
    borderBottom: '2px solid #e5e7eb',
    fontWeight: 600,
    color: '#374151',
    backgroundColor: '#f9fafb',
  };

  const tdStyle: CSSProperties = {
    padding: '0.75rem 1rem',
    borderBottom: '1px solid #f3f4f6',
    color: '#111827',
  };

  const rowStyle: CSSProperties = {
    cursor: 'pointer',
    transition: 'background-color 0.15s',
  };

  const paginationStyle: CSSProperties = {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    fontSize: '0.875rem',
    color: '#6b7280',
  };

  const pageBtnStyle = (disabled: boolean): CSSProperties => ({
    padding: '0.375rem 0.75rem',
    border: '1px solid #d1d5db',
    borderRadius: '0.375rem',
    backgroundColor: disabled ? '#f3f4f6' : '#ffffff',
    color: disabled ? '#9ca3af' : '#374151',
    cursor: disabled ? 'not-allowed' : 'pointer',
    fontSize: '0.8125rem',
  });

  // -- Render ----------------------------------------------------------------

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h2 style={{ fontSize: '1.25rem', fontWeight: 700, margin: 0 }}>Connections</h2>
        <button type="button" style={newBtnStyle} onClick={() => navigate('/connections/new')}>
          + New Connection
        </button>
      </div>

      {/* Filter bar */}
      <div style={filterBarStyle}>
        <input
          type="text"
          placeholder="Search connections..."
          value={filters.search}
          onChange={handleSearchChange}
          style={inputStyle}
        />
        <select value={filters.environment} onChange={handleEnvChange} style={selectStyle}>
          <option value="">All Environments</option>
          <option value="development">Development</option>
          <option value="staging">Staging</option>
          <option value="production">Production</option>
        </select>
        <select value={filters.status} onChange={handleStatusChange} style={selectStyle}>
          <option value="">All Statuses</option>
          <option value="connected">Connected</option>
          <option value="degraded">Degraded</option>
          <option value="disconnected">Disconnected</option>
          <option value="unknown">Unknown</option>
        </select>
      </div>

      {/* Loading / Error */}
      {isLoading && <p style={{ color: '#6b7280' }}>Loading connections...</p>}
      {isError && (
        <p style={{ color: '#dc2626' }}>
          Failed to load connections: {(error as Error).message}
        </p>
      )}

      {/* Table */}
      {data && (
        <>
          <div style={{ overflowX: 'auto' }}>
            <table style={tableStyle}>
              <thead>
                <tr>
                  <th style={thStyle}>Name</th>
                  <th style={thStyle}>Type</th>
                  <th style={thStyle}>Environment</th>
                  <th style={thStyle}>Status</th>
                  <th style={thStyle}>Last Check</th>
                </tr>
              </thead>
              <tbody>
                {data.data.length === 0 && (
                  <tr>
                    <td colSpan={5} style={{ ...tdStyle, textAlign: 'center', color: '#9ca3af' }}>
                      No connections found.
                    </td>
                  </tr>
                )}
                {data.data.map((conn) => (
                  <tr
                    key={conn.id}
                    style={rowStyle}
                    onClick={() => navigate(`/connections/${conn.id}`)}
                    onMouseEnter={(e) => {
                      (e.currentTarget as HTMLElement).style.backgroundColor = '#f9fafb';
                    }}
                    onMouseLeave={(e) => {
                      (e.currentTarget as HTMLElement).style.backgroundColor = '';
                    }}
                  >
                    <td style={{ ...tdStyle, fontWeight: 500 }}>{conn.name}</td>
                    <td style={tdStyle}>
                      <span
                        style={{
                          padding: '0.125rem 0.5rem',
                          backgroundColor: conn.type === 'ords' ? '#eff6ff' : '#f5f3ff',
                          color: conn.type === 'ords' ? '#1d4ed8' : '#6d28d9',
                          borderRadius: '0.25rem',
                          fontSize: '0.75rem',
                          fontWeight: 600,
                        }}
                      >
                        {conn.type}
                      </span>
                    </td>
                    <td style={{ ...tdStyle, textTransform: 'capitalize' }}>{conn.environment}</td>
                    <td style={tdStyle}>
                      <HealthBadge
                        status={conn.status}
                        size="sm"
                        latencyMs={conn.latencyMs}
                        lastCheckAt={conn.lastCheckAt}
                      />
                    </td>
                    <td style={{ ...tdStyle, color: '#6b7280', fontSize: '0.8125rem' }}>
                      {formatDate(conn.lastCheckAt)}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {/* Pagination */}
          {data.totalPages > 1 && (
            <div style={paginationStyle}>
              <span>
                Page {data.page} of {data.totalPages} ({data.total} total)
              </span>
              <div style={{ display: 'flex', gap: '0.5rem' }}>
                <button
                  type="button"
                  style={pageBtnStyle(data.page <= 1)}
                  disabled={data.page <= 1}
                  onClick={() => goToPage(data.page - 1)}
                >
                  Previous
                </button>
                <button
                  type="button"
                  style={pageBtnStyle(data.page >= data.totalPages)}
                  disabled={data.page >= data.totalPages}
                  onClick={() => goToPage(data.page + 1)}
                >
                  Next
                </button>
              </div>
            </div>
          )}
        </>
      )}
    </div>
  );
}
