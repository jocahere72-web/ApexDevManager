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
  intake: { es: 'Creacion de Requerimiento', en: 'Requirement Creation' },
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
    name: 'Creacion de Requerimiento',
    description: 'Creacion del requerimiento por el Lider Operativo y validacion automatica por IA antes de enviar a revision del Jefe de Desarrollo',
    promptTemplate: `Eres un analista senior que valida requerimientos de desarrollo de software APEX.

Evalua el siguiente requerimiento y devuelve un reporte estructurado en JSON con:
- score (0-100): puntaje global de calidad
- summary: resumen ejecutivo en una oracion
- criteria: array de criterios evaluados, cada uno con { id, label, status: 'pass'|'warning'|'fail', message }

Criterios a evaluar:
1. Titulo descriptivo: debe describir que, donde y para que (minimo 5 palabras relevantes)
2. Descripcion completa: debe incluir contexto actual, necesidad y resultado esperado (minimo 100 caracteres)
3. Criterios de aceptacion: debe listar condiciones medibles para validar el resultado
4. Impacto del negocio: debe mencionar a quienes afecta y consecuencias si no se implementa
5. Documentacion de soporte: evaluar si los archivos adjuntos son suficientes
6. Viabilidad tecnica: evaluar si la descripcion es tecnicamente implementable en APEX
7. Alcance claro: evaluar que el alcance este delimitado (no ambiguo)

Datos del requerimiento:
- Titulo: {{title}}
- Descripcion: {{description}}
- Cliente: {{clientName}}
- Aplicacion APEX: {{appName}}
- Prioridad: {{priority}}
- Tipo: {{type}}
- Archivos adjuntos: {{attachmentCount}} documento(s)

Devuelve UNICAMENTE el JSON con el formato solicitado, sin texto adicional.`,
    modelOverride: 'claude-sonnet-4',
    temperature: 0.2,
    maxTokens: 2000,
    requiredFields: [
      { field: 'title', label: 'Titulo', type: 'text' },
      { field: 'description', label: 'Descripcion', type: 'text' },
      { field: 'clientId', label: 'Cliente', type: 'text' },
      { field: 'appId', label: 'Aplicacion APEX', type: 'text' },
      { field: 'priority', label: 'Prioridad', type: 'select', options: ['low', 'medium', 'high', 'critical'] },
    ],
    checklist: [
      { id: 'title-clear', label: 'Titulo descriptivo y claro', required: true },
      { id: 'desc-complete', label: 'Descripcion completa (contexto + necesidad + resultado)', required: true },
      { id: 'acceptance-criteria', label: 'Criterios de aceptacion definidos', required: true },
      { id: 'business-impact', label: 'Impacto del negocio documentado', required: false },
      { id: 'supporting-docs', label: 'Documentacion de soporte adjunta', required: false },
      { id: 'scope-defined', label: 'Alcance claramente delimitado', required: true },
    ],
    config: {
      minScoreToAdvance: 70,
      allowOverrideWithJustification: true,
    },
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
