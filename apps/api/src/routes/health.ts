import { Router, type Request, type Response } from 'express';
import { checkDatabaseHealth } from '../config/database.js';
import { checkRedisHealth } from '../config/redis.js';

export const healthRouter = Router();

/**
 * GET /health
 * Basic liveness probe. Returns 200 if the process is running.
 */
healthRouter.get('/health', (_req: Request, res: Response) => {
  res.json({
    status: 'ok',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
  });
});

/**
 * GET /ready
 * Readiness probe. Checks database and Redis connectivity.
 * Returns 200 with status "ok" if all dependencies are healthy,
 * or 503 with status "degraded" if any dependency is unhealthy.
 */
healthRouter.get('/ready', async (_req: Request, res: Response) => {
  const [databaseHealthy, redisHealthy] = await Promise.all([
    checkDatabaseHealth(),
    checkRedisHealth(),
  ]);

  const allHealthy = databaseHealthy && redisHealthy;

  const statusCode = allHealthy ? 200 : 503;
  const status = allHealthy ? 'ok' : 'degraded';

  res.status(statusCode).json({
    status,
    timestamp: new Date().toISOString(),
    checks: {
      database: {
        status: databaseHealthy ? 'ok' : 'error',
      },
      redis: {
        status: redisHealthy ? 'ok' : 'error',
      },
    },
  });
});
