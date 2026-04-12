import { useState, useEffect, useCallback, type CSSProperties } from 'react';
import type {
  Incident,
  IncidentStatus,
  IncidentTimelineEntry,
  AlertSeverity,
  CreateIncidentRequest,
} from '@apex-dev-manager/shared-types';
import * as dashboardApi from '@/services/dashboard.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const containerStyle: CSSProperties = {
  padding: '1.5rem',
  height: '100%',
  overflowY: 'auto',
};

const headerStyle: CSSProperties = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '1.5rem',
};

const buttonStyle: CSSProperties = {
  padding: '0.5rem 1rem',
  fontSize: '0.8125rem',
  fontWeight: 500,
  border: 'none',
  borderRadius: '0.375rem',
  cursor: 'pointer',
  backgroundColor: '#2563eb',
  color: '#fff',
};

const secondaryButton: CSSProperties = {
  ...buttonStyle,
  backgroundColor: '#f3f4f6',
  color: '#374151',
  border: '1px solid #d1d5db',
};

const cardStyle: CSSProperties = {
  border: '1px solid #e5e7eb',
  borderRadius: '0.5rem',
  padding: '1rem',
  marginBottom: '0.75rem',
  backgroundColor: '#fff',
};

const inputStyle: CSSProperties = {
  width: '100%',
  padding: '0.5rem 0.75rem',
  fontSize: '0.875rem',
  border: '1px solid #d1d5db',
  borderRadius: '0.375rem',
  marginBottom: '0.5rem',
};

const textareaStyle: CSSProperties = {
  ...inputStyle,
  minHeight: 80,
  resize: 'vertical' as const,
};

const selectStyle: CSSProperties = {
  ...inputStyle,
  width: 'auto',
  minWidth: 120,
};

const badgeBase: CSSProperties = {
  display: 'inline-block',
  padding: '0.125rem 0.5rem',
  borderRadius: '9999px',
  fontSize: '0.6875rem',
  fontWeight: 600,
};

const statusColors: Record<IncidentStatus, { bg: string; color: string }> = {
  open: { bg: '#fef2f2', color: '#991b1b' },
  acknowledged: { bg: '#fff7ed', color: '#9a3412' },
  investigating: { bg: '#fefce8', color: '#854d0e' },
  resolved: { bg: '#dcfce7', color: '#166534' },
  closed: { bg: '#f3f4f6', color: '#6b7280' },
};

const severityColors: Record<AlertSeverity, { bg: string; color: string }> = {
  critical: { bg: '#fef2f2', color: '#991b1b' },
  error: { bg: '#fef2f2', color: '#991b1b' },
  warning: { bg: '#fefce8', color: '#854d0e' },
  info: { bg: '#dbeafe', color: '#1e40af' },
};

const timelineStyle: CSSProperties = {
  borderLeft: '2px solid #e5e7eb',
  marginLeft: '0.75rem',
  paddingLeft: '1rem',
  marginTop: '0.75rem',
};

const timelineEntryStyle: CSSProperties = {
  position: 'relative' as const,
  paddingBottom: '0.75rem',
  fontSize: '0.8125rem',
};

const timelineDotStyle: CSSProperties = {
  position: 'absolute' as const,
  left: '-1.375rem',
  top: '0.25rem',
  width: 10,
  height: 10,
  borderRadius: '50%',
  backgroundColor: '#2563eb',
  border: '2px solid #fff',
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function IncidentManager() {
  const [incidents, setIncidents] = useState<Incident[]>([]);
  const [statusFilter, setStatusFilter] = useState<IncidentStatus | ''>('');
  const [showCreateForm, setShowCreateForm] = useState(false);
  const [selectedIncident, setSelectedIncident] = useState<Incident | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Form state
  const [formTitle, setFormTitle] = useState('');
  const [formDescription, setFormDescription] = useState('');
  const [formSeverity, setFormSeverity] = useState<AlertSeverity>('warning');

  // Resolve form
  const [resolveRootCause, setResolveRootCause] = useState('');
  const [resolveResolution, setResolveResolution] = useState('');
  const [showResolveForm, setShowResolveForm] = useState(false);

  useEffect(() => {
    loadIncidents();
  }, [statusFilter]);

  const loadIncidents = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const data = await dashboardApi.getIncidents(statusFilter || undefined);
      setIncidents(data);
    } catch (err) {
      setError((err as Error).message);
    } finally {
      setLoading(false);
    }
  }, [statusFilter]);

  const handleCreate = useCallback(async () => {
    if (!formTitle || !formDescription) return;
    setError(null);
    try {
      await dashboardApi.createIncident({
        title: formTitle,
        description: formDescription,
        severity: formSeverity,
      });
      setFormTitle('');
      setFormDescription('');
      setShowCreateForm(false);
      await loadIncidents();
    } catch (err) {
      setError((err as Error).message);
    }
  }, [formTitle, formDescription, formSeverity, loadIncidents]);

  const handleResolve = useCallback(async (incidentId: string) => {
    if (!resolveResolution) return;
    setError(null);
    try {
      await dashboardApi.resolveIncident(incidentId, {
        rootCause: resolveRootCause || undefined,
        resolution: resolveResolution,
      });
      setResolveRootCause('');
      setResolveResolution('');
      setShowResolveForm(false);
      setSelectedIncident(null);
      await loadIncidents();
    } catch (err) {
      setError((err as Error).message);
    }
  }, [resolveRootCause, resolveResolution, loadIncidents]);

  return (
    <div style={containerStyle}>
      {/* Header */}
      <div style={headerStyle}>
        <h2 style={{ fontSize: '1.25rem', fontWeight: 600, color: '#111827' }}>Incident Management</h2>
        <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
          <select
            style={selectStyle}
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value as IncidentStatus | '')}
          >
            <option value="">All Status</option>
            <option value="open">Open</option>
            <option value="acknowledged">Acknowledged</option>
            <option value="investigating">Investigating</option>
            <option value="resolved">Resolved</option>
            <option value="closed">Closed</option>
          </select>
          <button type="button" style={buttonStyle} onClick={() => setShowCreateForm(!showCreateForm)}>
            {showCreateForm ? 'Cancel' : 'Create Incident'}
          </button>
        </div>
      </div>

      {error && (
        <div style={{ padding: '0.75rem', backgroundColor: '#fef2f2', border: '1px solid #fecaca', borderRadius: '0.375rem', color: '#991b1b', marginBottom: '1rem', fontSize: '0.875rem' }}>
          {error}
        </div>
      )}

      {/* Create form */}
      {showCreateForm && (
        <div style={{ ...cardStyle, marginBottom: '1.5rem', borderColor: '#2563eb' }}>
          <div style={{ fontWeight: 600, marginBottom: '0.75rem' }}>Create New Incident</div>
          <input type="text" style={inputStyle} placeholder="Incident title" value={formTitle} onChange={(e) => setFormTitle(e.target.value)} />
          <textarea style={textareaStyle} placeholder="Description" value={formDescription} onChange={(e) => setFormDescription(e.target.value)} />
          <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
            <select style={selectStyle} value={formSeverity} onChange={(e) => setFormSeverity(e.target.value as AlertSeverity)}>
              <option value="info">Info</option>
              <option value="warning">Warning</option>
              <option value="error">Error</option>
              <option value="critical">Critical</option>
            </select>
            <button type="button" style={buttonStyle} onClick={handleCreate}>Create</button>
          </div>
        </div>
      )}

      {/* Incident list */}
      {loading ? (
        <div style={{ textAlign: 'center', padding: '2rem', color: '#6b7280' }}>Loading incidents...</div>
      ) : incidents.length === 0 ? (
        <div style={{ textAlign: 'center', padding: '2rem', color: '#6b7280' }}>
          No incidents found. All systems operational.
        </div>
      ) : (
        incidents.map((incident) => {
          const sColor = statusColors[incident.status] ?? statusColors.open;
          const sevColor = severityColors[incident.severity] ?? severityColors.info;
          const isSelected = selectedIncident?.id === incident.id;

          return (
            <div
              key={incident.id}
              style={{ ...cardStyle, cursor: 'pointer', borderColor: isSelected ? '#2563eb' : '#e5e7eb' }}
              onClick={() => setSelectedIncident(isSelected ? null : incident)}
            >
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
                <div>
                  <div style={{ fontWeight: 600, marginBottom: '0.25rem' }}>{incident.title}</div>
                  <div style={{ fontSize: '0.8125rem', color: '#6b7280', marginBottom: '0.5rem' }}>{incident.description}</div>
                  <div style={{ display: 'flex', gap: '0.5rem' }}>
                    <span style={{ ...badgeBase, backgroundColor: sColor.bg, color: sColor.color }}>{incident.status}</span>
                    <span style={{ ...badgeBase, backgroundColor: sevColor.bg, color: sevColor.color }}>{incident.severity}</span>
                  </div>
                </div>
                <div style={{ textAlign: 'right', fontSize: '0.75rem', color: '#9ca3af' }}>
                  <div>{new Date(incident.createdAt).toLocaleString()}</div>
                  {incident.assignedTo && <div>Assigned: {incident.assignedTo}</div>}
                </div>
              </div>

              {/* Expanded view */}
              {isSelected && (
                <div style={{ marginTop: '1rem', borderTop: '1px solid #e5e7eb', paddingTop: '0.75rem' }} onClick={(e) => e.stopPropagation()}>
                  {/* Timeline */}
                  <div style={{ fontWeight: 500, fontSize: '0.875rem', marginBottom: '0.5rem' }}>Timeline</div>
                  <div style={timelineStyle}>
                    {incident.timeline.map((entry) => (
                      <div key={entry.id} style={timelineEntryStyle}>
                        <div style={timelineDotStyle} />
                        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                          <span style={{ fontWeight: 500 }}>{entry.status}</span>
                          <span style={{ color: '#9ca3af', fontSize: '0.75rem' }}>{new Date(entry.timestamp).toLocaleString()}</span>
                        </div>
                        <div style={{ color: '#6b7280' }}>{entry.message}</div>
                      </div>
                    ))}
                  </div>

                  {/* Resolve button */}
                  {incident.status !== 'resolved' && incident.status !== 'closed' && (
                    <div style={{ marginTop: '0.75rem' }}>
                      {showResolveForm ? (
                        <div>
                          <input type="text" style={inputStyle} placeholder="Root cause (optional)" value={resolveRootCause} onChange={(e) => setResolveRootCause(e.target.value)} />
                          <textarea style={textareaStyle} placeholder="Resolution *" value={resolveResolution} onChange={(e) => setResolveResolution(e.target.value)} />
                          <div style={{ display: 'flex', gap: '0.5rem' }}>
                            <button type="button" style={buttonStyle} onClick={() => handleResolve(incident.id)}>Resolve</button>
                            <button type="button" style={secondaryButton} onClick={() => setShowResolveForm(false)}>Cancel</button>
                          </div>
                        </div>
                      ) : (
                        <button type="button" style={{ ...buttonStyle, backgroundColor: '#22c55e' }} onClick={() => setShowResolveForm(true)}>
                          Resolve Incident
                        </button>
                      )}
                    </div>
                  )}

                  {/* Resolution info */}
                  {incident.resolution && (
                    <div style={{ marginTop: '0.75rem', padding: '0.75rem', backgroundColor: '#f0fdf4', borderRadius: '0.375rem', fontSize: '0.8125rem' }}>
                      <div style={{ fontWeight: 500, color: '#166534', marginBottom: '0.25rem' }}>Resolution</div>
                      <div style={{ color: '#374151' }}>{incident.resolution}</div>
                      {incident.rootCause && (
                        <div style={{ marginTop: '0.25rem', color: '#6b7280' }}>Root cause: {incident.rootCause}</div>
                      )}
                    </div>
                  )}
                </div>
              )}
            </div>
          );
        })
      )}
    </div>
  );
}

export default IncidentManager;
