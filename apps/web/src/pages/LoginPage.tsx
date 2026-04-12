import { type FormEvent, useState, useEffect } from 'react';
import { useAuth } from '../hooks/useAuth';
import { apiClient } from '../lib/api-client';

function LoginPage() {
  const [email, setEmail] = useState('admin@apex.local');
  const [password, setPassword] = useState('');
  const [tenantSlug, setTenantSlug] = useState('apex-demo');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const { login } = useAuth();

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setLoading(true);
    try {
      // Resolve tenant ID from slug first
      const tenantRes = await apiClient.get(`/auth/tenant/${tenantSlug}`).catch(() => null);
      let tenantId = tenantRes?.data?.data?.id;

      if (!tenantId) {
        // Fallback: query directly (for dev, the tenant ID might be known)
        // Try using the slug as-is or look up from a known list
        const stored = localStorage.getItem('apex_tenant_id');
        if (stored) {
          tenantId = stored;
        } else {
          setError('Tenant not found. Check the organization slug.');
          setLoading(false);
          return;
        }
      }

      localStorage.setItem('apex_tenant_id', tenantId);
      await login({ email, password });
    } catch (err: unknown) {
      if (err && typeof err === 'object' && 'response' in err) {
        const axiosErr = err as { response?: { data?: { error?: { message?: string } } } };
        setError(axiosErr.response?.data?.error?.message || 'Login failed');
      } else {
        setError(err instanceof Error ? err.message : 'Login failed');
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        minHeight: '100vh',
        backgroundColor: '#f0f2f5',
        fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
      }}
    >
      <form
        onSubmit={handleSubmit}
        style={{
          width: '100%',
          maxWidth: '24rem',
          padding: '2.5rem',
          backgroundColor: '#ffffff',
          borderRadius: '0.75rem',
          boxShadow: '0 4px 24px rgba(0, 0, 0, 0.08)',
        }}
      >
        <div style={{ textAlign: 'center', marginBottom: '2rem' }}>
          <h1 style={{ fontSize: '1.75rem', fontWeight: 700, color: '#1a1a2e', margin: 0 }}>
            APEX Dev Manager
          </h1>
          <p style={{ color: '#6b7280', marginTop: '0.5rem', fontSize: '0.9rem' }}>
            Sign in to your workspace
          </p>
        </div>

        <div style={{ marginBottom: '1rem' }}>
          <label htmlFor="tenant" style={{ display: 'block', marginBottom: '0.25rem', fontWeight: 500, fontSize: '0.875rem', color: '#374151' }}>
            Organization
          </label>
          <input
            id="tenant"
            type="text"
            required
            value={tenantSlug}
            onChange={(e) => setTenantSlug(e.target.value)}
            placeholder="your-organization"
            style={{
              width: '100%', padding: '0.625rem 0.75rem', border: '1px solid #d1d5db',
              borderRadius: '0.375rem', fontSize: '0.95rem', boxSizing: 'border-box',
              outline: 'none', transition: 'border-color 0.2s',
            }}
          />
        </div>

        <div style={{ marginBottom: '1rem' }}>
          <label htmlFor="email" style={{ display: 'block', marginBottom: '0.25rem', fontWeight: 500, fontSize: '0.875rem', color: '#374151' }}>
            Email
          </label>
          <input
            id="email"
            type="email"
            required
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="you@example.com"
            style={{
              width: '100%', padding: '0.625rem 0.75rem', border: '1px solid #d1d5db',
              borderRadius: '0.375rem', fontSize: '0.95rem', boxSizing: 'border-box',
            }}
          />
        </div>

        <div style={{ marginBottom: '1.5rem' }}>
          <label htmlFor="password" style={{ display: 'block', marginBottom: '0.25rem', fontWeight: 500, fontSize: '0.875rem', color: '#374151' }}>
            Password
          </label>
          <input
            id="password"
            type="password"
            required
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Enter your password"
            style={{
              width: '100%', padding: '0.625rem 0.75rem', border: '1px solid #d1d5db',
              borderRadius: '0.375rem', fontSize: '0.95rem', boxSizing: 'border-box',
            }}
          />
        </div>

        {error && (
          <div style={{
            marginBottom: '1rem', padding: '0.625rem 0.75rem', backgroundColor: '#fef2f2',
            color: '#dc2626', borderRadius: '0.375rem', fontSize: '0.85rem', border: '1px solid #fecaca',
          }}>
            {error}
          </div>
        )}

        <button
          type="submit"
          disabled={loading}
          style={{
            width: '100%', padding: '0.75rem', backgroundColor: loading ? '#93c5fd' : '#2563eb',
            color: '#ffffff', fontWeight: 600, border: 'none', borderRadius: '0.375rem',
            fontSize: '1rem', cursor: loading ? 'not-allowed' : 'pointer',
            transition: 'background-color 0.2s',
          }}
        >
          {loading ? 'Signing In...' : 'Sign In'}
        </button>

        <p style={{ textAlign: 'center', marginTop: '1.5rem', fontSize: '0.8rem', color: '#9ca3af' }}>
          Default: admin@apex.local / Admin123!
        </p>
      </form>
    </div>
  );
}

export default LoginPage;
