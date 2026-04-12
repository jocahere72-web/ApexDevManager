import { Router } from 'express';
import { healthRouter } from './health.js';
import { authRouter } from '../modules/auth/auth.router.js';
import { usersRouter } from '../modules/users/index.js';
import { connectionsRouter } from '../modules/connections/index.js';
import { explorerRouter } from '../modules/explorer/index.js';
import { editorRouter } from '../modules/editor/index.js';
import { aiRouter } from '../modules/ai-studio/index.js';
import { prdRouter } from '../modules/prd-builder/index.js';
import { pageGenRouter } from '../modules/prd-to-page/index.js';
import { changeManagerRouter } from '../modules/change-manager/index.js';
import { schemaInspectorRouter } from '../modules/schema-inspector/index.js';
import { releaseManagerRouter } from '../modules/release-manager/index.js';
import { governanceRouter } from '../modules/ai-governance/index.js';
import { dependencyRouter } from '../modules/dependency-analyzer/index.js';
import { docsRouter } from '../modules/auto-docs/index.js';
import { testStudioRouter } from '../modules/test-studio/index.js';
import { knowledgeRouter } from '../modules/knowledge-engine/index.js';
import { usageRouter } from '../modules/usage-intelligence/index.js';
import { dashboardRouter } from '../modules/dashboards/index.js';
import { factoryRouter } from '../modules/code-factory/index.js';
import { marketplaceRouter } from '../modules/marketplace/index.js';
import { tenantOnboardingRouter, ssoRouter } from '../modules/saas/index.js';
import { authenticate } from '../modules/auth/auth.middleware.js';

export const router = Router();

// Health and readiness checks
router.use(healthRouter);

// API v1 routes
router.use('/api/v1/auth', authRouter);
router.use('/api/v1/users', authenticate(), usersRouter);
router.use('/api/v1/connections', authenticate(), connectionsRouter);
router.use('/api/v1/explorer', authenticate(), explorerRouter);
router.use('/api/v1/editor', authenticate(), editorRouter);
router.use('/api/v1/ai', authenticate(), aiRouter);
router.use('/api/v1/prd', authenticate(), prdRouter);
router.use('/api/v1/page-gen', authenticate(), pageGenRouter);
router.use('/api/v1/change-manager', authenticate(), changeManagerRouter);
router.use('/api/v1/schema-inspector', authenticate(), schemaInspectorRouter);
router.use('/api/v1/releases', authenticate(), releaseManagerRouter);
router.use('/api/v1/governance', authenticate(), governanceRouter);
router.use('/api/v1/dependencies', authenticate(), dependencyRouter);
router.use('/api/v1/auto-docs', authenticate(), docsRouter);
router.use('/api/v1/test-studio', authenticate(), testStudioRouter);
router.use('/api/v1/knowledge', authenticate(), knowledgeRouter);
router.use('/api/v1/usage', authenticate(), usageRouter);
router.use('/api/v1/dashboard', authenticate(), dashboardRouter);
router.use('/api/v1/factory', authenticate(), factoryRouter);
router.use('/api/v1/marketplace', authenticate(), marketplaceRouter);
router.use('/api/v1/admin', authenticate(), tenantOnboardingRouter);
router.use('/api/v1/admin', authenticate(), ssoRouter);
