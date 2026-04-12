import type { Request, Response, NextFunction } from 'express';
import { NotFoundError } from '../lib/errors.js';

/**
 * 404 handler middleware.
 * Must be mounted after all route handlers and before the error handler.
 * Throws a NotFoundError which is caught by the global error handler.
 */
export function notFound(req: Request, _res: Response, next: NextFunction): void {
  next(new NotFoundError(`Route ${req.method} ${req.path} not found`));
}
