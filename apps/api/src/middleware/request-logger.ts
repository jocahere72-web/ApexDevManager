import pinoHttp from 'pino-http';
import { v4 as uuidv4 } from 'uuid';
import type { Request } from 'express';
import { logger } from '../lib/logger.js';

/**
 * pino-http middleware configured for the APEX API.
 *
 * Features:
 * - Custom log level based on HTTP status code
 * - Structured request/response serializers
 * - Correlation ID and tenant ID propagation
 * - Duration tracking in success/error messages
 */
export const requestLogger = pinoHttp({
  logger,

  genReqId: (req) => (req as Request).correlationId ?? uuidv4(),

  customLogLevel: (_req, res, err) => {
    if (err || (res.statusCode && res.statusCode >= 500)) {
      return 'error';
    }
    if (res.statusCode && res.statusCode >= 400) {
      return 'warn';
    }
    return 'info';
  },

  customSuccessMessage: (req, res, responseTime) => {
    return `${req.method} ${req.url} ${res.statusCode} ${Math.round(responseTime as number)}ms`;
  },

  customErrorMessage: (req, res, err) => {
    return `${req.method} ${req.url} ${res.statusCode} - ${err.message}`;
  },

  customProps: (req) => ({
    correlationId: (req as Request).correlationId,
    tenantId: (req as Request).tenantId,
  }),

  serializers: {
    req: (req) => ({
      method: req.method,
      url: req.url,
      correlationId: req.raw?.headers?.['x-correlation-id'],
      tenantId: (req.raw as Request | undefined)?.tenantId,
    }),
    res: (res) => ({
      statusCode: res.statusCode,
    }),
  },
});
