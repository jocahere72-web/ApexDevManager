import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import GovernanceDashboard from './components/GovernanceDashboard';

/**
 * AI Governance feature page.
 *
 * Routes:
 *   /governance - Dashboard with audit log and safety rules
 */
export default function GovernancePage() {
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Governance"
        title="AI Governance"
        description="Review model usage, safety controls, and audit activity."
      />
      <GovernanceDashboard />
    </AppPage>
  );
}
