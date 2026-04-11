import type { Request, Response, NextFunction } from 'express';
import { AppError } from '../lib/errors.js';
import { logger } from '../lib/logger.js';

/**
 * Global error handler middleware.
 *
 * - Recognizes AppError subclasses and maps them to structured responses
 * - Handles JSON parse errors (malformed request body)
 * - Handles Zod validation errors
 * - Logs full error details server-side
 * - Omits stack traces in production responses
 */
export function errorHandler(err: Error, req: Request, res: Response, _next: NextFunction): void {
  const correlationId = req.correlationId ?? 'unknown';

  // Handle AppError (operational errors)
  if (err instanceof AppError) {
    if (err.statusCode >= 500) {
      logger.error({ err, correlationId, method: req.method, url: req.url }, err.message);
    } else {
      logger.warn({ err, correlationId, method: req.method, url: req.url }, err.message);
    }

    const response: Record<string, unknown> = {
      success: false,
      error: {
        code: err.code,
        message: err.message,
        ...(err.details ? { details: err.details } : {}),
      },
    };

    res.status(err.statusCode).json(response);
    return;
  }

  // Handle JSON parse errors (SyntaxError from body-parser)
  if (
    err instanceof SyntaxError &&
    'status' in err &&
    (err as SyntaxError & { status: number }).status === 400 &&
    'body' in err
  ) {
    logger.warn(
      { correlationId, method: req.method, url: req.url },
      'Invalid JSON in request body',
    );

    res.status(400).json({
      success: false,
      error: {
        code: 'VALIDATION_ERROR',
        message: 'Invalid JSON in request body',
      },
    });
    return;
  }

  // Handle Zod validation errors
  if (err.name === 'ZodError' && 'issues' in err) {
    logger.warn(
      { err, correlationId, method: req.method, url: req.url },
      'Request validation failed',
    );

    res.status(400).json({
      success: false,
      error: {
        code: 'VALIDATION_ERROR',
        message: 'Request validation failed',
        details: (err as Error & { issues: unknown[] }).issues,
      },
    });
    return;
  }

  // Unexpected / non-operational errors
  logger.error({ err, correlationId, method: req.method, url: req.url }, 'Unhandled error');

  const isProduction = process.env.NODE_ENV === 'production';

  res.status(500).json({
    success: false,
    error: {
      code: 'INTERNAL_ERROR',
      message: isProduction ? 'An unexpected error occurred' : err.message,
      ...(isProduction ? {} : { stack: err.stack }),
      correlationId,
    },
  });
}
