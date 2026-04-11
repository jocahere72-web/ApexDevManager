import { Router } from 'express';
import { healthRouter } from './health.js';

export const router = Router();

// Health and readiness checks
router.use(healthRouter);

// API v1 routes
// router.use('/api/v1/auth', authRouter);
// router.use('/api/v1/connections', connectionsRouter);
