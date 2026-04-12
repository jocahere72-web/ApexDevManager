import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { PageGenerator } from './components/PageGenerator';

// ---------------------------------------------------------------------------
// PRDToPagePage
// ---------------------------------------------------------------------------

export function PRDToPagePage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('pageGen.eyebrow')}
        title={t('pageGen.title')}
        description={t('pageGen.description')}
      />
      <PageGenerator />
    </AppPage>
  );
}

export default PRDToPagePage;
