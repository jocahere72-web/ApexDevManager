import { type CSSProperties, useState, useRef, useEffect, useCallback } from 'react';
import type { ConnectionStatus } from '@/services/connections.api';

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

interface HealthBadgeProps {
  status: ConnectionStatus;
  size?: 'sm' | 'md' | 'lg';
  showLabel?: boolean;
  latencyMs?: number | null;
  lastCheckAt?: string | null;
}

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------

const STATUS_CONFIG: Record<
  ConnectionStatus,
  { color: string; bg: string; label: string }
> = {
  connected: { color: '#15803d', bg: '#dcfce7', label: 'Connected' },
  degraded: { color: '#a16207', bg: '#fef9c3', label: 'Degraded' },
  disconnected: { color: '#b91c1c', bg: '#fee2e2', label: 'Disconnected' },
  unknown: { color: '#6b7280', bg: '#f3f4f6', label: 'Unknown' },
};

const SIZE_CONFIG: Record<'sm' | 'md' | 'lg', { fontSize: string; padding: string; dot: string }> = {
  sm: { fontSize: '0.75rem', padding: '0.125rem 0.5rem', dot: '6px' },
  md: { fontSize: '0.8125rem', padding: '0.25rem 0.625rem', dot: '8px' },
  lg: { fontSize: '0.875rem', padding: '0.375rem 0.75rem', dot: '10px' },
};

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export default function HealthBadge({
  status,
  size = 'md',
  showLabel = true,
  latencyMs,
  lastCheckAt,
}: HealthBadgeProps) {
  const cfg = STATUS_CONFIG[status];
  const sz = SIZE_CONFIG[size];
  const [showTooltip, setShowTooltip] = useState(false);
  const wrapperRef = useRef<HTMLSpanElement>(null);

  const hasTooltipContent = latencyMs != null || lastCheckAt != null;

  const handleMouseEnter = useCallback(() => {
    if (hasTooltipContent) setShowTooltip(true);
  }, [hasTooltipContent]);

  const handleMouseLeave = useCallback(() => {
    setShowTooltip(false);
  }, []);

  // Close tooltip on outside click
  useEffect(() => {
    if (!showTooltip) return;
    const handler = (e: MouseEvent) => {
      if (wrapperRef.current && !wrapperRef.current.contains(e.target as Node)) {
        setShowTooltip(false);
      }
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, [showTooltip]);

  const badgeStyle: CSSProperties = {
    display: 'inline-flex',
    alignItems: 'center',
    gap: '0.375rem',
    padding: sz.padding,
    fontSize: sz.fontSize,
    fontWeight: 500,
    borderRadius: '9999px',
    color: cfg.color,
    backgroundColor: cfg.bg,
    lineHeight: 1,
    whiteSpace: 'nowrap',
    cursor: hasTooltipContent ? 'help' : 'default',
    position: 'relative',
  };

  const dotStyle: CSSProperties = {
    width: sz.dot,
    height: sz.dot,
    borderRadius: '50%',
    backgroundColor: cfg.color,
    flexShrink: 0,
  };

  const tooltipStyle: CSSProperties = {
    position: 'absolute',
    bottom: 'calc(100% + 8px)',
    left: '50%',
    transform: 'translateX(-50%)',
    backgroundColor: '#1f2937',
    color: '#f9fafb',
    padding: '0.5rem 0.75rem',
    borderRadius: '0.375rem',
    fontSize: '0.75rem',
    lineHeight: '1.4',
    whiteSpace: 'nowrap',
    zIndex: 50,
    pointerEvents: 'none',
    boxShadow: '0 4px 6px -1px rgba(0,0,0,0.1)',
  };

  const formatLastCheck = (iso: string) => {
    try {
      return new Date(iso).toLocaleString();
    } catch {
      return iso;
    }
  };

  return (
    <span
      ref={wrapperRef}
      style={{ position: 'relative', display: 'inline-flex' }}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      <span style={badgeStyle}>
        <span style={dotStyle} />
        {showLabel && cfg.label}
      </span>

      {showTooltip && hasTooltipContent && (
        <span style={tooltipStyle}>
          {latencyMs != null && <span>Latency: {latencyMs}ms</span>}
          {latencyMs != null && lastCheckAt != null && <br />}
          {lastCheckAt != null && (
            <span>Last check: {formatLastCheck(lastCheckAt)}</span>
          )}
        </span>
      )}
    </span>
  );
}
