import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import sinon from 'sinon';
import express from 'express';
import supertest from 'supertest';
import jwt from 'jsonwebtoken';
import { v4 as uuidv4 } from 'uuid';

// ---------------------------------------------------------------------------
// Test constants
// ---------------------------------------------------------------------------
const TEST_JWT_SECRET = 'test-jwt-secret-that-is-at-least-32-chars-long!!';
const TENANT_ID = 'tenant-users-1';

const adminUser = {
  id: uuidv4(),
  tenantId: TENANT_ID,
  email: 'admin@example.com',
  firstName: 'Admin',
  lastName: 'User',
  role: 'admin',
  status: 'active',
};

const developerUser = {
  id: uuidv4(),
  tenantId: TENANT_ID,
  email: 'dev@example.com',
  firstName: 'Dev',
  lastName: 'User',
  role: 'developer',
  status: 'active',
};

const adminToken = jwt.sign(
  { sub: adminUser.id, tenantId: TENANT_ID, role: 'admin' },
  TEST_JWT_SECRET,
  { expiresIn: '15m' },
);

const developerToken = jwt.sign(
  { sub: developerUser.id, tenantId: TENANT_ID, role: 'developer' },
  TEST_JWT_SECRET,
  { expiresIn: '15m' },
);

// ---------------------------------------------------------------------------
// Mock users service
// ---------------------------------------------------------------------------
const mockUsersService = {
  createUser: sinon.stub(),
  listUsers: sinon.stub(),
  getUserById: sinon.stub(),
  updateUser: sinon.stub(),
  deleteUser: sinon.stub(),
};

// ---------------------------------------------------------------------------
// Build test app simulating users routes with auth + authorization
// ---------------------------------------------------------------------------
function createTestApp(): express.Express {
  const app = express();
  app.use(express.json());

  // Auth middleware
  app.use((req: any, res, next) => {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({
        success: false,
        error: { code: 'AUTHENTICATION_ERROR', message: 'Missing token' },
      });
    }
    try {
      const decoded = jwt.verify(authHeader.replace('Bearer ', ''), TEST_JWT_SECRET) as jwt.JwtPayload;
      req.userId = decoded.sub;
      req.tenantId = decoded.tenantId;
      req.userRole = decoded.role;
      next();
    } catch {
      return res.status(401).json({
        success: false,
        error: { code: 'AUTHENTICATION_ERROR', message: 'Invalid token' },
      });
    }
  });

  // POST /users (admin only)
  app.post('/users', async (req: any, res) => {
    if (req.userRole !== 'admin') {
      return res.status(403).json({
        success: false,
        error: { code: 'AUTHORIZATION_ERROR', message: 'Insufficient permissions' },
      });
    }
    try {
      const user = await mockUsersService.createUser(req.body);
      return res.status(201).json({ success: true, data: user });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // GET /users (admin only)
  app.get('/users', async (req: any, res) => {
    if (req.userRole !== 'admin') {
      return res.status(403).json({
        success: false,
        error: { code: 'AUTHORIZATION_ERROR', message: 'Insufficient permissions' },
      });
    }
    try {
      const users = await mockUsersService.listUsers(req.tenantId);
      return res.status(200).json({ success: true, data: users });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // PATCH /users/:id
  app.patch('/users/:id', async (req: any, res) => {
    try {
      const user = await mockUsersService.updateUser(req.params.id, req.body);
      if (!user) {
        return res.status(404).json({
          success: false,
          error: { code: 'NOT_FOUND', message: 'User not found' },
        });
      }
      return res.status(200).json({ success: true, data: user });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // DELETE /users/:id
  app.delete('/users/:id', async (req: any, res) => {
    try {
      await mockUsersService.deleteUser(req.params.id);
      return res.status(204).send();
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  return app;
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
describe('Users Controller', () => {
  let request: supertest.SuperTest<supertest.Test>;

  beforeEach(() => {
    sinon.restore();
    request = supertest(createTestApp()) as any;
  });

  afterEach(() => {
    sinon.restore();
  });

  describe('POST /users', () => {
    it('should return 201 when admin creates a user', async () => {
      const newUser = {
        email: 'new@example.com',
        firstName: 'New',
        lastName: 'User',
        role: 'developer',
      };

      mockUsersService.createUser.resolves({ id: uuidv4(), ...newUser, status: 'active' });

      const res = await request
        .post('/users')
        .set('Authorization', `Bearer ${adminToken}`)
        .send(newUser);

      expect(res.status).to.equal(201);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('email', 'new@example.com');
    });

    it('should return 403 when developer attempts to create a user', async () => {
      const res = await request
        .post('/users')
        .set('Authorization', `Bearer ${developerToken}`)
        .send({ email: 'new@example.com', firstName: 'New', lastName: 'User', role: 'developer' });

      expect(res.status).to.equal(403);
      expect(res.body.success).to.be.false;
      expect(res.body.error.code).to.equal('AUTHORIZATION_ERROR');
    });
  });

  describe('GET /users', () => {
    it('should return 200 with user list for admin', async () => {
      mockUsersService.listUsers.resolves([adminUser, developerUser]);

      const res = await request
        .get('/users')
        .set('Authorization', `Bearer ${adminToken}`);

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.be.an('array').with.length(2);
    });

    it('should return 403 when developer lists users', async () => {
      const res = await request
        .get('/users')
        .set('Authorization', `Bearer ${developerToken}`);

      expect(res.status).to.equal(403);
      expect(res.body.error.code).to.equal('AUTHORIZATION_ERROR');
    });
  });

  describe('PATCH /users/:id', () => {
    it('should return 200 with updated user', async () => {
      const updated = { ...adminUser, firstName: 'Updated' };
      mockUsersService.updateUser.resolves(updated);

      const res = await request
        .patch(`/users/${adminUser.id}`)
        .set('Authorization', `Bearer ${adminToken}`)
        .send({ firstName: 'Updated' });

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data.firstName).to.equal('Updated');
    });

    it('should return 404 when user not found', async () => {
      mockUsersService.updateUser.resolves(null);

      const res = await request
        .patch(`/users/${uuidv4()}`)
        .set('Authorization', `Bearer ${adminToken}`)
        .send({ firstName: 'Updated' });

      expect(res.status).to.equal(404);
      expect(res.body.error.code).to.equal('NOT_FOUND');
    });
  });

  describe('DELETE /users/:id', () => {
    it('should return 204 on successful deletion', async () => {
      mockUsersService.deleteUser.resolves();

      const res = await request
        .delete(`/users/${developerUser.id}`)
        .set('Authorization', `Bearer ${adminToken}`);

      expect(res.status).to.equal(204);
    });
  });
});
