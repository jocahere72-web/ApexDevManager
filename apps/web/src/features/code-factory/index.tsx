import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import { CodeFactoryWorkspace } from './components/CodeFactoryWorkspace';

export function CodeFactoryPage() {
  const { t } = useTranslation();

  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('codeFactory.eyebrow')}
        title={t('codeFactory.title')}
        description={t('codeFactory.description')}
      />
      <CodeFactoryWorkspace />
    </AppPage>
  );
}

export default CodeFactoryPage;
