import { useState, type ChangeEvent } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  AppCard,
  AppEmptyState,
  AppPage,
  AppPageHeader,
  AppStatusPill,
} from '@/components/ui/AppTemplate';
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

  // -- Render ----------------------------------------------------------------

  return (
    <AppPage>
      <AppPageHeader
        eyebrow="APEX Connectivity"
        title="Connections"
        description="Manage ORDS and database endpoints used by Explorer, Editor, automation and release workflows."
        actions={
          <button
            type="button"
            className="app-button app-button-primary"
            onClick={() => navigate('/connections/new')}
          >
            New connection
          </button>
        }
      />

      {/* Filter bar */}
      <AppCard>
        <div className="app-toolbar conn-filter-bar">
          <input
            type="text"
            placeholder="Search connections..."
            value={filters.search}
            onChange={handleSearchChange}
            className="app-input conn-filter-search"
          />
          <select
            value={filters.environment}
            onChange={handleEnvChange}
            className="app-select conn-filter-select"
          >
            <option value="">All Environments</option>
            <option value="dev">Development</option>
            <option value="test">Test</option>
            <option value="staging">Staging</option>
            <option value="prod">Production</option>
          </select>
          <select
            value={filters.status}
            onChange={handleStatusChange}
            className="app-select conn-filter-select"
          >
            <option value="">All Statuses</option>
            <option value="connected">Connected</option>
            <option value="degraded">Degraded</option>
            <option value="disconnected">Disconnected</option>
            <option value="unknown">Unknown</option>
          </select>
        </div>

        {/* Loading / Error */}
        {isLoading && <AppEmptyState>Loading connections...</AppEmptyState>}
        {isError && (
          <p className="conn-error-text">
            Failed to load connections: {(error as Error).message}
          </p>
        )}

        {/* Table */}
        {data && (
          <>
            <div className="app-table-wrap">
              <table className="app-table">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Environment</th>
                    <th>Status</th>
                    <th>Last Check</th>
                  </tr>
                </thead>
                <tbody>
                  {data.data.length === 0 && (
                    <tr>
                      <td colSpan={5}>
                        <AppEmptyState>No connections found.</AppEmptyState>
                      </td>
                    </tr>
                  )}
                  {data.data.map((conn) => (
                    <tr
                      key={conn.id}
                      className="app-table-row"
                      onClick={() => navigate(`/connections/${conn.id}`)}
                    >
                      <td className="conn-name-cell">{conn.name}</td>
                      <td>
                        <AppStatusPill tone="accent">{conn.type}</AppStatusPill>
                      </td>
                      <td className="conn-env-cell">{conn.environment}</td>
                      <td>
                        <HealthBadge
                          status={conn.status}
                          size="sm"
                          latencyMs={conn.latencyMs}
                          lastCheckAt={conn.lastCheckAt}
                        />
                      </td>
                      <td className="conn-meta-cell">
                        {formatDate(conn.lastCheckAt)}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* Pagination */}
            {data.totalPages > 1 && (
              <div className="app-toolbar conn-pagination">
                <span>
                  Page {data.page} of {data.totalPages} ({data.total} total)
                </span>
                <div className="conn-pagination-buttons">
                  <button
                    type="button"
                    className="app-button"
                    disabled={data.page <= 1}
                    onClick={() => goToPage(data.page - 1)}
                  >
                    Previous
                  </button>
                  <button
                    type="button"
                    className="app-button"
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
      </AppCard>
    </AppPage>
  );
}
