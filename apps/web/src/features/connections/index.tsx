import { Routes, Route } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import ConnectionList from './components/ConnectionList';
import ConnectionDetail from './components/ConnectionDetail';
import ConnectionForm from './components/ConnectionForm';

/**
 * Connections feature page.
 *
 * Provides routing for the connection management screens:
 *   /connections          - List all connections
 *   /connections/new      - Create a new connection
 *   /connections/:id      - View connection detail
 *   /connections/:id/edit - Edit an existing connection
 */
export default function ConnectionsPage() {
  const { t } = useTranslation();
  return (
    <Routes>
      <Route index element={<ConnectionList />} />
      <Route path="new" element={<ConnectionForm />} />
      <Route path=":id" element={<ConnectionDetail />} />
      <Route path=":id/edit" element={<ConnectionForm />} />
    </Routes>
  );
}
