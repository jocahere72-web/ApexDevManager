import { Routes, Route } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import ChangeSetList from './components/ChangeSetList';
import ChangeSetDetail from './components/ChangeSetDetail';

/**
 * Change Manager feature page.
 *
 * Routes:
 *   /change-manager          - List all change sets
 *   /change-manager/:id      - View change set detail
 */
export default function ChangeManagerPage() {
  const { t } = useTranslation();
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('changeManager.eyebrow')}
        title={t('changeManager.title')}
        description={t('changeManager.description')}
      />
      <Routes>
        <Route index element={<ChangeSetList />} />
        <Route path=":id" element={<ChangeSetDetail />} />
      </Routes>
    </AppPage>
  );
}
