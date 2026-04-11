import type { Request, Response, NextFunction } from 'express';
import { RateLimiterRedis, type IRateLimiterOptions } from 'rate-limiter-flexible';
import type Redis from 'ioredis';
import { logger } from '../lib/logger.js';

/**
 * Rate limiter configuration for a single preset.
 */
export interface RateLimiterPresetConfig {
  /** Maximum number of requests within the duration window. */
  points: number;
  /** Duration of the window in seconds. */
  duration: number;
  /** Key prefix for Redis storage. */
  keyPrefix: string;
  /** Function to derive the rate-limit key from a request. Defaults to IP. */
  keyGenerator?: (req: Request) => string;
}

/**
 * Built-in preset names.
 */
export type RateLimiterPreset = 'tenant' | 'login' | 'api';

/**
 * Presets for common rate limiting scenarios.
 */
export const rateLimiterPresets: Record<RateLimiterPreset, RateLimiterPresetConfig> = {
  /** 1000 requests per minute per tenant. */
  tenant: {
    points: 1000,
    duration: 60,
    keyPrefix: 'rl:tenant',
    keyGenerator: (req: Request) => req.tenantId ?? req.ip ?? 'unknown',
  },
  /** 10 login attempts per minute per IP. */
  login: {
    points: 10,
    duration: 60,
    keyPrefix: 'rl:login',
    keyGenerator: (req: Request) => req.ip ?? 'unknown',
  },
  /** 100 API requests per minute per IP. */
  api: {
    points: 100,
    duration: 60,
    keyPrefix: 'rl:api',
    keyGenerator: (req: Request) => req.ip ?? 'unknown',
  },
};

/**
 * Configuration for the rate limiter factory.
 */
export interface CreateRateLimiterConfig {
  /** Redis client instance (ioredis). */
  redisClient: Redis;
  /** Preset name or custom configuration. */
  preset: RateLimiterPreset | RateLimiterPresetConfig;
  /** Optional overrides applied on top of the preset. */
  overrides?: Partial<IRateLimiterOptions>;
}

/**
 * Factory function that creates an Express rate-limiting middleware.
 *
 * Uses `rate-limiter-flexible` with a Redis backing store.
 * Returns a 429 response with a `Retry-After` header when the limit is exceeded.
 *
 * @example
 * ```ts
 * import { redis } from '../config/redis.js';
 * import { createRateLimiter } from '../middleware/rate-limiter.js';
 *
 * router.post('/login', createRateLimiter({ redisClient: redis, preset: 'login' }), loginHandler);
 * ```
 */
export function createRateLimiter(config: CreateRateLimiterConfig) {
  const presetConfig =
    typeof config.preset === 'string' ? rateLimiterPresets[config.preset] : config.preset;

  const rateLimiter = new RateLimiterRedis({
    storeClient: config.redisClient,
    points: presetConfig.points,
    duration: presetConfig.duration,
    keyPrefix: presetConfig.keyPrefix,
    ...config.overrides,
  });

  const keyGenerator = presetConfig.keyGenerator ?? ((req: Request) => req.ip ?? 'unknown');

  return async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const key = keyGenerator(req);
      const result = await rateLimiter.consume(key);

      // Set standard rate limit headers
      res.set('X-RateLimit-Limit', String(presetConfig.points));
      res.set('X-RateLimit-Remaining', String(result.remainingPoints));
      res.set(
        'X-RateLimit-Reset',
        String(Math.ceil(Date.now() / 1000 + result.msBeforeNext / 1000)),
      );

      next();
    } catch (rateLimiterRes: unknown) {
      // rate-limiter-flexible rejects with a RateLimiterRes when limit is exceeded
      if (rateLimiterRes && typeof rateLimiterRes === 'object' && 'msBeforeNext' in rateLimiterRes) {
        const rlRes = rateLimiterRes as { msBeforeNext: number; remainingPoints: number };
        const retryAfterSeconds = Math.ceil(rlRes.msBeforeNext / 1000);

        logger.warn(
          {
            key: keyGenerator(req),
            keyPrefix: presetConfig.keyPrefix,
            retryAfter: retryAfterSeconds,
          },
          'Rate limit exceeded',
        );

        res.set('Retry-After', String(retryAfterSeconds));
        res.set('X-RateLimit-Limit', String(presetConfig.points));
        res.set('X-RateLimit-Remaining', '0');
        res.set(
          'X-RateLimit-Reset',
          String(Math.ceil(Date.now() / 1000 + rlRes.msBeforeNext / 1000)),
        );

        res.status(429).json({
          success: false,
          error: {
            code: 'RATE_LIMIT_EXCEEDED',
            message: 'Too many requests, please try again later',
            details: {
              retryAfter: retryAfterSeconds,
            },
          },
        });
        return;
      }

      // Unexpected error from rate limiter - let the request through
      logger.error({ err: rateLimiterRes }, 'Rate limiter error, allowing request');
      next();
    }
  };
}
