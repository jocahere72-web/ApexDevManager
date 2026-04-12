import { useSearchParams } from 'react-router-dom';
import SchemaExplorer from './components/SchemaExplorer';

/**
 * Schema Inspector feature page.
 *
 * Routes:
 *   /schema-inspector          - Schema explorer with optional ?connectionId param
 */
export default function SchemaInspectorPage() {
  const [searchParams] = useSearchParams();
  const connectionId = searchParams.get('connectionId') ?? undefined;

  return <SchemaExplorer connectionId={connectionId} />;
}
