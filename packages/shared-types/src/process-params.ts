// ── Pipeline Stage Types ────────────────────────────────────────────────────

export type ProcessStage = 'intake' | 'prd' | 'design' | 'build' | 'review' | 'test' | 'deploy';

export const PROCESS_STAGES: ProcessStage[] = ['intake', 'prd', 'design', 'build', 'review', 'test', 'deploy'];

export interface ProcessParams {
  id: string;
  tenantId: string;
  stage: ProcessStage;
  name: string;
  description?: string;
  promptTemplate?: string;
  modelOverride?: string;
  temperature: number;
  maxTokens: number;
  referenceDocument?: string;
  checklist: ChecklistItem[];
  requiredFields: RequiredField[];
  approvalRules: ApprovalRules;
  config: Record<string, unknown>;
  isActive: boolean;
  createdBy?: string;
  createdAt: string;
  updatedAt: string;
}

export interface ChecklistItem {
  id: string;
  label: string;
  required: boolean;
}

export interface RequiredField {
  field: string;
  label: string;
  type: 'text' | 'select' | 'number' | 'date';
  options?: string[];
}

export interface ApprovalRules {
  requireApproval: boolean;
  minApprovers: number;
  approverRoles: string[];
}

export interface UpsertProcessParamsRequest {
  name?: string;
  description?: string;
  promptTemplate?: string;
  modelOverride?: string;
  temperature?: number;
  maxTokens?: number;
  referenceDocument?: string;
  checklist?: ChecklistItem[];
  requiredFields?: RequiredField[];
  approvalRules?: Partial<ApprovalRules>;
  config?: Record<string, unknown>;
}

// ── Stage Labels ────────────────────────────────────────────────────────────

export const STAGE_LABELS: Record<ProcessStage, { es: string; en: string }> = {
  intake: { es: 'Recepcion', en: 'Intake' },
  prd: { es: 'PRD', en: 'PRD' },
  design: { es: 'Diseno', en: 'Design' },
  build: { es: 'Construccion', en: 'Build' },
  review: { es: 'Revision', en: 'Review' },
  test: { es: 'Pruebas', en: 'Test' },
  deploy: { es: 'Despliegue', en: 'Deploy' },
};

// ── Default Process Params ──────────────────────────────────────────────────

export const DEFAULT_PROCESS_PARAMS: Record<ProcessStage, Partial<ProcessParams>> = {
  intake: {
    name: 'Recepcion de Requerimiento',
    description: 'Captura inicial del requerimiento del cliente',
    requiredFields: [
      { field: 'title', label: 'Titulo', type: 'text' },
      { field: 'description', label: 'Descripcion', type: 'text' },
      { field: 'priority', label: 'Prioridad', type: 'select', options: ['low', 'medium', 'high', 'critical'] },
    ],
    checklist: [
      { id: 'desc-clear', label: 'Descripcion clara y completa', required: true },
      { id: 'priority-set', label: 'Prioridad asignada', required: true },
      { id: 'client-confirmed', label: 'Confirmado por el cliente', required: false },
    ],
  },
  prd: {
    name: 'Documento de Requerimientos',
    description: 'Generacion y validacion del PRD',
    promptTemplate: 'Genera un PRD basado en los requerimientos proporcionados...',
    checklist: [
      { id: 'prd-created', label: 'PRD creado', required: true },
      { id: 'prd-validated', label: 'PRD validado sin bloqueantes', required: true },
      { id: 'prd-exported', label: 'PRD exportado', required: false },
    ],
  },
  design: {
    name: 'Diseno de Solucion',
    description: 'Diseno de paginas APEX y modelo de datos',
    checklist: [
      { id: 'pages-designed', label: 'Paginas APEX disenadas', required: true },
      { id: 'schema-reviewed', label: 'Esquema de datos revisado', required: true },
    ],
  },
  build: {
    name: 'Construccion',
    description: 'Desarrollo del codigo PL/SQL y componentes APEX',
    promptTemplate: 'Genera codigo PL/SQL siguiendo las convenciones del proyecto...',
    checklist: [
      { id: 'code-complete', label: 'Codigo completado', required: true },
      { id: 'code-reviewed', label: 'Code review realizado', required: true },
      { id: 'no-errors', label: 'Sin errores de compilacion', required: true },
    ],
  },
  review: {
    name: 'Revision',
    description: 'Revision de cambios y aprobacion',
    approvalRules: { requireApproval: true, minApprovers: 1, approverRoles: ['admin', 'tech_lead'] },
    checklist: [
      { id: 'change-set-reviewed', label: 'Change set revisado', required: true },
      { id: 'no-conflicts', label: 'Sin conflictos detectados', required: true },
      { id: 'approved', label: 'Aprobado por reviewer', required: true },
    ],
  },
  test: {
    name: 'Pruebas',
    description: 'Ejecucion de pruebas automatizadas y manuales',
    checklist: [
      { id: 'tests-generated', label: 'Tests generados', required: true },
      { id: 'tests-passed', label: 'Todos los tests pasaron', required: true },
      { id: 'coverage-ok', label: 'Cobertura >= 70%', required: false },
    ],
  },
  deploy: {
    name: 'Despliegue',
    description: 'Despliegue a ambiente productivo',
    approvalRules: { requireApproval: true, minApprovers: 1, approverRoles: ['admin', 'release_manager'] },
    checklist: [
      { id: 'staging-verified', label: 'Verificado en staging', required: true },
      { id: 'rollback-plan', label: 'Plan de rollback definido', required: true },
      { id: 'deployed', label: 'Desplegado exitosamente', required: true },
    ],
  },
};
