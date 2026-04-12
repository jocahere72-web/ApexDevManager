import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { CostDashboard } from './components/CostDashboard';

export function UsageIntelligencePage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('usage.eyebrow')}
        title={t('usage.title')}
        description={t('usage.description')}
      />
      <CostDashboard />
    </AppPage>
  );
}

export default UsageIntelligencePage;
