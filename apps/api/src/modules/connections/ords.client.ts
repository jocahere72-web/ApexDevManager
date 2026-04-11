import { logger } from '../../lib/logger.js';
import type { TestResult } from './connections.validation.js';

// ── Types ────────────────────────────────────────────────────────────────────
export interface OrdsConfig {
  ordsBaseUrl: string;
  username: string;
  password: string;
}

export interface OrdsMetadata {
  version?: string;
  schemas?: string[];
  [key: string]: unknown;
}

// ── Constants ────────────────────────────────────────────────────────────────
const CONNECTION_TIMEOUT_MS = 10_000;

/**
 * Test an ORDS connection by hitting the catalog endpoint.
 *
 * Sends a GET request to {ordsBaseUrl}/_/catalog with Basic Auth
 * and a 10-second timeout. Measures round-trip latency.
 */
export async function testOrdsConnection(config: OrdsConfig): Promise<TestResult> {
  const startTime = performance.now();
  const url = `${config.ordsBaseUrl.replace(/\/+$/, '')}/_/catalog`;

  try {
    const credentials = Buffer.from(`${config.username}:${config.password}`).toString('base64');

    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), CONNECTION_TIMEOUT_MS);

    const response = await fetch(url, {
      method: 'GET',
      headers: {
        Authorization: `Basic ${credentials}`,
        Accept: 'application/json',
      },
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    const latencyMs = Math.round(performance.now() - startTime);

    if (!response.ok) {
      return {
        success: false,
        latencyMs,
        message: `ORDS returned HTTP ${response.status}: ${response.statusText}`,
      };
    }

    logger.debug({ url, latencyMs }, 'ORDS connection test succeeded');

    return {
      success: true,
      latencyMs,
      message: 'Connection successful',
      details: { statusCode: response.status },
    };
  } catch (err) {
    const latencyMs = Math.round(performance.now() - startTime);
    const error = err as Error;

    if (error.name === 'AbortError') {
      return {
        success: false,
        latencyMs,
        message: `Connection timed out after ${CONNECTION_TIMEOUT_MS}ms`,
      };
    }

    logger.warn({ err, url }, 'ORDS connection test failed');

    return {
      success: false,
      latencyMs,
      message: `Connection failed: ${error.message}`,
    };
  }
}

/**
 * Fetch ORDS metadata (catalog) from the target instance.
 *
 * Returns parsed catalog JSON which typically includes available
 * schemas, version info, and endpoint listings.
 */
export async function getOrdsMetadata(config: OrdsConfig): Promise<OrdsMetadata> {
  const url = `${config.ordsBaseUrl.replace(/\/+$/, '')}/_/catalog`;
  const credentials = Buffer.from(`${config.username}:${config.password}`).toString('base64');

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), CONNECTION_TIMEOUT_MS);

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: {
        Authorization: `Basic ${credentials}`,
        Accept: 'application/json',
      },
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    if (!response.ok) {
      throw new Error(`ORDS returned HTTP ${response.status}: ${response.statusText}`);
    }

    const data = (await response.json()) as OrdsMetadata;

    logger.debug({ url }, 'ORDS metadata fetched successfully');

    return data;
  } catch (err) {
    clearTimeout(timeoutId);
    throw err;
  }
}
