import { useState, useEffect, useCallback, useRef } from 'react';
import { useSyncConnection, useSyncStatus } from './useExplorer';
import { loadTreeFromLocal, isLocalCacheStale } from '../lib/offlineCache';

// ---------------------------------------------------------------------------
// useOfflineMode
// ---------------------------------------------------------------------------
// Detects network / connection-health status, surfaces offline cache when the
// backend is unreachable, and automatically triggers a sync on reconnection.
// ---------------------------------------------------------------------------

export interface OfflineModeState {
  /** `true` when the browser is offline OR the connection health-check fails */
  isOffline: boolean;
  /** ISO-8601 timestamp of the last successful sync for this connection */
  lastSyncAt: string | null;
  /** How stale the local cache is, in milliseconds. `null` if no cache. */
  staleness: number | null;
}

const HEALTH_CHECK_INTERVAL_MS = 20_000; // 20 seconds

export function useOfflineMode(connectionId: string): OfflineModeState {
  const [browserOffline, setBrowserOffline] = useState(!navigator.onLine);
  const [backendReachable, setBackendReachable] = useState(true);
  const wasOfflineRef = useRef(false);

  const { data: syncStatus } = useSyncStatus(connectionId);
  const { mutate: triggerSync } = useSyncConnection();

  // -----------------------------------------------------------------------
  // Browser online/offline events
  // -----------------------------------------------------------------------
  useEffect(() => {
    const goOffline = () => setBrowserOffline(true);
    const goOnline = () => setBrowserOffline(false);
    window.addEventListener('offline', goOffline);
    window.addEventListener('online', goOnline);
    return () => {
      window.removeEventListener('offline', goOffline);
      window.removeEventListener('online', goOnline);
    };
  }, []);

  // -----------------------------------------------------------------------
  // Lightweight backend reachability probe
  // -----------------------------------------------------------------------
  const checkBackend = useCallback(async () => {
    if (!connectionId) return;
    try {
      const res = await fetch('/api/v1/health', { method: 'HEAD', cache: 'no-store' });
      setBackendReachable(res.ok);
    } catch {
      setBackendReachable(false);
    }
  }, [connectionId]);

  useEffect(() => {
    if (browserOffline) {
      setBackendReachable(false);
      return;
    }
    checkBackend();
    const id = setInterval(checkBackend, HEALTH_CHECK_INTERVAL_MS);
    return () => clearInterval(id);
  }, [browserOffline, checkBackend]);

  // -----------------------------------------------------------------------
  // Auto-sync on recovery
  // -----------------------------------------------------------------------
  const isOffline = browserOffline || !backendReachable;

  useEffect(() => {
    if (isOffline) {
      wasOfflineRef.current = true;
    } else if (wasOfflineRef.current) {
      // Just came back online -- trigger a sync
      wasOfflineRef.current = false;
      if (connectionId) {
        triggerSync(connectionId);
      }
    }
  }, [isOffline, connectionId, triggerSync]);

  // -----------------------------------------------------------------------
  // Staleness computation
  // -----------------------------------------------------------------------
  const lastSyncAt = syncStatus?.lastSyncAt ?? null;

  let staleness: number | null = null;
  if (connectionId) {
    const cached = loadTreeFromLocal(connectionId);
    if (cached?.fetchedAt) {
      staleness = Date.now() - new Date(cached.fetchedAt).getTime();
    } else if (isLocalCacheStale(connectionId)) {
      // Cache exists but we cannot determine exact staleness -- flag as stale
      staleness = Infinity;
    }
  }

  return { isOffline, lastSyncAt, staleness };
}
