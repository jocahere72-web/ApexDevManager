import { Routes, Route } from 'react-router-dom';
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
    <Routes>
      <Route index element={<ReleaseList />} />
      <Route path=":id" element={<ReleasePipeline />} />
    </Routes>
  );
}
