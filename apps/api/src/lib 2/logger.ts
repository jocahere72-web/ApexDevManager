import pino from 'pino';

const level = process.env.LOG_LEVEL ?? 'info';
const isDev = process.env.NODE_ENV === 'development';

/**
 * Base Pino logger instance for the APEX API service.
 * Uses pretty-print transport in development, structured JSON in production.
 */
export const logger = pino({
  level,
  transport: isDev
    ? {
        target: 'pino-pretty',
        options: {
          colorize: true,
          translateTime: 'SYS:standard',
          ignore: 'pid,hostname',
        },
      }
    : undefined,
  serializers: pino.stdSerializers,
  base: { service: 'apex-api' },
  timestamp: pino.stdTimeFunctions.isoTime,
});

/**
 * Create a child logger with additional context fields.
 * Useful for attaching correlationId, tenantId, or other
 * request-scoped identifiers to all log entries.
 *
 * @example
 * const reqLogger = createChildLogger({ correlationId: 'abc-123', tenantId: 'tenant-456' });
 * reqLogger.info('Processing request');
 */
export function createChildLogger(context: Record<string, unknown>): pino.Logger {
  return logger.child(context);
}
