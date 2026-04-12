import type { ReactNode } from 'react';

interface PageProps {
  children: ReactNode;
  fullWidth?: boolean;
}

interface PageHeaderProps {
  eyebrow?: string;
  title: string;
  description?: string;
  actions?: ReactNode;
}

interface CardProps {
  children: ReactNode;
  padded?: boolean;
}

interface StatusPillProps {
  children: ReactNode;
  tone?: 'neutral' | 'success' | 'warning' | 'danger' | 'accent';
}

export function AppPage({ children, fullWidth = false }: PageProps) {
  return <div className={fullWidth ? 'app-page-full' : 'app-page'}>{children}</div>;
}

export function AppPageHeader({ eyebrow, title, description, actions }: PageHeaderProps) {
  return (
    <header className="app-page-header">
      <div>
        {eyebrow && <p className="app-eyebrow">{eyebrow}</p>}
        <h1 className="app-page-title">{title}</h1>
        {description && <p className="app-page-description">{description}</p>}
      </div>
      {actions && <div className="app-toolbar">{actions}</div>}
    </header>
  );
}

export function AppCard({ children, padded = true }: CardProps) {
  return <section className={`app-card${padded ? ' app-card-pad' : ''}`}>{children}</section>;
}

export function AppToolbar({ children }: { children: ReactNode }) {
  return <div className="app-toolbar">{children}</div>;
}

export function AppEmptyState({ children }: { children: ReactNode }) {
  return <div className="app-empty">{children}</div>;
}

export function AppStatusPill({ children, tone = 'neutral' }: StatusPillProps) {
  return <span className={`app-status-pill app-status-${tone}`}>{children}</span>;
}
