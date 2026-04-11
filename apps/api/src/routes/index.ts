import { Router } from 'express';
import { healthRouter } from './health.js';
import { authRouter } from '../modules/auth/auth.router.js';
import { usersRouter } from '../modules/users/index.js';
import { connectionsRouter } from '../modules/connections/index.js';
import { explorerRouter } from '../modules/explorer/index.js';
import { authenticate } from '../modules/auth/auth.middleware.js';

export const router = Router();

// Health and readiness checks
router.use(healthRouter);

// API v1 routes
router.use('/api/v1/auth', authRouter);
router.use('/api/v1/users', authenticate(), usersRouter);
router.use('/api/v1/connections', authenticate(), connectionsRouter);
router.use('/api/v1/explorer', authenticate(), explorerRouter);
