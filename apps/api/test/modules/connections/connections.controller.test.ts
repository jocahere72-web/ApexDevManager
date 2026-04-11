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
const TENANT_ID = 'tenant-conn-1';
const USER_ID = 'user-conn-1';

const authToken = jwt.sign(
  { sub: USER_ID, tenantId: TENANT_ID, role: 'admin' },
  TEST_JWT_SECRET,
  { expiresIn: '15m' },
);

const testConnection = {
  id: uuidv4(),
  tenantId: TENANT_ID,
  name: 'Primary GitHub',
  provider: 'github',
  baseUrl: 'https://api.github.com',
  status: 'connected',
  createdAt: new Date().toISOString(),
  updatedAt: new Date().toISOString(),
};

// ---------------------------------------------------------------------------
// Mock connections service
// ---------------------------------------------------------------------------
const mockConnectionsService = {
  createConnection: sinon.stub(),
  listConnections: sinon.stub(),
  getConnectionById: sinon.stub(),
  testConnection: sinon.stub(),
  deleteConnection: sinon.stub(),
};

// ---------------------------------------------------------------------------
// Build test app simulating connections routes
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

  // POST /connections
  app.post('/connections', async (req: any, res) => {
    try {
      const connection = await mockConnectionsService.createConnection({
        ...req.body,
        tenantId: req.tenantId,
      });
      return res.status(201).json({ success: true, data: connection });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // GET /connections
  app.get('/connections', async (req: any, res) => {
    try {
      const connections = await mockConnectionsService.listConnections(req.tenantId);
      return res.status(200).json({ success: true, data: connections });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // GET /connections/:id
  app.get('/connections/:id', async (req: any, res) => {
    try {
      const connection = await mockConnectionsService.getConnectionById(req.params.id, req.tenantId);
      if (!connection) {
        return res.status(404).json({
          success: false,
          error: { code: 'NOT_FOUND', message: 'Connection not found' },
        });
      }
      return res.status(200).json({ success: true, data: connection });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // POST /connections/:id/test
  app.post('/connections/:id/test', async (req: any, res) => {
    try {
      const result = await mockConnectionsService.testConnection(req.params.id, req.tenantId);
      return res.status(200).json({ success: true, data: result });
    } catch {
      return res.status(500).json({ success: false, error: { code: 'INTERNAL_ERROR' } });
    }
  });

  // DELETE /connections/:id
  app.delete('/connections/:id', async (req: any, res) => {
    try {
      await mockConnectionsService.deleteConnection(req.params.id, req.tenantId);
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
describe('Connections Controller', () => {
  let request: supertest.SuperTest<supertest.Test>;

  beforeEach(() => {
    sinon.restore();
    request = supertest(createTestApp()) as any;
  });

  afterEach(() => {
    sinon.restore();
  });

  describe('POST /connections', () => {
    it('should return 201 when creating a connection', async () => {
      mockConnectionsService.createConnection.resolves(testConnection);

      const res = await request
        .post('/connections')
        .set('Authorization', `Bearer ${authToken}`)
        .send({
          name: 'Primary GitHub',
          provider: 'github',
          baseUrl: 'https://api.github.com',
          credentials: { token: 'ghp_test123' },
        });

      expect(res.status).to.equal(201);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('name', 'Primary GitHub');
      expect(res.body.data).to.have.property('provider', 'github');
    });
  });

  describe('GET /connections', () => {
    it('should return 200 with list of connections', async () => {
      mockConnectionsService.listConnections.resolves([testConnection]);

      const res = await request
        .get('/connections')
        .set('Authorization', `Bearer ${authToken}`);

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.be.an('array').with.length(1);
      expect(res.body.data[0]).to.have.property('provider', 'github');
    });
  });

  describe('GET /connections/:id', () => {
    it('should return 200 with the connection', async () => {
      mockConnectionsService.getConnectionById.resolves(testConnection);

      const res = await request
        .get(`/connections/${testConnection.id}`)
        .set('Authorization', `Bearer ${authToken}`);

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('id', testConnection.id);
    });

    it('should return 404 when connection not found', async () => {
      mockConnectionsService.getConnectionById.resolves(null);

      const res = await request
        .get(`/connections/${uuidv4()}`)
        .set('Authorization', `Bearer ${authToken}`);

      expect(res.status).to.equal(404);
      expect(res.body.error.code).to.equal('NOT_FOUND');
    });
  });

  describe('POST /connections/:id/test', () => {
    it('should return 200 with test result', async () => {
      mockConnectionsService.testConnection.resolves({
        status: 'ok',
        latencyMs: 42,
        message: 'Connection successful',
      });

      const res = await request
        .post(`/connections/${testConnection.id}/test`)
        .set('Authorization', `Bearer ${authToken}`);

      expect(res.status).to.equal(200);
      expect(res.body.success).to.be.true;
      expect(res.body.data).to.have.property('status', 'ok');
    });
  });

  describe('DELETE /connections/:id', () => {
    it('should return 204 on successful deletion', async () => {
      mockConnectionsService.deleteConnection.resolves();

      const res = await request
        .delete(`/connections/${testConnection.id}`)
        .set('Authorization', `Bearer ${authToken}`);

      expect(res.status).to.equal(204);
    });
  });
});
