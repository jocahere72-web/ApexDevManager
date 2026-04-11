import Redis from 'ioredis';
import { config } from './index.js';
import { logger } from '../logger.js';

export const redis = new Redis(config.redisUrl, {
  maxRetriesPerRequest: 3,
  retryStrategy(times: number): number | null {
    if (times > 10) {
      logger.error('Redis: max retry attempts reached, giving up');
      return null;
    }
    const delay = Math.min(times * 200, 5000);
    logger.warn({ attempt: times, delay }, 'Redis: retrying connection');
    return delay;
  },
  lazyConnect: false,
});

redis.on('connect', () => {
  logger.info('Redis client connected');
});

redis.on('ready', () => {
  logger.info('Redis client ready');
});

redis.on('error', (err) => {
  logger.error({ err }, 'Redis client error');
});

redis.on('close', () => {
  logger.warn('Redis connection closed');
});

redis.on('reconnecting', () => {
  logger.info('Redis client reconnecting');
});

/**
 * Check Redis connectivity by sending a PING command.
 * Returns true if Redis responds with PONG, false otherwise.
 */
export async function checkRedisHealth(): Promise<boolean> {
  try {
    const result = await redis.ping();
    return result === 'PONG';
  } catch {
    return false;
  }
}
