import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { TestSuiteManager } from './components/TestSuiteManager';

export function TestStudioPage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('testStudio.eyebrow')}
        title={t('testStudio.title')}
        description={t('testStudio.description')}
      />
      <TestSuiteManager />
    </AppPage>
  );
}

export default TestStudioPage;
