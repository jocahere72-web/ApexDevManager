import { Router } from 'express';
import type { Request, Response, NextFunction } from 'express';
import { LoginSchema, RefreshTokenSchema } from './auth.validation.js';
import * as authService from './auth.service.js';
import { authenticate } from './auth.middleware.js';
import { ValidationError } from '../../lib/errors.js';

export const router = Router();

/**
 * GET /tenant/:slug
 *
 * Public endpoint to resolve a tenant by slug.
 * Returns tenant ID and name (no sensitive data).
 */
router.get('/tenant/:slug', async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { slug } = req.params;
    const { pool } = await import('../../config/database.js');
    const result = await pool.query(
      'SELECT id, name, slug, plan, status FROM tenants WHERE slug = $1 AND status != $2',
      [slug, 'DELETED'],
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ success: false, error: { code: 'NOT_FOUND', message: 'Organization not found' } });
    }
    const tenant = result.rows[0];
    return res.json({ success: true, data: { id: tenant.id, name: tenant.name, slug: tenant.slug, plan: tenant.plan } });
  } catch (err) {
    return next(err);
  }
});

/**
 * POST /login
 *
 * Authenticate a user with email and password.
 * Requires x-tenant-id header.
 */
router.post('/login', async (req: Request, res: Response, next: NextFunction) => {
  try {
    const tenantId = req.headers['x-tenant-id'] as string | undefined;
    if (!tenantId) {
      throw new ValidationError('x-tenant-id header is required');
    }

    const parsed = LoginSchema.safeParse(req.body);
    if (!parsed.success) {
      throw new ValidationError('Validation failed', parsed.error.issues);
    }

    const result = await authService.login(parsed.data.email, parsed.data.password, tenantId);

    res.status(200).json({
      success: true,
      data: {
        user: result.user,
        accessToken: result.tokens.accessToken,
        refreshToken: result.tokens.refreshToken,
        expiresIn: result.tokens.expiresIn,
      },
    });
  } catch (err) {
    next(err);
  }
});

/**
 * POST /refresh
 *
 * Exchange a valid refresh token for a new token pair.
 * Requires x-tenant-id header.
 */
router.post('/refresh', async (req: Request, res: Response, next: NextFunction) => {
  try {
    const tenantId = req.headers['x-tenant-id'] as string | undefined;
    if (!tenantId) {
      throw new ValidationError('x-tenant-id header is required');
    }

    const parsed = RefreshTokenSchema.safeParse(req.body);
    if (!parsed.success) {
      throw new ValidationError('Validation failed', parsed.error.issues);
    }

    const result = await authService.refresh(parsed.data.refreshToken, tenantId);

    res.status(200).json({
      success: true,
      data: {
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
        expiresIn: result.expiresIn,
      },
    });
  } catch (err) {
    next(err);
  }
});

/**
 * POST /logout
 *
 * Invalidate the current session.
 * Requires a valid Bearer token.
 */
router.post('/logout', authenticate(), async (req: Request, res: Response, next: NextFunction) => {
  try {
    const userId = req.userId!;
    const tenantId = req.tenantId!;

    await authService.logout(userId, tenantId);

    res.status(200).json({
      success: true,
      data: { message: 'Logged out successfully' },
    });
  } catch (err) {
    next(err);
  }
});

/**
 * GET /me
 *
 * Return the authenticated user's profile.
 * Requires a valid Bearer token.
 */
router.get('/me', authenticate(), async (req: Request, res: Response, next: NextFunction) => {
  try {
    const userId = req.userId!;
    const tenantId = req.tenantId!;

    const profile = await authService.getMe(userId, tenantId);

    res.status(200).json({
      success: true,
      data: profile,
    });
  } catch (err) {
    next(err);
  }
});
