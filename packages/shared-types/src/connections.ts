/**
 * Database connection management types for APEX Dev Manager.
 */

/** Supported connection drivers. */
export type ConnectionType = 'ords' | 'jdbc';

/** Deployment environment a connection targets. */
export type ConnectionEnvironment = 'dev' | 'test' | 'staging' | 'prod';

/** Real-time health status of a connection. */
export type ConnectionStatus = 'connected' | 'degraded' | 'disconnected' | 'unknown';

/** ORDS-specific connection fields. */
export interface OrdsConnectionConfig {
  type: 'ords';
  ordsBaseUrl: string;
}

/** JDBC-specific connection fields. */
export interface JdbcConnectionConfig {
  type: 'jdbc';
  host: string;
  port: number;
  serviceName: string;
}

/** Discriminated union for connection configuration. */
export type ConnectionConfig = OrdsConnectionConfig | JdbcConnectionConfig;

/** Result of a connection-test probe. */
export interface TestResult {
  success: boolean;
  latencyMs: number;
  version?: string;
  error?: string;
}

/** Connection-pool utilisation snapshot. */
export interface PoolStats {
  active: number;
  idle: number;
  total: number;
  maxSize: number;
}

/** Aggregated health information for a connection. */
export interface ConnectionHealth {
  status: ConnectionStatus;
  lastCheckAt: string | null;
  lastLatencyMs: number | null;
  consecutiveFailures: number;
}

/** Single entry in a connection's change-log history. */
export interface ChangeLogEntry {
  timestamp: string;
  action: string;
  field?: string;
  oldValue?: string;
  newValue?: string;
  actorId: string;
}

/** Full connection payload returned by the API (excludes encrypted credentials). */
export interface ConnectionResponse {
  id: string;
  tenantId: string;
  name: string;
  connectionType: ConnectionType;
  environment: ConnectionEnvironment;
  config: ConnectionConfig;
  schemaName?: string;
  workspaceName?: string;
  poolMin: number;
  poolMax: number;
  poolIncrement: number;
  health: ConnectionHealth;
  tags: string[];
  labels: Record<string, string>;
  changeLog: ChangeLogEntry[];
  isActive: boolean;
  createdBy: string;
  createdAt: string;
  updatedAt: string;
}
