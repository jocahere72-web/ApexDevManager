import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import sinon from 'sinon';
import jwt from 'jsonwebtoken';
import type { Request, Response, NextFunction } from 'express';

// ---------------------------------------------------------------------------
// Test constants
// ---------------------------------------------------------------------------
const TEST_JWT_SECRET = 'test-jwt-secret-that-is-at-least-32-chars-long!!';

// ---------------------------------------------------------------------------
// Reference implementations matching the planned middleware contract.
// Replace with real imports once the modules are built.
// ---------------------------------------------------------------------------

/**
 * authenticate middleware: verifies JWT from Authorization header
 * and attaches userId, tenantId, role to the request.
 */
function authenticate(req: Request, res: Response, next: NextFunction): void {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    res.status(401).json({
      success: false,
      error: { code: 'AUTHENTICATION_ERROR', message: 'Missing or invalid token' },
    });
    return;
  }

  const token = authHeader.replace('Bearer ', '');

  try {
    const decoded = jwt.verify(token, TEST_JWT_SECRET) as jwt.JwtPayload;
    (req as any).userId = decoded.sub;
    (req as any).tenantId = decoded.tenantId;
    (req as any).userRole = decoded.role;
    next();
  } catch {
    res.status(401).json({
      success: false,
      error: { code: 'AUTHENTICATION_ERROR', message: 'Invalid or expired token' },
    });
  }
}

/**
 * authorize middleware: checks if the user's role matches the required roles.
 */
function authorize(...allowedRoles: string[]) {
  return (req: Request, res: Response, next: NextFunction): void => {
    const userRole = (req as any).userRole;

    if (!userRole || !allowedRoles.includes(userRole)) {
      res.status(403).json({
        success: false,
        error: { code: 'AUTHORIZATION_ERROR', message: 'Insufficient permissions' },
      });
      return;
    }

    next();
  };
}

// ---------------------------------------------------------------------------
// Helpers to create mock req/res/next objects
// ---------------------------------------------------------------------------
function createMockReq(overrides: Partial<Request> = {}): Request {
  return {
    headers: {},
    correlationId: 'test-corr',
    ...overrides,
  } as unknown as Request;
}

function createMockRes(): Response & { _status: number; _json: any } {
  const res: any = {
    _status: 0,
    _json: null,
    status(code: number) {
      res._status = code;
      return res;
    },
    json(body: any) {
      res._json = body;
      return res;
    },
  };
  return res;
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
describe('Auth Middleware', () => {
  afterEach(() => {
    sinon.restore();
  });

  describe('authenticate', () => {
    it('should call next() and attach user info for a valid JWT', () => {
      const token = jwt.sign(
        { sub: 'user-1', tenantId: 'tenant-1', role: 'admin' },
        TEST_JWT_SECRET,
        { expiresIn: '15m' },
      );

      const req = createMockReq({
        headers: { authorization: `Bearer ${token}` } as any,
      });
      const res = createMockRes();
      const next = sinon.spy();

      authenticate(req, res, next);

      expect(next.calledOnce).to.be.true;
      expect((req as any).userId).to.equal('user-1');
      expect((req as any).tenantId).to.equal('tenant-1');
      expect((req as any).userRole).to.equal('admin');
    });

    it('should return 401 when no authorization header is present', () => {
      const req = createMockReq();
      const res = createMockRes();
      const next = sinon.spy();

      authenticate(req, res, next);

      expect(next.called).to.be.false;
      expect(res._status).to.equal(401);
      expect(res._json.error.code).to.equal('AUTHENTICATION_ERROR');
    });

    it('should return 401 when authorization header has no Bearer prefix', () => {
      const req = createMockReq({
        headers: { authorization: 'Basic abc123' } as any,
      });
      const res = createMockRes();
      const next = sinon.spy();

      authenticate(req, res, next);

      expect(next.called).to.be.false;
      expect(res._status).to.equal(401);
    });

    it('should return 401 for an expired token', () => {
      const token = jwt.sign(
        { sub: 'user-2', tenantId: 'tenant-2', role: 'developer' },
        TEST_JWT_SECRET,
        { expiresIn: '0s' },
      );

      const req = createMockReq({
        headers: { authorization: `Bearer ${token}` } as any,
      });
      const res = createMockRes();
      const next = sinon.spy();

      authenticate(req, res, next);

      expect(next.called).to.be.false;
      expect(res._status).to.equal(401);
      expect(res._json.error.code).to.equal('AUTHENTICATION_ERROR');
    });

    it('should return 401 for a tampered token', () => {
      const token = jwt.sign(
        { sub: 'user-3', tenantId: 'tenant-3', role: 'admin' },
        TEST_JWT_SECRET,
        { expiresIn: '15m' },
      );

      // Tamper with the payload
      const parts = token.split('.');
      parts[1] = parts[1] + 'tampered';
      const tamperedToken = parts.join('.');

      const req = createMockReq({
        headers: { authorization: `Bearer ${tamperedToken}` } as any,
      });
      const res = createMockRes();
      const next = sinon.spy();

      authenticate(req, res, next);

      expect(next.called).to.be.false;
      expect(res._status).to.equal(401);
    });
  });

  describe('authorize', () => {
    it('should call next() when user role matches allowed roles', () => {
      const req = createMockReq();
      (req as any).userRole = 'admin';
      const res = createMockRes();
      const next = sinon.spy();

      const middleware = authorize('admin', 'manager');
      middleware(req, res, next);

      expect(next.calledOnce).to.be.true;
    });

    it('should return 403 when user role does not match', () => {
      const req = createMockReq();
      (req as any).userRole = 'viewer';
      const res = createMockRes();
      const next = sinon.spy();

      const middleware = authorize('admin', 'manager');
      middleware(req, res, next);

      expect(next.called).to.be.false;
      expect(res._status).to.equal(403);
      expect(res._json.error.code).to.equal('AUTHORIZATION_ERROR');
    });

    it('should return 403 when user has no role', () => {
      const req = createMockReq();
      const res = createMockRes();
      const next = sinon.spy();

      const middleware = authorize('admin');
      middleware(req, res, next);

      expect(next.called).to.be.false;
      expect(res._status).to.equal(403);
    });
  });
});
