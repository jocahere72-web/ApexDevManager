import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import sinon from 'sinon';
import express from 'express';
import supertest from 'supertest';
import jwt from 'jsonwebtoken';

// ---------------------------------------------------------------------------
// Test constants
// ---------------------------------------------------------------------------
const TEST_JWT_SECRET = 'test-jwt-secret-that-is-at-least-32-chars-long!!';

const testUser = {
  id: 'user-auth-1',
  tenantId: 'tenant-auth-1',
  email: 'admin@example.com',
  firstName: 'Admin',
  lastName: 'User',
  role: 'admin',
  status: 'active',
};

const validAccessToken = jwt.sign(
  { sub: testUser.id, tenantId: testUser.tenantId, role: testUser.role },
  TEST_JWT_SECRET,
  { expiresIn: '15m' },
);

const validRefreshToken = jwt.sign(
  { sub: testUser.id, tenantId: testUser.tenantId, role: testUser.role, jti: 'refresh-1', family: 'fam-1' },
  TEST_JWT_SECRET,
  { expiresIn: '7d' },
);

// ---------------------------------------------------------------------------
// Mock auth service
// ---------------------------------------------------------------------------
const mockAuthService = {
  login: sinon.stub(),
  refresh: sinon.stub(),
  logout: sinon.stub(),
  getCurrentUser: sinon.stub(),
};

// ---------------------------------------------------------------------------
// Build a minimal Express app that simulates the auth routes
// ---------------------------------------------------------------------------
function createTestApp(): express.Express {
  const app = express();
  app.use(express.json());

  // Simulate correlation ID
  app.use((req, _res, next) => {
    (req as any).correlationId = 'test-corr-id';
    next();
  });

  // POST /login
  app.post('/login', async (req, res) => {
    try {
      const result = await mockAuthService.login(req.body.email, req.body.password);
      if (!result) {
        return res.status(401).json({
          success: false,
          error: { code: 'AUTHENTICATION_ERROR', message: 'Invalid credentials' },
        });
      }
      if (result.locked) {
        return res.status(423).json({
          success: false,
          error: { code: 'ACCOUNT_LOCKED', message: 'Account is locked' },
        });
      }
      return res.status(200).json({ success: true, data: result });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // POST /refresh
  app.post('/refresh', async (req, res) => {
    try {
      const result = await mockAuthService.refresh(req.body.refreshToken);
      if (!result) {
        return res.status(401).json({
          success: false,
          error: { code: 'AUTHENTICATION_ERROR', message: 'Invalid refresh token' },
        });
      }
      return res.status(200).json({ success: true, data: result });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // POST /logout
  app.post('/logout', async (req, res) => {
    try {
      await mockAuthService.logout(req.headers.authorization?.replace('Bearer ', ''));
      return res.status(204).send();
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // GET /me (requires JWT)
  app.get('/me', (req, res, next) => {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({
        success: false,
        error: { code: 'AUTHENTICATION_ERROR', message: 'Missing or invalid token' },
      });
    }
    try {
      const decoded = jwt.verify(authHeader.replace('Bearer ', ''), TEST_JWT_SECRET) as jwt.JwtPayload;
      (req as any).userId = decoded.sub;
      (req as any).tenantId = decoded.tenantId;
      next();
    } catch {
      return res.status(401).json({
        success: false,
        error: { code: 'AUTHENTICATION_ERROR', message: 'Invalid or expired token' },
      });
    }
  }, async (req, res) => {
    try {
      const user = await mockAuthService.getCurrentUser((req as any).userId);
      return res.status(200).json({ success: true, data: user });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  return app;
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
describe('Auth Controller', () => {
  let request: supertest.SuperTest<supertest.Test>;

  beforeEach(() => {
    sinon.restore();
    request = supertest(createTestApp()) as any;
  });

  afterEach(() => {
    sinon.restore();
  });

  describe('POST /login', () => {
    it('should return 200 with tokens for valid credentials', async () => {
      mockAuthService.login.resolves({
        accessToken: validAccessToken,
        refreshToken: validRefreshToken,
        user: testUser,
      });

      const res = await request
        .post('/login')
        .send({ email: 'admin@example.com', password: 'ValidPass123!' });

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('accessToken');
      expect(res.body.data).to.have.property('refreshToken');
    });

    it('should return 401 for invalid credentials', async () => {
      mockAuthService.login.resolves(null);

      const res = await request
        .post('/login')
        .send({ email: 'admin@example.com', password: 'WrongPassword' });

      expect(res.status).to.equal(401);
      expect(res.body.success).to.be.false;
      expect(res.body.error.code).to.equal('AUTHENTICATION_ERROR');
    });

    it('should return 423 when account is locked', async () => {
      mockAuthService.login.resolves({ locked: true });

      const res = await request
        .post('/login')
        .send({ email: 'admin@example.com', password: 'ValidPass123!' });

      expect(res.status).to.equal(423);
      expect(res.body.success).to.be.false;
      expect(res.body.error.code).to.equal('ACCOUNT_LOCKED');
    });
  });

  describe('POST /refresh', () => {
    it('should return 200 with new token pair for valid refresh token', async () => {
      mockAuthService.refresh.resolves({
        accessToken: 'new-access-token',
        refreshToken: 'new-refresh-token',
      });

      const res = await request
        .post('/refresh')
        .send({ refreshToken: validRefreshToken });

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('accessToken');
      expect(res.body.data).to.have.property('refreshToken');
    });

    it('should return 401 for invalid refresh token', async () => {
      mockAuthService.refresh.resolves(null);

      const res = await request
        .post('/refresh')
        .send({ refreshToken: 'invalid-token' });

      expect(res.status).to.equal(401);
      expect(res.body.success).to.be.false;
    });
  });

  describe('POST /logout', () => {
    it('should return 204 on successful logout', async () => {
      mockAuthService.logout.resolves();

      const res = await request
        .post('/logout')
        .set('Authorization', `Bearer ${validAccessToken}`);

      expect(res.status).to.equal(204);
    });
  });

  describe('GET /me', () => {
    it('should return 200 with user data when JWT is valid', async () => {
      mockAuthService.getCurrentUser.resolves(testUser);

      const res = await request
        .get('/me')
        .set('Authorization', `Bearer ${validAccessToken}`);

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('email', testUser.email);
    });

    it('should return 401 when no JWT is provided', async () => {
      const res = await request.get('/me');

      expect(res.status).to.equal(401);
      expect(res.body.success).to.be.false;
      expect(res.body.error.code).to.equal('AUTHENTICATION_ERROR');
    });

    it('should return 401 when JWT is expired', async () => {
      const expiredToken = jwt.sign(
        { sub: testUser.id, tenantId: testUser.tenantId, role: testUser.role },
        TEST_JWT_SECRET,
        { expiresIn: '0s' },
      );

      const res = await request
        .get('/me')
        .set('Authorization', `Bearer ${expiredToken}`);

      expect(res.status).to.equal(401);
      expect(res.body.success).to.be.false;
    });
  });
});
