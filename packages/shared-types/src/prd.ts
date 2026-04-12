// ---------------------------------------------------------------------------
// PRD Builder Types (M8)
// ---------------------------------------------------------------------------

export type PRDStatus =
  | 'draft'
  | 'uploading'
  | 'extracting'
  | 'generating'
  | 'validating'
  | 'validated'
  | 'exported'
  | 'error';

export type PRDStage = 1 | 2 | 3 | 4 | 5;

export const PRD_STAGE_LABELS: Record<PRDStage, string> = {
  1: 'Upload Sources',
  2: 'Extract Requirements',
  3: 'Generate Sections',
  4: 'Validate',
  5: 'Export',
};

export type PRDSourceParseStatus = 'pending' | 'parsing' | 'parsed' | 'error';

export type PRDSectionGeneratedBy = 'ai' | 'user' | 'hybrid';

// ---------------------------------------------------------------------------
// Core Interfaces
// ---------------------------------------------------------------------------

export interface PRDSession {
  id: string;
  tenantId: string;
  appId?: number;
  title: string;
  status: PRDStatus;
  currentStage: PRDStage;
  extractionData?: ExtractionData;
  validationScore?: number;
  validationBlockers: number;
  validationWarnings: number;
  exportedAt?: string;
  createdBy: string;
  createdAt: string;
  updatedAt: string;
  deletedAt?: string;
  /** Populated when fetching a single session */
  sources?: PRDSource[];
  /** Populated when fetching a single session */
  sections?: PRDSection[];
}

export interface PRDSource {
  id: string;
  sessionId: string;
  tenantId: string;
  filename: string;
  mimeType: string;
  fileSize: number;
  storageKey: string;
  parsedText?: string;
  chunkCount: number;
  parseStatus: PRDSourceParseStatus;
  parseError?: string;
  createdAt: string;
}

export interface PRDSection {
  id: string;
  sessionId: string;
  tenantId: string;
  sectionNumber: number;
  title: string;
  content: string;
  version: number;
  isCurrent: boolean;
  generatedBy: PRDSectionGeneratedBy;
  createdAt: string;
}

// ---------------------------------------------------------------------------
// Extraction & Validation
// ---------------------------------------------------------------------------

export interface ExtractionData {
  goals: string[];
  features: ExtractionFeature[];
  userPersonas: string[];
  constraints: string[];
  assumptions: string[];
  outOfScope: string[];
  rawNotes?: string;
}

export interface ExtractionFeature {
  name: string;
  description: string;
  priority: 'must' | 'should' | 'could' | 'wont';
  acceptanceCriteria: string[];
}

export interface ValidationCheck {
  id: string;
  category: 'completeness' | 'consistency' | 'clarity' | 'feasibility' | 'testability';
  severity: 'blocker' | 'warning' | 'info';
  message: string;
  sectionNumber?: number;
  suggestion?: string;
  resolved: boolean;
}

export interface ValidationResult {
  score: number;
  checks: ValidationCheck[];
  blockers: number;
  warnings: number;
  summary: string;
}

// ---------------------------------------------------------------------------
// PRD-to-Page Types (M5)
// ---------------------------------------------------------------------------

export type PageGenInputType = 'prd_section' | 'freeform' | 'requirements';

export type PageGenStatus = 'pending' | 'generating' | 'preview' | 'applying' | 'applied' | 'error';

export interface PageGenerationJob {
  id: string;
  tenantId: string;
  prdSessionId?: string;
  connectionId?: string;
  appId?: number;
  inputType: PageGenInputType;
  inputContent: string;
  status: PageGenStatus;
  pageDefinition?: PageDefinition;
  appliedPageId?: number;
  errorMessage?: string;
  createdBy: string;
  createdAt: string;
  updatedAt: string;
}

export interface PageDefinition {
  pageName: string;
  pageAlias: string;
  pageMode: 'normal' | 'modal' | 'drawer';
  pageTemplate?: string;
  regions: PageRegion[];
  items: PageItem[];
  processes: PageProcess[];
  computations: PageComputation[];
  validations: PageValidation[];
}

export interface PageRegion {
  name: string;
  type: 'body' | 'header' | 'footer' | 'sidebar' | 'sub-region';
  template?: string;
  parentRegion?: string;
  displaySequence: number;
}

export interface PageItem {
  name: string;
  regionName: string;
  itemType: 'text' | 'input' | 'select' | 'button' | 'report' | 'chart' | 'hidden';
  label?: string;
  source?: string;
  sourceType?: 'column' | 'static' | 'plsql' | 'sql';
  displaySequence: number;
  isRequired?: boolean;
  defaultValue?: string;
  helpText?: string;
  conditions?: string;
}

export interface PageProcess {
  name: string;
  type: 'plsql' | 'dml' | 'web_service' | 'computation';
  point: 'before_header' | 'after_header' | 'before_submit' | 'after_submit' | 'on_demand';
  source: string;
  conditionType?: string;
  conditionExpression?: string;
  errorMessage?: string;
}

export interface PageComputation {
  name: string;
  type: 'static' | 'plsql' | 'sql' | 'item_value';
  point: 'before_header' | 'after_header' | 'before_submit' | 'after_submit';
  itemName: string;
  source: string;
}

export interface PageValidation {
  name: string;
  type: 'item' | 'page' | 'tabular';
  validationType: 'not_null' | 'regex' | 'plsql' | 'sql' | 'func_body';
  itemName?: string;
  source: string;
  errorMessage: string;
  conditionType?: string;
  conditionExpression?: string;
}

// ---------------------------------------------------------------------------
// PRD Export Format
// ---------------------------------------------------------------------------

export interface PRDExport {
  metadata: {
    title: string;
    version: string;
    exportedAt: string;
    sessionId: string;
    validationScore?: number;
  };
  sections: Array<{
    number: number;
    title: string;
    content: string;
  }>;
  extractionData?: ExtractionData;
}
