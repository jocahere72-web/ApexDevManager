export enum ConnectionType {
  ORDS = 'ORDS',
  JDBC = 'JDBC',
}

export enum HealthStatus {
  HEALTHY = 'HEALTHY',
  UNHEALTHY = 'UNHEALTHY',
  UNKNOWN = 'UNKNOWN',
}

export interface Connection {
  id: string;
  tenantId: string;
  name: string;
  connectionType: ConnectionType;
  ordsUrl?: string;
  dbHost?: string;
  serviceName?: string;
  healthStatus: HealthStatus;
  lastHealthCheckAt: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface CreateConnectionRequest {
  name: string;
  connectionType: ConnectionType;
  ordsUrl?: string;
  dbHost?: string;
  serviceName?: string;
  username: string;
  password: string;
}
