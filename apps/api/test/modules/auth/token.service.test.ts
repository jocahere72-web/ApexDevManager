import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import sinon from 'sinon';
import jwt from 'jsonwebtoken';
import { v4 as uuidv4 } from 'uuid';

// ---------------------------------------------------------------------------
// Test constants
// ---------------------------------------------------------------------------
const TEST_JWT_SECRET = 'test-jwt-secret-that-is-at-least-32-chars-long!!';
const TEST_JWT_EXPIRES_IN = '15m';
const TEST_REFRESH_EXPIRES_IN = '7d';

// ---------------------------------------------------------------------------
// Reference implementation matching the planned TokenService contract
// ---------------------------------------------------------------------------
interface TokenPayload {
  sub: string;        // userId
  tenantId: string;
  role: string;
  jti?: string;       // JWT ID for refresh token tracking
  family?: string;    // refresh token family for rotation detection
}

interface TokenPair {
  accessToken: string;
  refreshToken: string;
}

// Simulated DB store for refresh tokens
let refreshTokenStore: Record<string, { family: string; used: boolean; userId: string }> = {};

const tokenService = {
  generateAccessToken(payload: TokenPayload): string {
    return jwt.sign(
      { sub: payload.sub, tenantId: payload.tenantId, role: payload.role },
      TEST_JWT_SECRET,
      { expiresIn: TEST_JWT_EXPIRES_IN },
    );
  },

  verifyAccessToken(token: string): TokenPayload {
    const decoded = jwt.verify(token, TEST_JWT_SECRET) as jwt.JwtPayload;
    return {
      sub: decoded.sub as string,
      tenantId: decoded.tenantId as string,
      role: decoded.role as string,
    };
  },

  generateTokenPair(payload: TokenPayload): TokenPair {
    const family = uuidv4();
    const jti = uuidv4();

    const accessToken = this.generateAccessToken(payload);
    const refreshToken = jwt.sign(
      { sub: payload.sub, tenantId: payload.tenantId, role: payload.role, jti, family },
      TEST_JWT_SECRET,
      { expiresIn: TEST_REFRESH_EXPIRES_IN },
    );

    // Store refresh token
    refreshTokenStore[jti] = { family, used: false, userId: payload.sub };

    return { accessToken, refreshToken };
  },

  async rotateRefreshToken(refreshToken: string): Promise<TokenPair | null> {
    let decoded: jwt.JwtPayload;
    try {
      decoded = jwt.verify(refreshToken, TEST_JWT_SECRET) as jwt.JwtPayload;
    } catch {
      return null;
    }

    const jti = decoded.jti as string;
    const family = decoded.family as string;
    const stored = refreshTokenStore[jti];

    if (!stored) return null;

    // Reuse detection: if the token was already used, invalidate the entire family
    if (stored.used) {
      // Invalidate all tokens in this family
      for (const [key, value] of Object.entries(refreshTokenStore)) {
        if (value.family === family) {
          delete refreshTokenStore[key];
        }
      }
      return null;
    }

    // Mark current token as used
    stored.used = true;

    // Generate new token pair in the same family
    const newJti = uuidv4();
    const payload: TokenPayload = {
      sub: decoded.sub as string,
      tenantId: decoded.tenantId as string,
      role: decoded.role as string,
    };

    const accessToken = this.generateAccessToken(payload);
    const newRefreshToken = jwt.sign(
      { ...payload, jti: newJti, family },
      TEST_JWT_SECRET,
      { expiresIn: TEST_REFRESH_EXPIRES_IN },
    );

    refreshTokenStore[newJti] = { family, used: false, userId: payload.sub };

    return { accessToken, refreshToken: newRefreshToken };
  },
};

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
describe('TokenService', () => {
  beforeEach(() => {
    refreshTokenStore = {};
  });

  afterEach(() => {
    sinon.restore();
  });

  describe('generateAccessToken()', () => {
    it('should generate a valid JWT', () => {
      const payload: TokenPayload = {
        sub: 'user-1',
        tenantId: 'tenant-1',
        role: 'admin',
      };

      const token = tokenService.generateAccessToken(payload);
      expect(token).to.be.a('string');
      expect(token.split('.')).to.have.length(3); // header.payload.signature

      const decoded = jwt.verify(token, TEST_JWT_SECRET) as jwt.JwtPayload;
      expect(decoded.sub).to.equal('user-1');
      expect(decoded.tenantId).to.equal('tenant-1');
      expect(decoded.role).to.equal('admin');
    });
  });

  describe('verifyAccessToken()', () => {
    it('should verify a valid token and return the payload', () => {
      const payload: TokenPayload = {
        sub: 'user-2',
        tenantId: 'tenant-2',
        role: 'developer',
      };

      const token = tokenService.generateAccessToken(payload);
      const result = tokenService.verifyAccessToken(token);

      expect(result.sub).to.equal('user-2');
      expect(result.tenantId).to.equal('tenant-2');
      expect(result.role).to.equal('developer');
    });

    it('should reject an expired token', () => {
      const token = jwt.sign(
        { sub: 'user-3', tenantId: 'tenant-3', role: 'viewer' },
        TEST_JWT_SECRET,
        { expiresIn: '0s' },
      );

      // Small delay to ensure token is expired
      expect(() => tokenService.verifyAccessToken(token)).to.throw(jwt.TokenExpiredError);
    });

    it('should reject a token signed with a different secret', () => {
      const token = jwt.sign(
        { sub: 'user-4', tenantId: 'tenant-4', role: 'admin' },
        'wrong-secret-that-is-long-enough-for-testing',
        { expiresIn: '15m' },
      );

      expect(() => tokenService.verifyAccessToken(token)).to.throw(jwt.JsonWebTokenError);
    });
  });

  describe('refresh token rotation', () => {
    it('should generate a new token pair on rotation', async () => {
      const payload: TokenPayload = {
        sub: 'user-5',
        tenantId: 'tenant-5',
        role: 'admin',
      };

      const original = tokenService.generateTokenPair(payload);
      const rotated = await tokenService.rotateRefreshToken(original.refreshToken);

      expect(rotated).to.not.be.null;
      expect(rotated!.accessToken).to.be.a('string');
      expect(rotated!.refreshToken).to.be.a('string');
      expect(rotated!.accessToken).to.not.equal(original.accessToken);
      expect(rotated!.refreshToken).to.not.equal(original.refreshToken);
    });

    it('should invalidate the entire family on reuse detection', async () => {
      const payload: TokenPayload = {
        sub: 'user-6',
        tenantId: 'tenant-6',
        role: 'developer',
      };

      const original = tokenService.generateTokenPair(payload);

      // First rotation succeeds
      const rotated = await tokenService.rotateRefreshToken(original.refreshToken);
      expect(rotated).to.not.be.null;

      // Second use of the ORIGINAL token (reuse!) should fail and invalidate family
      const reused = await tokenService.rotateRefreshToken(original.refreshToken);
      expect(reused).to.be.null;

      // The rotated token should also be invalidated (family wiped)
      const afterReuse = await tokenService.rotateRefreshToken(rotated!.refreshToken);
      expect(afterReuse).to.be.null;
    });

    it('should return null for an invalid refresh token', async () => {
      const result = await tokenService.rotateRefreshToken('not.a.valid.token');
      expect(result).to.be.null;
    });
  });
});
