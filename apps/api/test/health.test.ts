import { describe, it } from 'mocha';
import { expect } from 'chai';
import supertest from 'supertest';
import sinon from 'sinon';
import { createApp } from '../src/app.js';
import * as database from '../src/config/database.js';
import * as redis from '../src/config/redis.js';

const app = createApp();
const request = supertest(app);

describe('Health Endpoints', () => {
  afterEach(() => {
    sinon.restore();
  });

  describe('GET /health', () => {
    it('should return 200 with status ok', async () => {
      const res = await request.get('/health');

      expect(res.status).to.equal(200);
      expect(res.body).to.have.property('status', 'ok');
      expect(res.body).to.have.property('timestamp');
      expect(res.body).to.have.property('uptime');
    });
  });

  describe('GET /ready', () => {
    it('should return 200 when database and redis are healthy', async () => {
      sinon.stub(database, 'checkDatabaseHealth').resolves(true);
      sinon.stub(redis, 'checkRedisHealth').resolves(true);

      const res = await request.get('/ready');

      expect(res.status).to.equal(200);
      expect(res.body).to.have.property('status', 'ok');
      expect(res.body.checks.database).to.deep.equal({ status: 'ok' });
      expect(res.body.checks.redis).to.deep.equal({ status: 'ok' });
    });

    it('should return 503 when database is unhealthy', async () => {
      sinon.stub(database, 'checkDatabaseHealth').resolves(false);
      sinon.stub(redis, 'checkRedisHealth').resolves(true);

      const res = await request.get('/ready');

      expect(res.status).to.equal(503);
      expect(res.body).to.have.property('status', 'degraded');
      expect(res.body.checks.database).to.deep.equal({ status: 'error' });
    });

    it('should return 503 when redis is unhealthy', async () => {
      sinon.stub(database, 'checkDatabaseHealth').resolves(true);
      sinon.stub(redis, 'checkRedisHealth').resolves(false);

      const res = await request.get('/ready');

      expect(res.status).to.equal(503);
      expect(res.body).to.have.property('status', 'degraded');
      expect(res.body.checks.redis).to.deep.equal({ status: 'error' });
    });
  });
});
