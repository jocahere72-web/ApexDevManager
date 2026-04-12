import { Routes, Route } from 'react-router-dom';
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
    <Routes>
      <Route index element={<ChangeSetList />} />
      <Route path=":id" element={<ChangeSetDetail />} />
    </Routes>
  );
}
