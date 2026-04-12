import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import GovernanceDashboard from './components/GovernanceDashboard';

/**
 * AI Governance feature page.
 *
 * Routes:
 *   /governance - Dashboard with audit log and safety rules
 */
export default function GovernancePage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('governance.eyebrow')}
        title={t('governance.title')}
        description={t('governance.description')}
      />
      <GovernanceDashboard />
    </AppPage>
  );
}
