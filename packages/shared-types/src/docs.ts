// ---------------------------------------------------------------------------
// Auto Docs types (M12)
// ---------------------------------------------------------------------------

export type DocExportFormat = 'markdown' | 'pdf' | 'confluence' | 'html';

export interface DocGenRequest {
  connectionId: string;
  objectType: string;
  objectName: string;
  schema: string;
  includeLineComments?: boolean;
  includeExamples?: boolean;
  language?: string;
}

export interface GeneratedDoc {
  id: string;
  tenantId: string;
  connectionId: string;
  objectType: string;
  objectName: string;
  schema: string;
  title: string;
  content: string;
  format: DocExportFormat;
  generatedBy: string;
  createdAt: string;
  updatedAt: string;
}
