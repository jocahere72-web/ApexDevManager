// ---------------------------------------------------------------------------
// SSO Controller (U13 SaaS Readiness)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as ssoService from './sso.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { SSOConfig, SCIMConfig, SSOTestResult } from '@apex-dev-manager/shared-types';

export const ssoRouter = Router();

// All SSO routes require admin role
ssoRouter.use(authorize(['admin', 'super_admin']));

// ---------------------------------------------------------------------------
// POST /sso/saml - Configure SAML SSO
// ---------------------------------------------------------------------------

ssoRouter.post(
  '/sso/saml',
  async (req: Request, res: Response<ApiResponse<SSOConfig>>, next: NextFunction) => {
    try {
      const { issuer, ssoUrl, certificate, entityId, nameIdFormat, attributeMapping, allowIdpInitiated, signRequests } = req.body;

      if (!issuer || !ssoUrl || !certificate || !entityId) {
        throw new ValidationError('issuer, ssoUrl, certificate, and entityId are required');
      }

      const config = await ssoService.configureSAML(
        req.tenantId!,
        { issuer, ssoUrl, certificate, entityId, nameIdFormat, attributeMapping, allowIdpInitiated, signRequests },
      );

      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sso/scim - Configure SCIM provisioning
// ---------------------------------------------------------------------------

ssoRouter.post(
  '/sso/scim',
  async (req: Request, res: Response<ApiResponse<SCIMConfig>>, next: NextFunction) => {
    try {
      const { enabled, syncUsers, syncGroups, defaultRole } = req.body;

      if (enabled === undefined) {
        throw new ValidationError('enabled is required');
      }

      const config = await ssoService.configureSCIM(
        req.tenantId!,
        { enabled, syncUsers, syncGroups, defaultRole },
      );

      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /sso/config - Get SSO configuration
// ---------------------------------------------------------------------------

ssoRouter.get(
  '/sso/config',
  async (req: Request, res: Response<ApiResponse<{ sso: SSOConfig | null; scim: SCIMConfig | null }>>, next: NextFunction) => {
    try {
      const config = await ssoService.getSSOConfig(req.tenantId!);
      res.json({ success: true, data: config });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /sso/test - Test SSO connection
// ---------------------------------------------------------------------------

ssoRouter.post(
  '/sso/test',
  async (req: Request, res: Response<ApiResponse<SSOTestResult>>, next: NextFunction) => {
    try {
      const result = await ssoService.testSSOConnection(req.tenantId!);
      res.json({ success: true, data: result });
    } catch (err) {
      next(err);
    }
  },
);
