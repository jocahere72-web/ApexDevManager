import crypto from 'node:crypto';
import { logger } from '../../lib/logger.js';

// ── Types ────────────────────────────────────────────────────────────────────
export interface Credentials {
  username: string;
  password: string;
}

export interface EncryptedBlob {
  iv: string;
  encrypted: string;
  authTag: string;
  keyId: string;
}

// ── Constants ────────────────────────────────────────────────────────────────
const ALGORITHM = 'aes-256-gcm';
const IV_LENGTH = 12; // 96 bits for GCM
const KEY_LENGTH = 32; // 256 bits

/**
 * Derive a tenant-specific encryption key from the master key.
 * Uses HKDF to produce a unique key per tenant, so encrypted data
 * cannot be decrypted across tenants even with the same master key.
 */
function deriveKey(masterKey: Buffer, tenantId: string): Buffer {
  return crypto.hkdfSync('sha256', masterKey, tenantId, 'apex-credentials', KEY_LENGTH);
}

/**
 * Get the master encryption key from environment.
 * In production, this would be fetched from OCI Vault or a KMS.
 */
function getMasterKey(): Buffer {
  const envKey = process.env.ENCRYPTION_KEY;
  if (!envKey) {
    throw new Error(
      'ENCRYPTION_KEY environment variable is not set. Required for credential encryption.',
    );
  }

  // Support hex-encoded or base64-encoded keys
  const keyBuffer = envKey.length === 64
    ? Buffer.from(envKey, 'hex')
    : Buffer.from(envKey, 'base64');

  if (keyBuffer.length !== KEY_LENGTH) {
    throw new Error(
      `ENCRYPTION_KEY must be ${KEY_LENGTH} bytes (${KEY_LENGTH * 2} hex chars or ${Math.ceil((KEY_LENGTH * 4) / 3)} base64 chars)`,
    );
  }

  return keyBuffer;
}

/**
 * Encrypt connection credentials using AES-256-GCM.
 *
 * The credentials are JSON-serialized, then encrypted with a tenant-specific
 * derived key. The returned blob contains everything needed for decryption
 * (except the master key) and is stored as JSONB in PostgreSQL.
 *
 * In production, the key management would use OCI Vault for key wrapping.
 */
export function encryptCredentials(creds: Credentials, tenantId: string): EncryptedBlob {
  const masterKey = getMasterKey();
  const derivedKey = deriveKey(masterKey, tenantId);
  const iv = crypto.randomBytes(IV_LENGTH);

  const cipher = crypto.createCipheriv(ALGORITHM, derivedKey, iv);

  const plaintext = JSON.stringify(creds);
  const encrypted = Buffer.concat([cipher.update(plaintext, 'utf8'), cipher.final()]);
  const authTag = cipher.getAuthTag();

  logger.debug({ tenantId }, 'Credentials encrypted');

  return {
    iv: iv.toString('hex'),
    encrypted: encrypted.toString('hex'),
    authTag: authTag.toString('hex'),
    keyId: 'master-v1', // In production: OCI Vault key version identifier
  };
}

/**
 * Decrypt connection credentials from an encrypted blob.
 *
 * Reverses the encryption process using the same tenant-specific
 * derived key. Throws on tampered data (GCM authentication failure).
 */
export function decryptCredentials(blob: EncryptedBlob, tenantId: string): Credentials {
  const masterKey = getMasterKey();
  const derivedKey = deriveKey(masterKey, tenantId);

  const iv = Buffer.from(blob.iv, 'hex');
  const encrypted = Buffer.from(blob.encrypted, 'hex');
  const authTag = Buffer.from(blob.authTag, 'hex');

  const decipher = crypto.createDecipheriv(ALGORITHM, derivedKey, iv);
  decipher.setAuthTag(authTag);

  const decrypted = Buffer.concat([decipher.update(encrypted), decipher.final()]);
  const creds = JSON.parse(decrypted.toString('utf8')) as Credentials;

  logger.debug({ tenantId }, 'Credentials decrypted');

  return creds;
}
