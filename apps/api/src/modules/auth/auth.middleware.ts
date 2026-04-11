import type { Request, Response, NextFunction } from 'express';
import { AuthenticationError, AuthorizationError } from '../../lib/errors.js';
import { verifyAccessToken } from './token.service.js';
import { logger } from '../../lib/logger.js';

/**
 * Extract Bearer token from the Authorization header.
 * Returns null if no valid Bearer token is present.
 */
function extractBearerToken(req: Request): string | null {
  const header = req.headers.authorization;
  if (!header) return null;

  const parts = header.split(' ');
  if (parts.length !== 2 || parts[0] !== 'Bearer') return null;

  return parts[1];
}

/**
 * Authentication middleware.
 *
 * Extracts the JWT from the Authorization header, verifies it,
 * and attaches userId, tenantId, and roles to the request object.
 *
 * Returns 401 if no token is present or the token is invalid.
 */
export function authenticate() {
  return (req: Request, _res: Response, next: NextFunction): void => {
    try {
      const token = extractBearerToken(req);
      if (!token) {
        throw new AuthenticationError('Bearer token is required');
      }

      const payload = verifyAccessToken(token);

      req.userId = payload.sub;
      req.tenantId = payload.tenantId;
      req.roles = payload.roles;

      next();
    } catch (err) {
      if (err instanceof AuthenticationError) {
        next(err);
        return;
      }

      // jwt.verify throws various errors (TokenExpiredError, JsonWebTokenError, etc.)
      logger.debug({ err }, 'JWT verification failed');
      next(new AuthenticationError('Invalid or expired token'));
    }
  };
}

/**
 * Authorization middleware.
 *
 * Checks that the authenticated user has at least one of the required roles.
 * Must be placed AFTER authenticate() in the middleware chain.
 *
 * Returns 403 if the user does not have a matching role.
 *
 * @param requiredRoles - Array of role strings; user must have at least one.
 */
export function authorize(requiredRoles: string[]) {
  return (req: Request, _res: Response, next: NextFunction): void => {
    const userRoles = req.roles ?? [];

    const hasRole = requiredRoles.some((role) => userRoles.includes(role));
    if (!hasRole) {
      next(
        new AuthorizationError(
          `Requires one of the following roles: ${requiredRoles.join(', ')}`,
        ),
      );
      return;
    }

    next();
  };
}

/**
 * Optional authentication middleware.
 *
 * Attempts to extract and verify the JWT, but does NOT reject
 * the request if no token is present or verification fails.
 * If a valid token is found, userId/tenantId/roles are attached.
 */
export function optionalAuth() {
  return (req: Request, _res: Response, next: NextFunction): void => {
    try {
      const token = extractBearerToken(req);
      if (!token) {
        next();
        return;
      }

      const payload = verifyAccessToken(token);

      req.userId = payload.sub;
      req.tenantId = payload.tenantId;
      req.roles = payload.roles;
    } catch {
      // Silently ignore invalid tokens in optional auth
    }

    next();
  };
}
