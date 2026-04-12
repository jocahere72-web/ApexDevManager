import { Routes, Route } from 'react-router-dom';
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
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Release Manager"
        title="Releases"
        description="Coordinate packaging, approvals, and release pipeline progress."
      />
      <Routes>
        <Route index element={<ReleaseList />} />
        <Route path=":id" element={<ReleasePipeline />} />
      </Routes>
    </AppPage>
  );
}
