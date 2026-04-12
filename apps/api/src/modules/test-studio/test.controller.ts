// ---------------------------------------------------------------------------
// Test Studio Controller (M13 Test Automation)
// ---------------------------------------------------------------------------

import { Router, type Request, type Response, type NextFunction } from 'express';
import { authorize } from '../auth/auth.middleware.js';
import * as testService from './test.service.js';
import { ValidationError } from '../../lib/errors.js';
import type { ApiResponse } from '../../types/index.js';
import type { TestSuite, TestCase, TestResult, TestCoverage } from '@apex-dev-manager/shared-types';

export const testStudioRouter = Router();

// ---------------------------------------------------------------------------
// POST /generate - Generate tests via AI
// ---------------------------------------------------------------------------

testStudioRouter.post(
  '/generate',
  async (req: Request, res: Response<ApiResponse<TestCase[]>>, next: NextFunction) => {
    try {
      const { connectionId, appId, pageId, componentType, componentName, componentSource, testTypes } = req.body;

      if (!connectionId) {
        throw new ValidationError('connectionId is required');
      }

      const testCases = await testService.generateTests(
        { connectionId, appId, pageId, componentType, componentName, componentSource, testTypes },
        req.tenantId!,
        req.userId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: testCases });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /execute - Execute tests
// ---------------------------------------------------------------------------

testStudioRouter.post(
  '/execute',
  async (req: Request, res: Response<ApiResponse<TestResult[]>>, next: NextFunction) => {
    try {
      const { suiteId, testCaseIds, connectionId } = req.body;

      if (!suiteId || !connectionId) {
        throw new ValidationError('suiteId and connectionId are required');
      }

      const results = await testService.executeTest(
        { suiteId, testCaseIds, connectionId },
        req.tenantId!,
        req.dbClient,
      );

      res.json({ success: true, data: results });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /results/:suiteId - Get test results
// ---------------------------------------------------------------------------

testStudioRouter.get(
  '/results/:suiteId',
  async (req: Request, res: Response<ApiResponse<TestResult[]>>, next: NextFunction) => {
    try {
      const results = await testService.getTestResults(req.params.suiteId, req.tenantId!, req.dbClient);
      res.json({ success: true, data: results });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /coverage - Get test coverage
// ---------------------------------------------------------------------------

testStudioRouter.get(
  '/coverage',
  async (req: Request, res: Response<ApiResponse<TestCoverage>>, next: NextFunction) => {
    try {
      const connectionId = req.query.connectionId as string;
      if (!connectionId) {
        throw new ValidationError('connectionId query parameter is required');
      }

      const appId = req.query.appId ? parseInt(req.query.appId as string, 10) : undefined;
      const coverage = await testService.getTestCoverage(connectionId, req.tenantId!, appId, req.dbClient);
      res.json({ success: true, data: coverage });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /suites - List test suites
// ---------------------------------------------------------------------------

testStudioRouter.get(
  '/suites',
  async (req: Request, res: Response<ApiResponse<TestSuite[]>>, next: NextFunction) => {
    try {
      const connectionId = req.query.connectionId as string | undefined;
      const suites = await testService.listTestSuites(req.tenantId!, connectionId, req.dbClient);
      res.json({ success: true, data: suites });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// POST /suites - Create test suite
// ---------------------------------------------------------------------------

testStudioRouter.post(
  '/suites',
  async (req: Request, res: Response<ApiResponse<TestSuite>>, next: NextFunction) => {
    try {
      const { connectionId, name, description, appId, pageId } = req.body;

      if (!connectionId || !name) {
        throw new ValidationError('connectionId and name are required');
      }

      const suite = await testService.createTestSuite(
        { connectionId, name, description, appId, pageId },
        req.tenantId!,
        req.dbClient,
      );

      res.status(201).json({ success: true, data: suite });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// GET /suites/:id - Get test suite
// ---------------------------------------------------------------------------

testStudioRouter.get(
  '/suites/:id',
  async (req: Request, res: Response<ApiResponse<TestSuite>>, next: NextFunction) => {
    try {
      const suite = await testService.getTestSuite(req.params.id, req.tenantId!, req.dbClient);
      res.json({ success: true, data: suite });
    } catch (err) {
      next(err);
    }
  },
);

// ---------------------------------------------------------------------------
// DELETE /suites/:id - Delete test suite
// ---------------------------------------------------------------------------

testStudioRouter.delete(
  '/suites/:id',
  async (req: Request, res: Response<ApiResponse>, next: NextFunction) => {
    try {
      await testService.deleteTestSuite(req.params.id, req.tenantId!, req.dbClient);
      res.json({ success: true, data: { message: 'Test suite deleted successfully' } });
    } catch (err) {
      next(err);
    }
  },
);
