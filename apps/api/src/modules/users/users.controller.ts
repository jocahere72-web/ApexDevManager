import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
// Note: authenticate() is applied at the router level in routes/index.ts
import { CreateUserSchema, UpdateUserSchema, ListUsersQuerySchema } from './users.validation.js';
import * as usersService from './users.service.js';
import { ValidationError, AuthorizationError } from '../../lib/errors.js';
import type { ApiResponse, PaginatedResponse } from '../../types/index.js';
import type { UserProfile } from '../auth/auth.types.js';

export const usersRouter = Router();

// ── POST / — Create user (admin only) ────────────────────────────────────────
usersRouter.post(
  '/',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<UserProfile>>, next: NextFunction) => {
    try {
      const parsed = CreateUserSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid user data', parsed.error.flatten().fieldErrors);
      }

      const user = await usersService.createUser(req.tenantId!, parsed.data, req.userId!, req.dbClient);

      res.status(201).json({ success: true, data: user });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET / — List users (admin only) ──────────────────────────────────────────
usersRouter.get(
  '/',
  authorize(['admin']),
  async (req: Request, res: Response<PaginatedResponse<UserProfile>>, next: NextFunction) => {
    try {
      const parsed = ListUsersQuerySchema.safeParse(req.query);
      if (!parsed.success) {
        throw new ValidationError('Invalid query parameters', parsed.error.flatten().fieldErrors);
      }

      const { users, total } = await usersService.listUsers(req.tenantId!, parsed.data, req.dbClient);
      const { page, limit } = parsed.data;
      const totalPages = Math.ceil(total / limit);

      res.json({
        success: true,
        data: users,
        pagination: {
          page,
          pageSize: limit,
          totalItems: total,
          totalPages,
          hasNext: page < totalPages,
          hasPrevious: page > 1,
        },
      });
    } catch (err) {
      next(err);
    }
  },
);

// ── GET /:id — Get user by ID (admin or self) ───────────────────────────────
usersRouter.get(
  '/:id',
  async (req: Request, res: Response<ApiResponse<UserProfile>>, next: NextFunction) => {
    try {
      const { id } = req.params;
      const isSelf = req.userId === id;
      const isAdmin = req.roles?.includes('admin');

      if (!isSelf && !isAdmin) {
        throw new AuthorizationError('You can only view your own profile or must be an admin');
      }

      const user = await usersService.getUserById(req.tenantId!, id, req.dbClient);

      res.json({ success: true, data: user });
    } catch (err) {
      next(err);
    }
  },
);

// ── PATCH /:id — Update user (admin only) ────────────────────────────────────
usersRouter.patch(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse<UserProfile>>, next: NextFunction) => {
    try {
      const parsed = UpdateUserSchema.safeParse(req.body);
      if (!parsed.success) {
        throw new ValidationError('Invalid update data', parsed.error.flatten().fieldErrors);
      }

      const user = await usersService.updateUser(
        req.tenantId!,
        req.params.id,
        parsed.data,
        req.userId!,
        req.dbClient,
      );

      res.json({ success: true, data: user });
    } catch (err) {
      next(err);
    }
  },
);

// ── DELETE /:id — Soft delete user (admin only) ──────────────────────────────
usersRouter.delete(
  '/:id',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await usersService.softDeleteUser(req.tenantId!, req.params.id, req.userId!, req.dbClient);

      res.json({ success: true, data: { message: 'User deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);

// ── POST /:id/unlock — Unlock user account (admin only) ─────────────────────
usersRouter.post(
  '/:id/unlock',
  authorize(['admin']),
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await usersService.unlockUser(req.tenantId!, req.params.id, req.userId!, req.dbClient);

      res.json({ success: true, data: { message: 'User account unlocked successfully' } });
    } catch (err) {
      next(err);
    }
  },
);
