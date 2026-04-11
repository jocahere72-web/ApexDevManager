import type { Request, Response, NextFunction } from 'express';
import type pg from 'pg';
import { pool } from '../config/database.js';
import { logger } from '../lib/logger.js';

/**
 * Augment Express Request to carry a tenant-scoped DB client.
 */
declare global {
  namespace Express {
    interface Request {
      /** Tenant-scoped database client with RLS context set. */
      dbClient?: pg.PoolClient;
    }
  }
}

/**
 * Tenant resolver middleware.
 *
 * Extracts the tenantId previously set on the request by the auth middleware,
 * acquires a database client from the pool, sets the PostgreSQL session variable
 * `app.current_tenant` via `SET LOCAL`, and attaches the client to `req.dbClient`.
 *
 * The client is automatically released when the response finishes or closes.
 *
 * If no tenantId is present on the request, responds with 401 Unauthorized.
 */
export function tenantResolver() {
  return async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const tenantId = req.tenantId;

    if (!tenantId) {
      res.status(401).json({
        success: false,
        error: {
          code: 'AUTHENTICATION_ERROR',
          message: 'Tenant context is required',
        },
      });
      return;
    }

    let client: pg.PoolClient | undefined;

    try {
      client = await pool.connect();

      // SET LOCAL scopes the variable to the current transaction block.
      // We wrap the entire request in a transaction so RLS policies can
      // reference current_setting('app.current_tenant').
      await client.query('BEGIN');
      await client.query("SET LOCAL app.current_tenant = $1", [tenantId]);

      req.dbClient = client;

      // Release the client when the response finishes or the connection closes
      const cleanup = async (): Promise<void> => {
        // Remove listeners to avoid double-release
        res.removeListener('finish', cleanup);
        res.removeListener('close', cleanup);

        if (client) {
          try {
            await client.query('COMMIT');
          } catch (err) {
            logger.warn({ err, tenantId }, 'Failed to commit tenant transaction');
            try {
              await client.query('ROLLBACK');
            } catch (rollbackErr) {
              logger.error({ err: rollbackErr, tenantId }, 'Failed to rollback tenant transaction');
            }
          } finally {
            client.release();
            client = undefined;
          }
        }
      };

      res.on('finish', cleanup);
      res.on('close', cleanup);

      next();
    } catch (err) {
      if (client) {
        try {
          await client.query('ROLLBACK');
        } catch (rollbackErr) {
          logger.error({ err: rollbackErr, tenantId }, 'Failed to rollback on error');
        }
        client.release();
      }

      logger.error({ err, tenantId }, 'Failed to resolve tenant context');
      next(err);
    }
  };
}
