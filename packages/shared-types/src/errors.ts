/**
 * Standardised error types for APEX Dev Manager API.
 */

/** Machine-readable error codes used across the API. */
export enum ErrorCode {
  // Authentication errors
  AUTH_INVALID_CREDENTIALS = 'AUTH_INVALID_CREDENTIALS',
  AUTH_TOKEN_EXPIRED = 'AUTH_TOKEN_EXPIRED',
  AUTH_TOKEN_INVALID = 'AUTH_TOKEN_INVALID',
  AUTH_REFRESH_REUSED = 'AUTH_REFRESH_REUSED',
  AUTH_ACCOUNT_LOCKED = 'AUTH_ACCOUNT_LOCKED',
  AUTH_INSUFFICIENT_ROLE = 'AUTH_INSUFFICIENT_ROLE',
  AUTH_TENANT_MISMATCH = 'AUTH_TENANT_MISMATCH',
  AUTH_LAST_ADMIN = 'AUTH_LAST_ADMIN',

  // User errors
  USER_NOT_FOUND = 'USER_NOT_FOUND',
  USER_EMAIL_EXISTS = 'USER_EMAIL_EXISTS',

  // Connection errors
  CONN_NOT_FOUND = 'CONN_NOT_FOUND',
  CONN_TEST_FAILED = 'CONN_TEST_FAILED',
  CONN_ORDS_UNREACHABLE = 'CONN_ORDS_UNREACHABLE',
  CONN_JDBC_UNREACHABLE = 'CONN_JDBC_UNREACHABLE',
  CONN_DECRYPT_FAILED = 'CONN_DECRYPT_FAILED',
  CONN_DUPLICATE_NAME = 'CONN_DUPLICATE_NAME',

  // General errors
  VALIDATION_ERROR = 'VALIDATION_ERROR',
  RATE_LIMIT_EXCEEDED = 'RATE_LIMIT_EXCEEDED',
  INTERNAL_ERROR = 'INTERNAL_ERROR',
}

/** Standard error response envelope. */
export interface ErrorResponse {
  success: false;
  error: {
    code: ErrorCode;
    message: string;
    details?: unknown;
    correlationId?: string;
  };
}

/** Individual field-level validation error. */
export interface ValidationErrorDetail {
  field: string;
  message: string;
  code: string;
}
