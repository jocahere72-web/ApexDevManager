declare namespace Express {
  interface Request {
    /** Tenant identifier extracted from JWT or header */
    tenantId?: string;
    /** Authenticated user identifier */
    userId?: string;
    /** Unique correlation ID for request tracing */
    correlationId: string;
  }
}
