# M8 — Issue-to-Delivery Pipeline: Diseño Técnico

**Fecha:** 2026-04-12
**Versión:** 1.0
**Referencia PRD:** M8-Pipeline-PRD-v2.md

---

## 1. Arquitectura General

### 1.1 Diagrama de Componentes

```
┌─────────────────────────────────────────────────────────────┐
│                        Frontend (React)                      │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │ PipelineView │  │ StageWizard  │  │ ArtifactDiff │       │
│  │  (session)   │──│  (6 stages)  │──│   Viewer     │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
│         │                  │                  │               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  usePipeline │  │  useStage()  │  │  useArtifact │       │
│  │   hooks      │  │  per-stage   │  │   hooks      │       │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘       │
│         └──────────────────┼──────────────────┘               │
│                            │                                  │
│                   ┌────────┴────────┐                         │
│                   │  pipeline.api.ts│  (typed API client)     │
│                   └────────┬────────┘                         │
└────────────────────────────┼────────────────────────────────┘
                             │ HTTP/SSE
┌────────────────────────────┼────────────────────────────────┐
│                        Backend (Express)                      │
│                            │                                  │
│                   ┌────────┴────────┐                         │
│                   │pipeline.controller│                       │
│                   │   (Express Router)│                       │
│                   └────────┬────────┘                         │
│                            │                                  │
│              ┌─────────────┼─────────────┐                    │
│              │             │             │                     │
│     ┌────────┴──┐  ┌──────┴─────┐  ┌───┴──────────┐         │
│     │ pipeline  │  │  stage     │  │  pipeline    │          │
│     │ .service  │  │  services  │  │  .validation │          │
│     │ (orchestr)│  │  (1-6)     │  │  (Zod)       │          │
│     └────────┬──┘  └──────┬─────┘  └──────────────┘         │
│              │             │                                  │
│     ┌────────┴─────────────┴────────────┐                    │
│     │         Shared Services            │                    │
│     │  ┌──────────┐  ┌──────────┐       │                    │
│     │  │  claude   │  │  parser  │       │                    │
│     │  │  .client  │  │  .service│       │                    │
│     │  └──────────┘  └──────────┘       │                    │
│     │  ┌──────────┐  ┌──────────┐       │                    │
│     │  │  event   │  │  codebase│       │                    │
│     │  │  .emitter │  │  .scanner│       │                    │
│     │  └──────────┘  └──────────┘       │                    │
│     └───────────────────┬───────────────┘                    │
│                         │                                     │
│              ┌──────────┴──────────┐                          │
│              │     PostgreSQL       │                          │
│              │  (RLS per tenant)    │                          │
│              └─────────────────────┘                          │
└──────────────────────────────────────────────────────────────┘
```

### 1.2 Principios de Diseño

1. **Orquestador central**: `pipeline.service.ts` maneja el flujo entre etapas, gates de aprobación, y persistencia de estado. Los stage services son stateless y reciben contexto.

2. **Un service por etapa**: `stage1-ingest.service.ts`, `stage2-prd.service.ts`, etc. Cada uno encapsula la lógica de su etapa y expone una interfaz uniforme.

3. **Transacciones consistentes**: Un único patrón — el middleware inyecta `req.dbClient` y todas las queries lo usan. Las transacciones se abren/cierran en el servicio con ese mismo client.

4. **Prompts externalizados**: Todos los prompts en `/app/prompts/pipeline/` como archivos `.md`. Un servicio `prompt.loader.ts` los carga con inyección de variables.

5. **Eventos de dominio**: Cada transición de etapa emite un evento via `EventEmitter`. M7 (Activity Log) consume todos los eventos. Extensible para notificaciones futuras.

6. **Streaming SSE**: Las operaciones largas (generación, análisis, construcción, tests) usan SSE para reportar progreso en tiempo real.

---

## 2. Estructura de Archivos

```
apps/api/src/modules/prd-builder/
├── index.ts                          # Module exports & router mount
├── pipeline.controller.ts            # Express router (todas las rutas)
├── pipeline.service.ts               # Orquestador del pipeline
├── pipeline.validation.ts            # Schemas Zod para todos los endpoints
├── pipeline.events.ts                # Event definitions & emitter
├── stages/
│   ├── stage1-ingest.service.ts      # Carga de requerimientos
│   ├── stage2-prd.service.ts         # Generación del PRD
│   ├── stage3-analysis.service.ts    # Análisis de impacto y diseño
│   ├── stage4-build.service.ts       # Construcción
│   ├── stage5-test.service.ts        # Pruebas
│   └── stage6-docs.service.ts        # Documentación
├── services/
│   ├── parser.service.ts             # Parsing de documentos (mammoth, pdf-parse, vision)
│   ├── claude.client.ts              # Wrapper tipado para Claude API con rate limiting
│   ├── codebase-scanner.service.ts   # Análisis del codebase existente
│   ├── prompt.loader.ts              # Carga prompts desde archivos con variables
│   └── sse.helper.ts                 # Helpers para streaming SSE
└── __tests__/
    ├── pipeline.service.test.ts
    ├── stage1-ingest.test.ts
    ├── stage2-prd.test.ts
    ├── stage3-analysis.test.ts
    ├── stage4-build.test.ts
    ├── stage5-test.test.ts
    ├── stage6-docs.test.ts
    └── pipeline.integration.test.ts

apps/api/prompts/pipeline/
├── extract-entities.md               # Prompt para extracción de entidades APEX/GENESYS
├── generate-prd.md                   # Prompt para generación de PRD (ya existe como prd-generation-system.md)
├── validate-prd.md                   # Prompt para validación de PRD
├── analyze-impact.md                 # Prompt para análisis de impacto
├── generate-code.md                  # Prompt para generación de código
├── generate-tests.md                 # Prompt para generación de tests
├── generate-docs.md                  # Prompt para generación de documentación
└── fix-code.md                       # Prompt para auto-corrección de fallos

apps/api/migrations/
├── 016_prd-sessions.ts               # MODIFICAR: agregar columnas de stage
├── 017_prd-sources.ts                # SIN CAMBIOS
├── 018_prd-sections.ts               # SIN CAMBIOS
├── 019_prd-validation-results.ts     # NUEVA
├── 020_pipeline-analysis.ts          # NUEVA
├── 021_pipeline-work-items.ts        # NUEVA
├── 022_pipeline-artifacts.ts         # NUEVA
├── 023_pipeline-test-results.ts      # NUEVA
├── 024_pipeline-documents.ts         # NUEVA

packages/shared-types/src/
├── prd.ts                            # MODIFICAR: agregar tipos del pipeline
└── pipeline.ts                       # NUEVO: tipos específicos del pipeline

apps/web/src/features/prd-builder/
├── index.tsx                         # REEMPLAZAR: PipelineView como entry point
├── components/
│   ├── PipelineSessionList.tsx       # Lista de sesiones con filtros por stage
│   ├── PipelineWizard.tsx            # Stepper de 6 etapas con gates
│   ├── stages/
│   │   ├── IngestStage.tsx           # UI de carga con drag-n-drop real
│   │   ├── PRDStage.tsx              # Editor de PRD con validación inline
│   │   ├── AnalysisStage.tsx         # Visualización de grafo y blueprint
│   │   ├── BuildStage.tsx            # Lista de artefactos con diff viewer
│   │   ├── TestStage.tsx             # Resultados de tests con cobertura
│   │   └── DocsStage.tsx             # Preview de documentación
│   ├── shared/
│   │   ├── StageGate.tsx             # Componente de gate de aprobación
│   │   ├── SSEProgress.tsx           # Barra de progreso con SSE
│   │   ├── DiffViewer.tsx            # Viewer de diffs de código
│   │   └── DependencyGraph.tsx       # Visualización de grafo de dependencias
│   └── PRDSessionList.tsx            # ELIMINAR (reemplazado por PipelineSessionList)
├── hooks/
│   ├── usePipeline.ts                # Hooks React Query para el pipeline
│   └── usePRD.ts                     # MANTENER para compatibilidad, delegar a usePipeline
└── services/
    └── pipeline.api.ts               # API client tipado para todos los endpoints
```

---

## 3. Contratos de API Detallados

### 3.1 Pipeline Service Interface

```typescript
// pipeline.service.ts
interface PipelineService {
  // Sesiones
  createSession(tenantId: string, createdBy: string): Promise<PipelineSession>;
  getSession(sessionId: string, tenantId: string): Promise<PipelineSession>;
  listSessions(tenantId: string, filters: SessionFilters): Promise<Paginated<PipelineSession>>;

  // Control de flujo
  advanceStage(sessionId: string, tenantId: string): Promise<PipelineSession>;
  revertStage(sessionId: string, tenantId: string): Promise<PipelineSession>;
  completeSession(sessionId: string, tenantId: string): Promise<PipelineSession>;
}

// Cada stage service implementa:
interface StageService {
  execute(session: PipelineSession, ctx: StageContext): Promise<StageResult>;
  getStatus(session: PipelineSession): Promise<StageStatus>;
  canAdvance(session: PipelineSession): Promise<{ allowed: boolean; blockers: string[] }>;
}
```

### 3.2 Stage Context (inyectado por el orquestador)

```typescript
interface StageContext {
  dbClient: PoolClient;           // Conexión con tenant configurado
  tenantId: string;
  userId: string;
  sseStream?: Response;           // Para streaming SSE (opcional)
  abortSignal?: AbortSignal;      // Para cancelación
}
```

### 3.3 Tipos del Pipeline

```typescript
// packages/shared-types/src/pipeline.ts

type PipelineStage = 1 | 2 | 3 | 4 | 5 | 6;

const STAGE_LABELS: Record<PipelineStage, string> = {
  1: 'Carga de Requerimientos',
  2: 'Generación del PRD',
  3: 'Análisis de Impacto y Diseño',
  4: 'Construcción',
  5: 'Pruebas',
  6: 'Documentación',
};

type StageStatus = 'pending' | 'in_progress' | 'approved' | 'skipped';

interface PipelineSession {
  id: string;
  tenantId: string;
  createdBy: string;
  status: 'draft' | 'validating' | 'approved' | 'analyzing' | 'building' | 'testing' | 'documenting' | 'completed';
  currentStage: PipelineStage;
  stages: Record<PipelineStage, StageStatus>;
  issueProfile: IssueProfile | null;
  validationScore: number | null;
  blueprint: ImplementationBlueprint | null;
  createdAt: string;
  updatedAt: string;
  completedAt: string | null;
}

interface IssueProfile {
  title: string;
  description: string;
  issueType: 'feature' | 'bug' | 'improvement' | 'tech_debt';
  issueTypeConfidence: number;
  actors: ExtractedEntity[];
  modules: ExtractedEntity[];
  tables: ExtractedEntity[];
  constraints: string[];
  suggestedPriority: 'MUST' | 'SHOULD' | 'COULD' | 'WONT';
  completenessScore: number;
  missingFields: string[];
  clarificationQuestions: ClarificationQuestion[];
}

interface ExtractedEntity {
  name: string;
  type: string;
  confidence: number;       // 0.0 - 1.0
  sourceFragment: string;   // texto original de donde se extrajo
  sourceFileId: string;     // referencia al prd_sources
}

interface ClarificationQuestion {
  id: string;
  category: 'what' | 'why' | 'who' | 'where' | 'constraints';
  question: string;
  impact: string;           // qué pasa si no se responde
  answered: boolean;
  answer?: string;
}

interface ImplementationBlueprint {
  workItems: WorkItem[];
  totalStoryPoints: number;
  riskLevel: 'low' | 'medium' | 'high' | 'critical';
  estimatedDuration: string;
  parallelizableGroups: string[][];   // grupos de workItem IDs que se pueden ejecutar en paralelo
}

interface WorkItem {
  id: string;
  sequenceOrder: number;
  category: 'migration' | 'shared_type' | 'backend_service' | 'frontend_component' | 'apex_page' | 'test' | 'documentation';
  title: string;
  description: string;
  targetModule: string | null;
  targetPath: string | null;
  dependsOn: string[];
  riskLevel: 'low' | 'medium' | 'high';
  storyPoints: number | null;
  status: 'pending' | 'in_progress' | 'completed' | 'skipped' | 'failed';
}

interface Artifact {
  id: string;
  workItemId: string;
  artifactType: 'migration' | 'service' | 'controller' | 'validation' | 'component' | 'hook' | 'api_client' | 'apex_page' | 'type_definition';
  filePath: string;
  content: string;
  diffContent: string | null;
  isNewFile: boolean;
  approvalStatus: 'pending' | 'approved' | 'rejected' | 'regenerated';
  rejectionReason: string | null;
  version: number;
}

interface TestResult {
  id: string;
  testType: 'unit' | 'integration' | 'e2e' | 'regression';
  testName: string;
  testFilePath: string;
  rfId: string | null;
  criteriaId: string | null;
  status: 'pass' | 'fail' | 'error' | 'skip';
  errorMessage: string | null;
  durationMs: number | null;
  autoFixAttempts: number;
  runNumber: number;
}

interface PipelineDocument {
  id: string;
  docType: 'prd_update' | 'changelog' | 'openapi' | 'release_notes' | 'rollback_guide';
  title: string;
  content: string;
  targetPath: string | null;
  approvalStatus: 'pending' | 'approved' | 'rejected';
}
```

---

## 4. Flujo de Datos por Etapa

### 4.1 Etapa 1: Carga de Requerimientos

```
Input: archivos + texto
    │
    ├─→ parser.service.ts
    │   ├─ .docx → mammoth → texto plano
    │   ├─ .pdf  → pdf-parse → texto plano
    │   ├─ .png/.jpg → Claude Vision → texto descriptivo
    │   └─ texto/md → directo
    │
    ├─→ Chunking (4000 tokens, 200 overlap)
    │
    ├─→ Claude: extraer Issue Profile
    │   ├─ título, descripción, tipo
    │   ├─ actores, módulos, tablas, restricciones
    │   └─ prioridad sugerida
    │
    ├─→ Validación de completitud
    │   ├─ campos críticos presentes? → avanzar
    │   └─ faltan campos? → generar preguntas de clarificación
    │
    └─→ Persistir: prd_sources + prd_sessions.issue_profile
```

### 4.2 Etapa 2: Generación del PRD

```
Input: Issue Profile (etapa 1) + Documento de referencia (PRD v5.1)
    │
    ├─→ prompt.loader.ts carga generate-prd.md con variables
    │
    ├─→ Claude (streaming SSE):
    │   ├─ Lee estructura del documento de referencia
    │   ├─ Ubica módulo(s) afectados
    │   ├─ Determina numeración consecutiva RF/CA
    │   └─ Genera PRD sección por sección
    │
    ├─→ Persistir: prd_sections (10 secciones, versionadas)
    │
    ├─→ Validación automática (10 checks VAL-01 a VAL-10)
    │   ├─ blockers → bloquean avance
    │   └─ warnings → permiten avance con aviso
    │
    ├─→ Persistir: prd_validation_results
    │
    ├─→ Si hay blockers → generar preguntas de refinamiento
    │   └─ Al responder → revalidación parcial de la sección
    │
    └─→ Gate: score >= umbral Y 0 blockers → habilitar avance
```

### 4.3 Etapa 3: Análisis de Impacto y Diseño

```
Input: PRD aprobado + Codebase actual
    │
    ├─→ codebase-scanner.service.ts
    │   ├─ Scan de archivos del módulo afectado
    │   ├─ Parse de rutas de API existentes (colisiones)
    │   ├─ Parse de migraciones existentes (naming, numeración)
    │   └─ Parse de tablas referenciadas (FKs válidas)
    │
    ├─→ Claude: análisis de impacto
    │   ├─ Grafo de dependencias (módulos, tablas, endpoints)
    │   ├─ Clasificación de riesgo por componente
    │   ├─ Validación de factibilidad técnica
    │   └─ Estimación de esfuerzo
    │
    ├─→ Generación de blueprint
    │   ├─ Work items con secuencia y dependencias
    │   ├─ Grupos paralelizables
    │   └─ Risk level total
    │
    ├─→ Persistir: pipeline_analysis + pipeline_work_items
    │
    └─→ Gate: usuario aprueba blueprint → habilitar construcción
```

### 4.4 Etapa 4: Construcción

```
Input: Implementation Blueprint + Codebase
    │
    ├─→ Por cada work item (en orden de secuencia):
    │   │
    │   ├─ migration → generar archivo TypeScript de migración
    │   │   └─ up() + down() + RLS + indexes + CHECK
    │   │
    │   ├─ shared_type → generar/modificar interfaces en shared-types
    │   │
    │   ├─ backend_service → generar controller + service + validation
    │   │   └─ Siguiendo patrones existentes del proyecto
    │   │
    │   ├─ frontend_component → generar componente React + hook + API client
    │   │
    │   └─ apex_page → delegar a M5 (PRD-to-Page Generator)
    │
    ├─→ Persistir: pipeline_artifacts (con contenido y diff)
    │
    ├─→ Verificación de build (compilación del monorepo)
    │
    └─→ Gate: usuario revisa diffs, aprueba/rechaza por artefacto
```

### 4.5 Etapa 5: Pruebas

```
Input: Artefactos aprobados + Criterios de aceptación del PRD
    │
    ├─→ Claude: generar tests
    │   ├─ Por cada criterio Given/When/Then → test case
    │   ├─ Tests unitarios para servicios/validaciones
    │   ├─ Tests de integración para endpoints
    │   └─ Tests de regresión para módulos afectados
    │
    ├─→ Ejecutar suite completa
    │   ├─ Tests generados
    │   └─ Tests existentes de módulos afectados
    │
    ├─→ Si test falla → auto-corrección (max 3 intentos)
    │   └─ Si falla 3 veces → escalar a usuario
    │
    ├─→ Persistir: pipeline_test_results
    │
    └─→ Gate: cobertura aceptable, 0 tests fallidos → avanzar
```

### 4.6 Etapa 6: Documentación

```
Input: PRD + Artefactos + Test results
    │
    ├─→ Claude: generar documentación
    │   ├─ Diff para actualizar PRD de referencia
    │   ├─ Changelog del módulo
    │   ├─ OpenAPI spec para endpoints nuevos/modificados
    │   ├─ Release notes
    │   └─ Guía de rollback
    │
    ├─→ Persistir: pipeline_documents
    │
    └─→ Gate: usuario aprueba documentación → marcar COMPLETED
```

---

## 5. Patrón de Transacciones (Unificado)

```typescript
// ANTES (problemático - mezcla de client y txClient)
async function generateSections(sessionId: string, tenantId: string, client?: PoolClient) {
  // BUG: UPDATE fuera de transacción
  await tenantQuery(client, `UPDATE prd_sections SET is_current = false...`);
  const txClient = await getClient();
  await txClient.query('BEGIN');
  // ...
}

// DESPUÉS (unificado - dbClient inyectado por middleware)
async function generateSections(ctx: StageContext) {
  const { dbClient, tenantId } = ctx;
  await dbClient.query('BEGIN');
  try {
    await dbClient.query(`UPDATE prd_sections SET is_current = false WHERE session_id = $1`, [sessionId]);
    // ... generación ...
    await dbClient.query('COMMIT');
  } catch (err) {
    await dbClient.query('ROLLBACK');
    throw err;
  }
}
```

Middleware de tenant + client:

```typescript
// middleware/tenant.ts
export async function tenantMiddleware(req: Request, res: Response, next: NextFunction) {
  const tenantId = req.headers['x-tenant-id'] as string;
  const client = await pool.connect();
  await client.query(`SET app.tenant_id = $1`, [tenantId]);
  req.dbClient = client;
  req.tenantId = tenantId;
  res.on('finish', () => client.release());
  next();
}
```

---

## 6. Streaming SSE

```typescript
// services/sse.helper.ts
export function createSSEStream(res: Response): SSEWriter {
  res.writeHead(200, {
    'Content-Type': 'text/event-stream',
    'Cache-Control': 'no-cache',
    Connection: 'keep-alive',
  });

  return {
    send(event: string, data: unknown) {
      res.write(`event: ${event}\ndata: ${JSON.stringify(data)}\n\n`);
    },
    progress(stage: string, percent: number, message: string) {
      this.send('progress', { stage, percent, message });
    },
    complete(data: unknown) {
      this.send('complete', data);
      res.end();
    },
    error(message: string) {
      this.send('error', { message });
      res.end();
    },
  };
}
```

---

## 7. Rate Limiting para Claude API

```typescript
// services/claude.client.ts
import Bottleneck from 'bottleneck';

const limiter = new Bottleneck({
  maxConcurrent: 3,              // max 3 llamadas simultáneas por instancia
  minTime: 200,                  // mínimo 200ms entre llamadas
  reservoir: 60,                 // 60 llamadas
  reservoirRefreshAmount: 60,
  reservoirRefreshInterval: 60 * 1000,  // por minuto
});

// Per-tenant limiter
const tenantLimiters = new Map<string, Bottleneck>();

function getTenantLimiter(tenantId: string): Bottleneck {
  if (!tenantLimiters.has(tenantId)) {
    tenantLimiters.set(tenantId, new Bottleneck({
      maxConcurrent: 2,
      minTime: 500,
      reservoir: 30,
      reservoirRefreshAmount: 30,
      reservoirRefreshInterval: 60 * 1000,
    }));
  }
  return tenantLimiters.get(tenantId)!;
}
```

---

## 8. Codebase Scanner

El scanner de codebase es un servicio nuevo que la etapa 3 utiliza para analizar el estado actual del proyecto:

```typescript
// services/codebase-scanner.service.ts
interface CodebaseScanResult {
  modules: ModuleInfo[];           // módulos detectados con sus archivos
  apiRoutes: RouteInfo[];          // rutas de API registradas
  migrations: MigrationInfo[];     // migraciones existentes con numeración
  tables: TableInfo[];             // tablas con columnas y FKs
  sharedTypes: TypeInfo[];         // interfaces exportadas de shared-types
}

interface ModuleInfo {
  name: string;                    // ej: "prd-builder", "connection-manager"
  moduleId: string;                // ej: "M8", "M2"
  basePath: string;                // ej: "apps/api/src/modules/prd-builder"
  files: string[];
  hasTests: boolean;
  testCount: number;
}

// El scanner parsea el codebase real (AST de TypeScript) para extraer
// rutas, tipos y estructura. NO usa heurísticas de texto.
```

---

## 9. Migraciones Necesarias

### Migración 019: prd_validation_results

Tabla nueva para persistir los checks individuales de validación del PRD. Resuelve BUG-07 del code review.

### Migración 020: alter prd_sessions para pipeline

Agrega columnas: current_stage, stage_1_status a stage_6_status, issue_profile (JSONB), blueprint (JSONB), completed_at. Modifica CHECK constraint de status.

### Migración 021: pipeline_analysis

Tabla nueva para almacenar resultados del análisis de impacto.

### Migración 022: pipeline_work_items

Tabla nueva para los work items del blueprint de implementación.

### Migración 023: pipeline_artifacts

Tabla nueva para artefactos de código generados.

### Migración 024: pipeline_test_results

Tabla nueva para resultados de tests.

### Migración 025: pipeline_documents

Tabla nueva para documentación generada.

---

## 10. Dependencias Nuevas

| Paquete | Propósito | Etapa |
| --- | --- | --- |
| mammoth | Parsing de .docx | 1 |
| pdf-parse | Parsing de .pdf | 1 |
| bottleneck | Rate limiting para Claude API | Todas |
| diff | Generación de diffs de código | 4 |
| @ts-morph/ts-morph | AST parsing para codebase scanner | 3 |
| socket.io | Notificaciones de progreso en tiempo real (ya en el stack) | Todas |

---

## 11. Plan de Migración desde M8 Actual

### Fase 0: Corrección de bugs (1 sprint)
Corregir los 16 bugs/issues del code review sin cambiar la arquitectura.

### Fase 1: Refactor de base (1 sprint)
Unificar patrón de transacciones, externalizar prompts, eliminar frontend duplicado, agregar ownership validation.

### Fase 2: Etapas 1-2 completas (1 sprint)
Implementar parsing real, modelo de extracción APEX/GENESYS, sistema de preguntas, validación con persistencia, streaming SSE. Esto lleva las etapas 1-2 a feature-complete.

### Fase 3: Etapa 3 (1 sprint)
Implementar codebase scanner, análisis de impacto, blueprint generator.

### Fase 4: Etapas 4-6 (2 sprints)
Implementar construcción, pruebas y documentación. Estas etapas dependen de la madurez de las anteriores.

**Total estimado: 6 sprints (~12 semanas)**
