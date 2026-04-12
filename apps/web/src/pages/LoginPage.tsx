import { type FormEvent, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../hooks/useAuth';
import { apiClient } from '../lib/api-client';

function LoginPage() {
  const [email, setEmail] = useState('admin@apex.local');
  const [password, setPassword] = useState('');
  const [tenantSlug, setTenantSlug] = useState('apex-demo');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const { t } = useTranslation();
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
    <main className="app-login-shell">
      <section className="app-login-copy" aria-label="Workspace overview">
        <p className="app-login-kicker">{t('app.name')}</p>
        <h1 className="app-login-title">{t('auth.heroTitle')}</h1>
        <p className="app-login-text">
          {t('auth.heroText')}
        </p>
      </section>

      <section className="app-login-panel" aria-label="Sign in">
        <div className="app-login-brand">
          <span className="app-brand-mark">A</span>
          <div>
            <p className="app-login-brand-title">{t('auth.welcome')}</p>
            <p className="app-login-brand-subtitle">{t('auth.subtitle')}</p>
          </div>
        </div>

        <form onSubmit={handleSubmit} className="app-login-form">
          <label className="app-field" htmlFor="tenant">
            <span className="app-label">{t('auth.organization')}</span>
            <input
              id="tenant"
              type="text"
              required
              value={tenantSlug}
              onChange={(e) => setTenantSlug(e.target.value)}
              placeholder="your-organization"
              autoComplete="organization"
              className="app-input"
            />
          </label>

          <label className="app-field" htmlFor="email">
            <span className="app-label">{t('auth.email')}</span>
            <input
              id="email"
              type="email"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="you@example.com"
              autoComplete="email"
              className="app-input"
            />
          </label>

          <label className="app-field" htmlFor="password">
            <span className="app-label">{t('auth.password')}</span>
            <input
              id="password"
              type="password"
              required
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Enter your password"
              autoComplete="current-password"
              className="app-input"
            />
          </label>

          {error && (
            <div className="app-alert app-alert-danger" role="alert">
              {error}
            </div>
          )}

          <button
            type="submit"
            disabled={loading}
            className="app-button app-button-primary"
          >
            {loading ? t('auth.signingIn') : t('auth.signIn')}
          </button>

          <p className="app-login-help">{t('auth.defaultCredentials')}</p>
        </form>
      </section>
    </main>
  );
}

export default LoginPage;
