import { useState, useEffect, type CSSProperties } from 'react';
import type {
  GovernanceDashboard as DashboardData,
  SafetyRule,
  AIAuditEntry,
  SafetyAction,
} from '@apex-dev-manager/shared-types';
import * as governanceApi from '@/services/governance.api';

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

const styles: Record<string, CSSProperties> = {
  container: {
    padding: '24px',
  },
  title: {
    fontSize: '24px',
    fontWeight: 600,
    color: '#1a1a2e',
    margin: '0 0 24px',
  },
  statsGrid: {
    display: 'grid',
    gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
    gap: '16px',
    marginBottom: '24px',
  },
  statCard: {
    backgroundColor: '#fff',
    borderRadius: '10px',
    padding: '20px',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
    border: '1px solid #f0f0f0',
  },
  statLabel: {
    fontSize: '12px',
    fontWeight: 600,
    color: '#6c757d',
    textTransform: 'uppercase' as const,
    letterSpacing: '0.5px',
    marginBottom: '8px',
  },
  statValue: {
    fontSize: '28px',
    fontWeight: 700,
    color: '#1a1a2e',
  },
  section: {
    marginBottom: '24px',
  },
  sectionTitle: {
    fontSize: '18px',
    fontWeight: 600,
    color: '#333',
    marginBottom: '12px',
  },
  table: {
    width: '100%',
    borderCollapse: 'collapse' as const,
    backgroundColor: '#fff',
    borderRadius: '8px',
    overflow: 'hidden',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
  },
  th: {
    textAlign: 'left' as const,
    padding: '12px 16px',
    backgroundColor: '#f8f9fa',
    fontSize: '11px',
    fontWeight: 600,
    color: '#6c757d',
    textTransform: 'uppercase' as const,
    borderBottom: '2px solid #e9ecef',
  },
  td: {
    padding: '10px 16px',
    borderBottom: '1px solid #f0f0f0',
    fontSize: '13px',
  },
  badge: {
    display: 'inline-block',
    padding: '2px 8px',
    borderRadius: '10px',
    fontSize: '11px',
    fontWeight: 600,
  },
  rulesCard: {
    backgroundColor: '#fff',
    borderRadius: '8px',
    boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
    padding: '16px',
  },
  ruleRow: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '10px 0',
    borderBottom: '1px solid #f0f0f0',
  },
  ruleInfo: {
    flex: 1,
  },
  addRuleForm: {
    display: 'flex',
    gap: '8px',
    marginTop: '16px',
    paddingTop: '16px',
    borderTop: '1px solid #e9ecef',
  },
  input: {
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '13px',
  },
  select: {
    padding: '8px 12px',
    borderRadius: '6px',
    border: '1px solid #ddd',
    fontSize: '13px',
  },
  btn: {
    padding: '8px 14px',
    border: 'none',
    borderRadius: '6px',
    cursor: 'pointer',
    fontSize: '13px',
    fontWeight: 500,
    backgroundColor: '#6c5ce7',
    color: '#fff',
  },
  toggle: {
    cursor: 'pointer',
    padding: '4px 10px',
    borderRadius: '12px',
    fontSize: '11px',
    fontWeight: 600,
    border: 'none',
  },
  tabBar: {
    display: 'flex',
    borderBottom: '2px solid #e9ecef',
    marginBottom: '16px',
    gap: '0',
  },
  tab: {
    padding: '10px 20px',
    cursor: 'pointer',
    fontSize: '14px',
    fontWeight: 500,
    color: '#6c757d',
    borderBottom: '2px solid transparent',
    marginBottom: '-2px',
  },
  tabActive: {
    color: '#6c5ce7',
    borderBottom: '2px solid #6c5ce7',
  },
};

const actionColors: Record<SafetyAction, { bg: string; text: string }> = {
  block: { bg: '#fce4ec', text: '#c62828' },
  warn: { bg: '#fff3e0', text: '#e65100' },
  log: { bg: '#e3f2fd', text: '#1565c0' },
};

type TabView = 'dashboard' | 'audit' | 'rules';

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function GovernanceDashboard() {
  const [activeTab, setActiveTab] = useState<TabView>('dashboard');
  const [dashboard, setDashboard] = useState<DashboardData | null>(null);
  const [rules, setRules] = useState<SafetyRule[]>([]);
  const [auditLog, setAuditLog] = useState<AIAuditEntry[]>([]);
  const [auditTotal, setAuditTotal] = useState(0);
  const [loading, setLoading] = useState(true);

  // New rule form
  const [newRuleName, setNewRuleName] = useState('');
  const [newRulePattern, setNewRulePattern] = useState('');
  const [newRuleAction, setNewRuleAction] = useState<SafetyAction>('log');

  useEffect(() => {
    loadAll();
  }, []);

  async function loadAll() {
    setLoading(true);
    try {
      const [dashData, rulesData, auditData] = await Promise.all([
        governanceApi.getDashboard(),
        governanceApi.getSafetyRules(),
        governanceApi.getAuditLog(20),
      ]);
      setDashboard(dashData);
      setRules(rulesData);
      setAuditLog(auditData.items);
      setAuditTotal(auditData.total);
    } catch (err) {
      console.error('Failed to load governance data:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleCreateRule() {
    if (!newRuleName || !newRulePattern) return;
    try {
      const rule = await governanceApi.createSafetyRule(newRuleName, newRulePattern, newRuleAction);
      setRules((prev) => [rule, ...prev]);
      setNewRuleName('');
      setNewRulePattern('');
      setNewRuleAction('log');
    } catch (err) {
      console.error('Failed to create rule:', err);
    }
  }

  async function handleToggleRule(ruleId: string, enabled: boolean) {
    try {
      const updated = await governanceApi.updateSafetyRule(ruleId, { enabled: !enabled });
      setRules((prev) => prev.map((r) => (r.id === ruleId ? updated : r)));
    } catch (err) {
      console.error('Failed to toggle rule:', err);
    }
  }

  const formatDate = (iso: string) => {
    try {
      return new Date(iso).toLocaleString();
    } catch {
      return iso;
    }
  };

  if (loading) return <div style={{ padding: '24px' }}>Loading governance data...</div>;

  return (
    <div style={styles.container}>
      <h1 style={styles.title}>AI Governance</h1>

      <div style={styles.tabBar}>
        {(['dashboard', 'audit', 'rules'] as TabView[]).map((tab) => (
          <div
            key={tab}
            style={{ ...styles.tab, ...(activeTab === tab ? styles.tabActive : {}) }}
            onClick={() => setActiveTab(tab)}
          >
            {tab.charAt(0).toUpperCase() + tab.slice(1)}
          </div>
        ))}
      </div>

      {/* Dashboard tab */}
      {activeTab === 'dashboard' && dashboard && (
        <>
          <div style={styles.statsGrid}>
            <div style={styles.statCard}>
              <div style={styles.statLabel}>Total Requests</div>
              <div style={styles.statValue}>{dashboard.totalRequests.toLocaleString()}</div>
            </div>
            <div style={styles.statCard}>
              <div style={styles.statLabel}>Blocked</div>
              <div style={{ ...styles.statValue, color: '#e74c3c' }}>
                {dashboard.blockedRequests.toLocaleString()}
              </div>
            </div>
            <div style={styles.statCard}>
              <div style={styles.statLabel}>Total Cost</div>
              <div style={{ ...styles.statValue, color: '#27ae60' }}>
                ${dashboard.totalCostUsd.toFixed(2)}
              </div>
            </div>
            <div style={styles.statCard}>
              <div style={styles.statLabel}>Block Rate</div>
              <div style={styles.statValue}>
                {dashboard.totalRequests > 0
                  ? ((dashboard.blockedRequests / dashboard.totalRequests) * 100).toFixed(1)
                  : '0'}
                %
              </div>
            </div>
          </div>

          {/* By Model */}
          <div style={styles.section}>
            <h2 style={styles.sectionTitle}>Usage by Model</h2>
            <table style={styles.table}>
              <thead>
                <tr>
                  <th style={styles.th}>Model</th>
                  <th style={styles.th}>Requests</th>
                  <th style={styles.th}>Cost</th>
                </tr>
              </thead>
              <tbody>
                {dashboard.byModel.map((m) => (
                  <tr key={m.model}>
                    <td style={styles.td}><strong>{m.model}</strong></td>
                    <td style={styles.td}>{m.count.toLocaleString()}</td>
                    <td style={styles.td}>${m.costUsd.toFixed(4)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {/* Risk Distribution */}
          {dashboard.riskDistribution.length > 0 && (
            <div style={styles.section}>
              <h2 style={styles.sectionTitle}>Risk Distribution</h2>
              <div style={{ display: 'flex', gap: '12px' }}>
                {dashboard.riskDistribution.map((r) => (
                  <div key={r.level} style={styles.statCard}>
                    <div style={styles.statLabel}>{r.level}</div>
                    <div style={styles.statValue}>{r.count}</div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </>
      )}

      {/* Audit Log tab */}
      {activeTab === 'audit' && (
        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>Audit Log ({auditTotal} entries)</h2>
          <table style={styles.table}>
            <thead>
              <tr>
                <th style={styles.th}>Time</th>
                <th style={styles.th}>Model</th>
                <th style={styles.th}>Risk</th>
                <th style={styles.th}>Blocked</th>
                <th style={styles.th}>Tokens</th>
                <th style={styles.th}>Cost</th>
              </tr>
            </thead>
            <tbody>
              {auditLog.map((entry) => (
                <tr key={entry.id}>
                  <td style={styles.td}>{formatDate(entry.createdAt)}</td>
                  <td style={styles.td}>{entry.model ?? '--'}</td>
                  <td style={styles.td}>
                    {entry.promptRiskLevel ? (
                      <span
                        style={{
                          ...styles.badge,
                          backgroundColor:
                            entry.promptRiskLevel === 'high'
                              ? '#fce4ec'
                              : entry.promptRiskLevel === 'medium'
                                ? '#fff3e0'
                                : '#e8f5e9',
                          color:
                            entry.promptRiskLevel === 'high'
                              ? '#c62828'
                              : entry.promptRiskLevel === 'medium'
                                ? '#e65100'
                                : '#2e7d32',
                        }}
                      >
                        {entry.promptRiskLevel}
                      </span>
                    ) : (
                      '--'
                    )}
                  </td>
                  <td style={styles.td}>
                    {entry.blocked ? (
                      <span style={{ ...styles.badge, backgroundColor: '#fce4ec', color: '#c62828' }}>
                        BLOCKED
                      </span>
                    ) : (
                      <span style={{ color: '#27ae60' }}>OK</span>
                    )}
                  </td>
                  <td style={styles.td}>{entry.tokensUsed.toLocaleString()}</td>
                  <td style={styles.td}>${entry.costUsd.toFixed(4)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {/* Safety Rules tab */}
      {activeTab === 'rules' && (
        <div style={styles.section}>
          <h2 style={styles.sectionTitle}>Safety Rules</h2>
          <div style={styles.rulesCard}>
            {rules.length === 0 ? (
              <div style={{ textAlign: 'center', padding: '24px', color: '#999' }}>
                No safety rules configured
              </div>
            ) : (
              rules.map((rule) => {
                const ac = actionColors[rule.action];
                return (
                  <div key={rule.id} style={styles.ruleRow}>
                    <div style={styles.ruleInfo}>
                      <strong>{rule.ruleName}</strong>
                      <div style={{ fontSize: '12px', color: '#999', marginTop: '2px' }}>
                        Pattern: <code>{rule.pattern}</code>
                      </div>
                    </div>
                    <span
                      style={{
                        ...styles.badge,
                        backgroundColor: ac.bg,
                        color: ac.text,
                        marginRight: '12px',
                      }}
                    >
                      {rule.action}
                    </span>
                    <button
                      style={{
                        ...styles.toggle,
                        backgroundColor: rule.enabled ? '#e8f5e9' : '#f0f0f0',
                        color: rule.enabled ? '#2e7d32' : '#999',
                      }}
                      onClick={() => handleToggleRule(rule.id, rule.enabled)}
                    >
                      {rule.enabled ? 'Enabled' : 'Disabled'}
                    </button>
                  </div>
                );
              })
            )}

            {/* Add rule form */}
            <div style={styles.addRuleForm}>
              <input
                style={{ ...styles.input, flex: 1 }}
                placeholder="Rule name"
                value={newRuleName}
                onChange={(e) => setNewRuleName(e.target.value)}
              />
              <input
                style={{ ...styles.input, flex: 2 }}
                placeholder="Regex pattern"
                value={newRulePattern}
                onChange={(e) => setNewRulePattern(e.target.value)}
              />
              <select
                style={styles.select}
                value={newRuleAction}
                onChange={(e) => setNewRuleAction(e.target.value as SafetyAction)}
              >
                <option value="log">Log</option>
                <option value="warn">Warn</option>
                <option value="block">Block</option>
              </select>
              <button style={styles.btn} onClick={handleCreateRule}>
                Add Rule
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
