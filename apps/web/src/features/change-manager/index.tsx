import { Routes, Route } from 'react-router-dom';
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
  return (
    <AppPage fullWidth>
      <AppPageHeader
        eyebrow="Change Manager"
        title="Change Sets"
        description="Track deployment changes and review release readiness."
      />
      <Routes>
        <Route index element={<ChangeSetList />} />
        <Route path=":id" element={<ChangeSetDetail />} />
      </Routes>
    </AppPage>
  );
}
