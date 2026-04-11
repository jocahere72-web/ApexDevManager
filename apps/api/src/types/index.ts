/**
 * Standard API response envelope.
 */
export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: {
    code: string;
    message: string;
    details?: Record<string, unknown>;
    correlationId?: string;
  };
  meta?: Record<string, unknown>;
}

/**
 * Paginated API response envelope.
 */
export interface PaginatedResponse<T = unknown> extends ApiResponse<T[]> {
  pagination: {
    page: number;
    pageSize: number;
    totalItems: number;
    totalPages: number;
    hasNext: boolean;
    hasPrevious: boolean;
  };
}

/**
 * Context passed through the request lifecycle.
 */
export interface RequestContext {
  correlationId: string;
  tenantId?: string;
  userId?: string;
  startTime: number;
}
