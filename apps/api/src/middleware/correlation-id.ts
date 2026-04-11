import type { Request, Response, NextFunction } from 'express';
import { v4 as uuidv4 } from 'uuid';

const CORRELATION_ID_HEADER = 'x-correlation-id';

/**
 * Middleware that ensures every request has a correlation ID.
 *
 * - Reads the X-Correlation-ID header from the incoming request
 * - If absent, generates a new UUID v4
 * - Attaches the ID to req.correlationId
 * - Sets the X-Correlation-ID response header for client tracing
 */
export function correlationId(req: Request, res: Response, next: NextFunction): void {
  const id = (req.headers[CORRELATION_ID_HEADER] as string | undefined) ?? uuidv4();

  req.correlationId = id;
  res.setHeader(CORRELATION_ID_HEADER, id);

  next();
}
