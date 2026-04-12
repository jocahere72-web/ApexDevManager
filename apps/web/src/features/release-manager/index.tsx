import { Routes, Route } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { AppPage, AppPageHeader } from '@/components/ui/AppTemplate';
import ReleaseList from './components/ReleaseList';
import ReleasePipeline from './components/ReleasePipeline';

/**
 * Release Manager feature page.
 *
 * Routes:
 *   /releases          - List all releases
 *   /releases/:id      - View release pipeline detail
 */
export default function ReleaseManagerPage() {
  const { t } = useTranslation();
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow={t('releases.eyebrow')}
        title={t('releases.title')}
        description={t('releases.description')}
      />
      <Routes>
        <Route index element={<ReleaseList />} />
        <Route path=":id" element={<ReleasePipeline />} />
      </Routes>
    </AppPage>
  );
}
