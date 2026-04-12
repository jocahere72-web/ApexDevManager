import { describe, it } from 'mocha';
import { expect } from 'chai';
import supertest from 'supertest';
import { createApp } from '../src/app.js';

const app = createApp();
const request = supertest(app);

describe('Health Endpoints', () => {
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
    it('should return 200 or 503 depending on DB/Redis availability', async () => {
      const res = await request.get('/ready');

      expect(res.status).to.be.oneOf([200, 503]);
      expect(res.body).to.have.property('status');
      expect(res.body.status).to.be.oneOf(['ok', 'degraded']);
      expect(res.body).to.have.property('checks');
    });
  });
});
