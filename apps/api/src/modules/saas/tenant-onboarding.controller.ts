// ---------------------------------------------------------------------------
// Tenant Onboarding Controller (U13 SaaS Readiness)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as tenantService from './tenant-onboarding.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { TenantOnboarding } from '@apex-dev-manager/shared-types';

export const tenantOnboardingRouter = Router();

// All tenant management requires super-admin
tenantOnboardingRouter.use(authorize(['super_admin']));

// ---------------------------------------------------------------------------
// POST /tenants - Create a new tenant
// ---------------------------------------------------------------------------

tenantOnboardingRouter.post(
  '/tenants',
  async (req: Request, res: Response<ApiResponse<TenantOnboarding>>, next: NextFunction) => {
    try {
      const { name, slug, adminEmail, plan, settings } = req.body;

      if (!name || !slug || !adminEmail || !plan) {
        throw new ValidationError('name, slug, adminEmail, and plan are required');
      }

      if (!/^[a-z0-9-]+$/.test(slug)) {
        throw new ValidationError('slug must contain only lowercase letters, numbers, and hyphens');
      }

      const tenant = await tenantService.createTenant({ name, slug, adminEmail, plan, settings });
      res.status(201).json({ success: true, data: tenant });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /tenants/:id/config - Get tenant configuration
// ---------------------------------------------------------------------------

tenantOnboardingRouter.get(
  '/tenants/:id/config',
  async (req: Request, res: Response<ApiResponse<TenantOnboarding>>, next: NextFunction) => {
    try {
      const tenant = await tenantService.getTenantConfig(req.params.id);
      res.json({ success: true, data: tenant });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// PATCH /tenants/:id/config - Update tenant configuration
// ---------------------------------------------------------------------------

tenantOnboardingRouter.patch(
  '/tenants/:id/config',
  async (req: Request, res: Response<ApiResponse<TenantOnboarding>>, next: NextFunction) => {
    try {
      const { name, plan, quota, settings } = req.body;
      const tenant = await tenantService.updateTenantConfig(req.params.id, { name, plan, quota, settings });
      res.json({ success: true, data: tenant });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /tenants/:id/suspend - Suspend tenant
// ---------------------------------------------------------------------------

tenantOnboardingRouter.post(
  '/tenants/:id/suspend',
  async (req: Request, res: Response<ApiResponse<TenantOnboarding>>, next: NextFunction) => {
    try {
      const tenant = await tenantService.suspendTenant(req.params.id);
      res.json({ success: true, data: tenant });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// DELETE /tenants/:id - Delete tenant
// ---------------------------------------------------------------------------

tenantOnboardingRouter.delete(
  '/tenants/:id',
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await tenantService.deleteTenant(req.params.id);
      res.json({ success: true, data: { message: 'Tenant deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);
