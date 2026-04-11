import { describe, it } from 'mocha';
import { expect } from 'chai';
import crypto from 'crypto';

// ---------------------------------------------------------------------------
// Reference implementation matching the planned EncryptionService contract.
// Uses AES-256-GCM with random IV per encryption call.
// Replace with real imports once the module is built.
// ---------------------------------------------------------------------------
const ENCRYPTION_KEY = crypto.randomBytes(32); // 256-bit key
const ALGORITHM = 'aes-256-gcm';
const IV_LENGTH = 16;
const AUTH_TAG_LENGTH = 16;

interface EncryptedData {
  /** Base64-encoded ciphertext */
  ciphertext: string;
  /** Base64-encoded initialization vector */
  iv: string;
  /** Base64-encoded authentication tag */
  authTag: string;
}

const encryptionService = {
  encrypt(plaintext: string): EncryptedData {
    const iv = crypto.randomBytes(IV_LENGTH);
    const cipher = crypto.createCipheriv(ALGORITHM, ENCRYPTION_KEY, iv);

    let encrypted = cipher.update(plaintext, 'utf8', 'base64');
    encrypted += cipher.final('base64');

    const authTag = cipher.getAuthTag();

    return {
      ciphertext: encrypted,
      iv: iv.toString('base64'),
      authTag: authTag.toString('base64'),
    };
  },

  decrypt(data: EncryptedData): string {
    const iv = Buffer.from(data.iv, 'base64');
    const authTag = Buffer.from(data.authTag, 'base64');
    const decipher = crypto.createDecipheriv(ALGORITHM, ENCRYPTION_KEY, iv);
    decipher.setAuthTag(authTag);

    let decrypted = decipher.update(data.ciphertext, 'base64', 'utf8');
    decrypted += decipher.final('utf8');

    return decrypted;
  },
};

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
describe('EncryptionService', () => {
  describe('encrypt/decrypt round-trip', () => {
    it('should encrypt and decrypt a string successfully', () => {
      const plaintext = 'ghp_mySecretGitHubToken12345';

      const encrypted = encryptionService.encrypt(plaintext);
      const decrypted = encryptionService.decrypt(encrypted);

      expect(decrypted).to.equal(plaintext);
    });

    it('should handle empty strings', () => {
      const plaintext = '';

      const encrypted = encryptionService.encrypt(plaintext);
      const decrypted = encryptionService.decrypt(encrypted);

      expect(decrypted).to.equal(plaintext);
    });

    it('should handle long strings', () => {
      const plaintext = 'A'.repeat(10000);

      const encrypted = encryptionService.encrypt(plaintext);
      const decrypted = encryptionService.decrypt(encrypted);

      expect(decrypted).to.equal(plaintext);
    });

    it('should handle special characters and unicode', () => {
      const plaintext = '{"token":"abc123","secret":"p@$$w0rd!","emoji":"🔐"}';

      const encrypted = encryptionService.encrypt(plaintext);
      const decrypted = encryptionService.decrypt(encrypted);

      expect(decrypted).to.equal(plaintext);
    });
  });

  describe('IV uniqueness', () => {
    it('should use a different IV for each encryption call', () => {
      const plaintext = 'same-input-each-time';

      const encrypted1 = encryptionService.encrypt(plaintext);
      const encrypted2 = encryptionService.encrypt(plaintext);
      const encrypted3 = encryptionService.encrypt(plaintext);

      // IVs must all be different
      expect(encrypted1.iv).to.not.equal(encrypted2.iv);
      expect(encrypted2.iv).to.not.equal(encrypted3.iv);
      expect(encrypted1.iv).to.not.equal(encrypted3.iv);

      // Ciphertexts will also differ due to different IVs
      expect(encrypted1.ciphertext).to.not.equal(encrypted2.ciphertext);
    });
  });

  describe('tamper detection', () => {
    it('should throw an error when ciphertext is tampered', () => {
      const plaintext = 'sensitive-data';
      const encrypted = encryptionService.encrypt(plaintext);

      // Tamper with the ciphertext
      const tamperedCiphertext = Buffer.from(encrypted.ciphertext, 'base64');
      tamperedCiphertext[0] ^= 0xff; // flip bits
      encrypted.ciphertext = tamperedCiphertext.toString('base64');

      expect(() => encryptionService.decrypt(encrypted)).to.throw();
    });

    it('should throw an error when auth tag is tampered', () => {
      const plaintext = 'sensitive-data';
      const encrypted = encryptionService.encrypt(plaintext);

      // Tamper with the auth tag
      const tamperedAuthTag = Buffer.from(encrypted.authTag, 'base64');
      tamperedAuthTag[0] ^= 0xff;
      encrypted.authTag = tamperedAuthTag.toString('base64');

      expect(() => encryptionService.decrypt(encrypted)).to.throw();
    });

    it('should throw an error when IV is tampered', () => {
      const plaintext = 'sensitive-data';
      const encrypted = encryptionService.encrypt(plaintext);

      // Tamper with the IV
      const tamperedIv = Buffer.from(encrypted.iv, 'base64');
      tamperedIv[0] ^= 0xff;
      encrypted.iv = tamperedIv.toString('base64');

      expect(() => encryptionService.decrypt(encrypted)).to.throw();
    });
  });
});
