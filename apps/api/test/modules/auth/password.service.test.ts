import { describe, it, beforeEach, afterEach } from 'mocha';
import { expect } from 'chai';
import sinon from 'sinon';
import bcrypt from 'bcrypt';

/**
 * PasswordService test double.
 *
 * Since the actual password.service module is not yet created, we define
 * the expected interface and test against a reference implementation that
 * matches the planned contract. When the real module is built, replace
 * the import with the real service.
 */

// ---------------------------------------------------------------------------
// Reference implementation matching the planned PasswordService contract
// ---------------------------------------------------------------------------
interface LockoutState {
  failedAttempts: number;
  lockedUntil: Date | null;
  isAdminLocked: boolean;
}

const SALT_ROUNDS = 10;
const MAX_FAILED_ATTEMPTS = 5;
const LOCKOUT_DURATION_MS = 15 * 60 * 1000; // 15 minutes

// Simulated DB store
let lockoutStore: Record<string, LockoutState> = {};

const passwordService = {
  async hash(password: string): Promise<string> {
    return bcrypt.hash(password, SALT_ROUNDS);
  },

  async verify(password: string, hash: string): Promise<boolean> {
    return bcrypt.compare(password, hash);
  },

  async recordFailedAttempt(userId: string): Promise<LockoutState> {
    const state = lockoutStore[userId] ?? { failedAttempts: 0, lockedUntil: null, isAdminLocked: false };
    state.failedAttempts += 1;

    if (state.failedAttempts >= MAX_FAILED_ATTEMPTS) {
      state.lockedUntil = new Date(Date.now() + LOCKOUT_DURATION_MS);
    }

    lockoutStore[userId] = state;
    return state;
  },

  async getLockoutState(userId: string): Promise<LockoutState> {
    return lockoutStore[userId] ?? { failedAttempts: 0, lockedUntil: null, isAdminLocked: false };
  },

  async resetFailedAttempts(userId: string): Promise<void> {
    if (lockoutStore[userId]) {
      lockoutStore[userId].failedAttempts = 0;
      lockoutStore[userId].lockedUntil = null;
    }
  },

  async adminLock(userId: string): Promise<void> {
    const state = lockoutStore[userId] ?? { failedAttempts: 0, lockedUntil: null, isAdminLocked: false };
    state.isAdminLocked = true;
    lockoutStore[userId] = state;
  },

  async adminUnlock(userId: string): Promise<void> {
    const state = lockoutStore[userId] ?? { failedAttempts: 0, lockedUntil: null, isAdminLocked: false };
    state.isAdminLocked = false;
    state.failedAttempts = 0;
    state.lockedUntil = null;
    lockoutStore[userId] = state;
  },

  isLockedOut(state: LockoutState): boolean {
    if (state.isAdminLocked) return true;
    if (state.lockedUntil && state.lockedUntil.getTime() > Date.now()) return true;
    return false;
  },
};

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
describe('PasswordService', () => {
  beforeEach(() => {
    lockoutStore = {};
  });

  afterEach(() => {
    sinon.restore();
  });

  describe('hash()', () => {
    it('should return a bcrypt hash of the password', async () => {
      const password = 'SuperSecure123!';
      const hashed = await passwordService.hash(password);

      expect(hashed).to.be.a('string');
      expect(hashed).to.not.equal(password);
      expect(hashed).to.match(/^\$2[aby]?\$/); // bcrypt prefix
    });

    it('should produce different hashes for the same password', async () => {
      const password = 'SuperSecure123!';
      const hash1 = await passwordService.hash(password);
      const hash2 = await passwordService.hash(password);

      expect(hash1).to.not.equal(hash2); // different salts
    });
  });

  describe('verify()', () => {
    it('should return true for a correct password', async () => {
      const password = 'CorrectHorseBatteryStaple';
      const hash = await passwordService.hash(password);

      const result = await passwordService.verify(password, hash);
      expect(result).to.be.true;
    });

    it('should return false for a wrong password', async () => {
      const password = 'CorrectHorseBatteryStaple';
      const hash = await passwordService.hash(password);

      const result = await passwordService.verify('WrongPassword', hash);
      expect(result).to.be.false;
    });
  });

  describe('lockout', () => {
    const userId = 'user-123';

    it('should lock out after 5 failed attempts', async () => {
      for (let i = 0; i < 5; i++) {
        await passwordService.recordFailedAttempt(userId);
      }

      const state = await passwordService.getLockoutState(userId);
      expect(state.failedAttempts).to.equal(5);
      expect(state.lockedUntil).to.not.be.null;
      expect(passwordService.isLockedOut(state)).to.be.true;
    });

    it('should not lock out before 5 failed attempts', async () => {
      for (let i = 0; i < 4; i++) {
        await passwordService.recordFailedAttempt(userId);
      }

      const state = await passwordService.getLockoutState(userId);
      expect(state.failedAttempts).to.equal(4);
      expect(state.lockedUntil).to.be.null;
      expect(passwordService.isLockedOut(state)).to.be.false;
    });

    it('should expire lockout after 15 minutes', async () => {
      for (let i = 0; i < 5; i++) {
        await passwordService.recordFailedAttempt(userId);
      }

      const state = await passwordService.getLockoutState(userId);
      // Simulate time passing by setting lockedUntil to the past
      state.lockedUntil = new Date(Date.now() - 1000);

      expect(passwordService.isLockedOut(state)).to.be.false;
    });

    it('should reset failed attempt counter', async () => {
      for (let i = 0; i < 3; i++) {
        await passwordService.recordFailedAttempt(userId);
      }

      await passwordService.resetFailedAttempts(userId);
      const state = await passwordService.getLockoutState(userId);

      expect(state.failedAttempts).to.equal(0);
      expect(state.lockedUntil).to.be.null;
    });
  });

  describe('admin lock/unlock', () => {
    const userId = 'user-456';

    it('should allow admin to lock a user account', async () => {
      await passwordService.adminLock(userId);
      const state = await passwordService.getLockoutState(userId);

      expect(state.isAdminLocked).to.be.true;
      expect(passwordService.isLockedOut(state)).to.be.true;
    });

    it('should allow admin to unlock a user account', async () => {
      await passwordService.adminLock(userId);
      await passwordService.adminUnlock(userId);
      const state = await passwordService.getLockoutState(userId);

      expect(state.isAdminLocked).to.be.false;
      expect(passwordService.isLockedOut(state)).to.be.false;
    });

    it('should reset failed attempts when admin unlocks', async () => {
      for (let i = 0; i < 5; i++) {
        await passwordService.recordFailedAttempt(userId);
      }

      await passwordService.adminUnlock(userId);
      const state = await passwordService.getLockoutState(userId);

      expect(state.failedAttempts).to.equal(0);
      expect(state.lockedUntil).to.be.null;
      expect(state.isAdminLocked).to.be.false;
    });
  });
});
