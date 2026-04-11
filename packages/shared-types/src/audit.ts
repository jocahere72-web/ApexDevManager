export interface AuditEvent {
  id: string;
  tenantId: string;
  userId: string | null;
  eventType: string;
  action: string;
  entityType: string;
  entityId: string;
  payload: Record<string, unknown>;
  ipAddress: string;
  userAgent: string;
  createdAt: string;
}
