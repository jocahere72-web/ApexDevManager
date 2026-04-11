import type { ApplicationTree } from '@apex-dev-manager/shared-types';

// ---------------------------------------------------------------------------
// Offline cache – localStorage persistence for explorer tree data
// ---------------------------------------------------------------------------

const CACHE_PREFIX = 'apex_explorer_cache_';
const CACHE_INDEX_KEY = 'apex_explorer_cache_index';
const MAX_BYTES_PER_CONNECTION = 5 * 1024 * 1024; // 5 MB

// ---------------------------------------------------------------------------
// Internal helpers
// ---------------------------------------------------------------------------

interface CacheIndexEntry {
  connectionId: string;
  /** ISO-8601 timestamp of last write */
  savedAt: string;
  /** Approximate size in bytes */
  sizeBytes: number;
}

function getCacheKey(connectionId: string): string {
  return `${CACHE_PREFIX}${connectionId}`;
}

function readIndex(): CacheIndexEntry[] {
  try {
    const raw = localStorage.getItem(CACHE_INDEX_KEY);
    return raw ? (JSON.parse(raw) as CacheIndexEntry[]) : [];
  } catch {
    return [];
  }
}

function writeIndex(entries: CacheIndexEntry[]): void {
  localStorage.setItem(CACHE_INDEX_KEY, JSON.stringify(entries));
}

function estimateSize(value: string): number {
  // Each JS char is roughly 2 bytes in UTF-16, but localStorage implementations
  // vary. We use char length as a pragmatic approximation.
  return value.length * 2;
}

/**
 * LRU pruning: remove the least-recently-used entries until the total size for
 * the given connection is under the budget.
 */
function pruneIfNeeded(connectionId: string, incomingSize: number): void {
  const index = readIndex();
  const existing = index.find((e) => e.connectionId === connectionId);
  const currentSize = existing?.sizeBytes ?? 0;

  if (currentSize + incomingSize <= MAX_BYTES_PER_CONNECTION) {
    return;
  }

  // Sort oldest-first and remove until we free enough space
  const sorted = [...index].sort(
    (a, b) => new Date(a.savedAt).getTime() - new Date(b.savedAt).getTime(),
  );

  let freedBytes = 0;
  const toRemove: string[] = [];

  for (const entry of sorted) {
    if (freedBytes >= incomingSize) break;
    toRemove.push(entry.connectionId);
    freedBytes += entry.sizeBytes;
  }

  for (const id of toRemove) {
    localStorage.removeItem(getCacheKey(id));
  }

  const remaining = index.filter((e) => !toRemove.includes(e.connectionId));
  writeIndex(remaining);
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/**
 * Persist an application tree to localStorage.
 */
export function saveTreeToLocal(connectionId: string, tree: ApplicationTree): void {
  const serialized = JSON.stringify(tree);
  const size = estimateSize(serialized);

  pruneIfNeeded(connectionId, size);

  localStorage.setItem(getCacheKey(connectionId), serialized);

  // Update index
  const index = readIndex().filter((e) => e.connectionId !== connectionId);
  index.push({ connectionId, savedAt: new Date().toISOString(), sizeBytes: size });
  writeIndex(index);
}

/**
 * Load a previously cached tree. Returns `null` when no cache exists.
 */
export function loadTreeFromLocal(connectionId: string): ApplicationTree | null {
  try {
    const raw = localStorage.getItem(getCacheKey(connectionId));
    return raw ? (JSON.parse(raw) as ApplicationTree) : null;
  } catch {
    return null;
  }
}

/**
 * Remove the cached tree for a specific connection.
 */
export function clearLocalCache(connectionId: string): void {
  localStorage.removeItem(getCacheKey(connectionId));
  const index = readIndex().filter((e) => e.connectionId !== connectionId);
  writeIndex(index);
}

/**
 * Total cache size in bytes across all connections.
 */
export function getLocalCacheSize(): number {
  const index = readIndex();
  return index.reduce((sum, e) => sum + e.sizeBytes, 0);
}

/**
 * Returns `true` when the cache for a connection is older than `maxAgeMs`
 * (defaults to 30 minutes).
 */
export function isLocalCacheStale(
  connectionId: string,
  maxAgeMs: number = 30 * 60 * 1000,
): boolean {
  const index = readIndex();
  const entry = index.find((e) => e.connectionId === connectionId);
  if (!entry) return true;
  return Date.now() - new Date(entry.savedAt).getTime() > maxAgeMs;
}
