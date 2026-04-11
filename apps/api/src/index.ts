import 'dotenv/config';

import { createApp } from './app.js';
import { config } from './config/index.js';
import { pool } from './config/database.js';
import { redis } from './config/redis.js';
import { logger } from './logger.js';

const app = createApp();

async function start(): Promise<void> {
  try {
    // Verify database connectivity
    await pool.query('SELECT 1');
    logger.info('PostgreSQL connection established');

    // Verify Redis connectivity
    await redis.ping();
    logger.info('Redis connection established');

    // Start HTTP server
    const server = app.listen(config.port, () => {
      logger.info(
        { port: config.port, env: config.nodeEnv },
        `APEX Dev Manager API running on port ${config.port}`,
      );
    });

    // Graceful shutdown
    const shutdown = async (signal: string): Promise<void> => {
      logger.info({ signal }, 'Shutdown signal received, closing gracefully');

      server.close(async () => {
        logger.info('HTTP server closed');

        try {
          await pool.end();
          logger.info('PostgreSQL pool closed');
        } catch (err) {
          logger.error({ err }, 'Error closing PostgreSQL pool');
        }

        try {
          redis.disconnect();
          logger.info('Redis connection closed');
        } catch (err) {
          logger.error({ err }, 'Error closing Redis connection');
        }

        logger.info('Graceful shutdown complete');
        process.exit(0);
      });

      // Force shutdown after 30 seconds
      setTimeout(() => {
        logger.error('Forced shutdown after timeout');
        process.exit(1);
      }, 30000).unref();
    };

    process.on('SIGTERM', () => shutdown('SIGTERM'));
    process.on('SIGINT', () => shutdown('SIGINT'));
  } catch (err) {
    logger.fatal({ err }, 'Failed to start server');
    process.exit(1);
  }
}

start();
