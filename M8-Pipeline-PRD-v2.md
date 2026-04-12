---
title: "M8 — Issue-to-Delivery Pipeline (Rediseño completo)"
module: "M8 — PRD Builder → Issue Pipeline"
version: "2.0"
status: "DRAFT"
date: "2026-04-12"
phase: "Fase 2 — S5/S6"
supersedes: "M8 PRD Builder (PRD v5.1 RF-50 a RF-59)"
reference_doc: "APEX_Dev_Manager_PRD_v5_1.md"
author: "JC — Product Lead"
---

# M8 — Issue-to-Delivery Pipeline

## 1. Visión General

M8 evoluciona de un "PRD Builder" de 5 etapas a un **pipeline completo de 6 etapas** que transforma un issue crudo en código construido, probado y documentado. El pipeline es AI-asistido en todas las etapas y mantiene trazabilidad end-to-end desde el requerimiento original hasta el artefacto desplegado.

### Cambio respecto a la versión anterior

| Aspecto | PRD v5.1 (M8 original) | M8 v2.0 (este documento) |
| --- | --- | --- |
| Alcance | Ingesta → PRD → Exportación | Issue → PRD → Análisis → Código → Tests → Docs |
| Etapas | 5 (Ingest, Extract, Generate, Validate, Export) | 6 (Carga, Generación PRD, Análisis, Construcción, Pruebas, Documentación) |
| Salida final | Archivo .md exportado | Código construido, testeado y documentado |
| Integración M5 | Botón "Enviar a M5" al final | M5 integrado como sub-paso de la etapa 4 (Construcción) |
| IA | Solo en extracción/generación/validación | En las 6 etapas |

---

## 2. Flujo de Trabajo — 6 Etapas

| # | Etapa | Nombre | Acción del sistema | Acción del usuario |
| --- | --- | --- | --- | --- |
| 1 | Carga | Carga de Requerimientos | Acepta .docx, .pdf, .png, .jpg, .webp, texto libre y URLs de issues externos. Normaliza a Issue Profile estructurado. Genera preguntas si hay ambigüedad. | Sube archivos, pega texto, o conecta issue externo. Responde preguntas de clarificación. |
| 2 | PRD | Generación del PRD | Genera PRD estructurado usando el documento de referencia. Valida con checklist de 10 criterios. Permite edición y revalidación iterativa por sección. | Revisa PRD, edita secciones, responde preguntas de refinamiento. Aprueba cuando score es aceptable. |
| 3 | Análisis | Análisis de Impacto y Diseño | Cruza PRD aprobado contra codebase actual. Genera grafo de dependencias, análisis de impacto, evaluación de riesgo, estimación de esfuerzo y blueprint de implementación. | Revisa blueprint, ajusta prioridades o secuencia. Aprueba plan de implementación. |
| 4 | Construcción | Construcción | Ejecuta blueprint: genera migraciones, servicios backend, componentes frontend, páginas APEX (vía M5). Verifica compilación. | Revisa código generado, solicita cambios. Aprueba artefactos. |
| 5 | Pruebas | Pruebas | Genera tests unitarios, de integración y E2E desde los criterios de aceptación. Ejecuta suite completa incluyendo regresión de módulos afectados. | Revisa resultados, aprueba cobertura. Reporta falsos positivos. |
| 6 | Documentación | Documentación | Actualiza PRD de referencia, genera changelog, documentación de API (OpenAPI), notas de release y guía de rollback. | Revisa documentación, aprueba para merge. |

### Gate de Aprobación

Cada etapa tiene un gate de aprobación explícito. El usuario debe aprobar para avanzar. Puede solicitar cambios (el sistema reejcuta parcialmente) o revertir a la etapa anterior. El estado del pipeline se persiste y es resumible.

---

## 3. Requerimientos Funcionales

### 3.1 Etapa 1 — Carga de Requerimientos

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-50 | Aceptar ingesta de texto libre, .docx, .doc, .pdf, imágenes (.png, .jpg, .webp) y URLs de issues externos (Linear, Jira) en la misma sesión. Hasta 10 archivos, 25 MB c/u, 100 MB total. | MUST | S5 |
| RF-51 | Parsing real de documentos: .docx vía mammoth, .pdf vía pdf-parse, imágenes vía Claude Vision API, texto/markdown directo. Chunking a 4000 tokens con 200 de overlap. | MUST | S5 |
| RF-52 | Normalizar toda entrada a un Issue Profile estructurado con campos: título, descripción, tipo (feature/bug/mejora/deuda), actores mencionados, módulos referenciados, restricciones explícitas, y prioridad sugerida. | MUST | S5 |
| RF-53 | Clasificación automática del tipo de issue (feature, bug, mejora, deuda técnica) con confianza 0.0-1.0. Si confianza < 0.7, preguntar al usuario. | SHOULD | S5 |
| RF-54 | Validación de completitud del Issue Profile. Si faltan campos críticos (qué, por qué, para quién), generar preguntas de clarificación agrupadas por categoría antes de permitir avance a etapa 2. | MUST | S5 |
| RF-55 | Downscale de imágenes a 2048px de dimensión máxima antes de enviar a Claude Vision. | MUST | S5 |

### 3.2 Etapa 2 — Generación del PRD

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-56 | Generación del PRD usando el documento de referencia como fuente de verdad para estructura, numeración, terminología y convenciones. El prompt no debe tener la estructura hardcodeada — debe leerla del documento. | MUST | S5 |
| RF-57 | PRD generado con las secciones que el documento de referencia define para cada módulo (actualmente 10: contexto, actores, flujos, RF, RNF, modelo de datos, páginas APEX, reglas de negocio, integraciones, preguntas abiertas). | MUST | S5 |
| RF-58 | Generación con streaming SSE. Tiempo máximo 60 segundos para insumos de hasta 5,000 palabras. Barra de progreso por sección. | MUST | S5 |
| RF-59 | Extracción de entidades del dominio APEX/GENESYS: actores, flujos, reglas de negocio, páginas APEX implícitas, tablas GENESYS relevantes. Cada entidad con score de confianza 0.0-1.0. Warning si < 0.6. | MUST | S5 |
| RF-60 | Checklist de validación con 10 criterios separados en bloqueantes (impiden avance) y advertencias (permiten con aviso). Validación ejecutada automáticamente al terminar generación. | MUST | S5 |
| RF-61 | Sistema de preguntas de refinamiento: por cada criterio fallido, Claude genera pregunta específica asociada a la sección afectada. Al responder, se revalida solo esa sección (revalidación parcial). | MUST | S5 |
| RF-62 | Score de PRD 0-100. Umbral mínimo configurable por tenant (default: 70) para habilitar avance a etapa 3. | MUST | S5 |
| RF-63 | Editor inline de secciones con versionado. Cada edición crea nueva versión y dispara revalidación parcial automática. Regeneración individual de una sección sin afectar las demás. | MUST | S5 |
| RF-64 | Numeración consecutiva de RFs y criterios de aceptación a partir del último existente en el documento de referencia. | MUST | S5 |
| RF-65 | Trazabilidad fuente-sección: cada sección indica de qué archivo/fragmento del issue provino la información. | SHOULD | S6 |

### 3.3 Etapa 3 — Análisis de Impacto y Diseño

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-66 | Análisis de dependencias: leer PRD aprobado y cruzar contra el codebase para generar grafo de módulos/tablas/endpoints afectados. Distinguir entre NEW (nuevos) y MODIFIED (existentes que se modifican). | MUST | S5 |
| RF-67 | Análisis de impacto: por cada componente afectado, clasificar riesgo como LOW/MEDIUM/HIGH basado en: cantidad de código a modificar, dependencias transitivas, presencia de tests existentes, y si es código productivo. | MUST | S5 |
| RF-68 | Validación de factibilidad técnica: verificar que endpoints propuestos no colisionen con rutas existentes, que tablas nuevas no tengan conflictos de naming, que FKs referencien tablas existentes, y que el stack soporte lo requerido. | MUST | S5 |
| RF-69 | Estimación de esfuerzo por unidad de trabajo usando métricas del proyecto: puntos por migración, por endpoint, por componente frontend, por página APEX. Salida en story points y horas estimadas. | SHOULD | S6 |
| RF-70 | Plan de secuenciamiento: orden óptimo de implementación respetando dependencias. Migraciones → tipos compartidos → backend → frontend → APEX. Unidades sin dependencias marcadas como paralelizables. | MUST | S5 |
| RF-71 | Generación de Implementation Blueprint: documento estructurado con la lista de work items, su orden, dependencias, riesgos y estimaciones. Este blueprint es el input de la etapa 4. | MUST | S5 |

### 3.4 Etapa 4 — Construcción

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-72 | Generación de migraciones de BD como archivos TypeScript numerados (siguiendo la convención existente: `NNN_nombre.ts`). Incluir up() y down(), RLS policies, indexes, CHECK constraints según convenciones del proyecto. | MUST | S6 |
| RF-73 | Generación de servicios backend: controller (Express router + validación Zod) + service (lógica de negocio + queries SQL) + validation (schemas Zod en archivo separado) + types (interfaces TypeScript en shared-types). | MUST | S6 |
| RF-74 | Generación de componentes frontend: componentes React + TypeScript, hooks React Query, API client tipado. Siguiendo los patrones existentes del proyecto (no estilos inline, usar el sistema de estilos del proyecto). | MUST | S6 |
| RF-75 | Integración con M5 para generación de páginas APEX cuando el PRD incluya páginas APEX nuevas. Creación automática de jobs de generación en M5 con los datos del PRD. | SHOULD | S6 |
| RF-76 | Verificación de build: ejecutar compilación completa del monorepo después de generar código. Reportar errores de compilación y ofrecer corrección automática. | MUST | S6 |
| RF-77 | Revisión de código generado: mostrar diff completo al usuario antes de aplicar. El usuario puede aceptar, rechazar, o solicitar cambios por archivo. | MUST | S6 |

### 3.5 Etapa 5 — Pruebas

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-78 | Generación de tests unitarios: por cada criterio de aceptación Given/When/Then, generar al menos un test case. Tests para servicios, validaciones, y funciones puras. | MUST | S6 |
| RF-79 | Generación de tests de integración: por cada endpoint nuevo/modificado, generar tests de request/response incluyendo validación de RLS, permisos y edge cases. | MUST | S6 |
| RF-80 | Ejecución de suite de tests completa: correr tests generados + tests de regresión de módulos afectados (identificados en etapa 3). | MUST | S6 |
| RF-81 | Reporte de cobertura con mapeo de trazabilidad: RF → Criterio de Aceptación → Test Case → Resultado (pass/fail). Identificar RFs sin cobertura. | SHOULD | S6 |
| RF-82 | Si hay tests fallidos, ofrecer corrección automática del código o del test. Máximo 3 intentos de auto-corrección antes de escalar al usuario. | SHOULD | S6 |

### 3.6 Etapa 6 — Documentación

| ID | Requerimiento | Prioridad | Sprint/Fase |
| --- | --- | --- | --- |
| RF-83 | Actualización del documento de referencia (PRD v5.1) con los nuevos RFs, endpoints, tablas y criterios de aceptación generados e implementados. Aplicar cambios como diff, no reescritura. | MUST | S6 |
| RF-84 | Generación de changelog del módulo afectado con formato: tipo de cambio, descripción, RFs implementados, breaking changes si los hay. | MUST | S6 |
| RF-85 | Generación de documentación de API en formato OpenAPI 3.0 para los endpoints nuevos o modificados. | SHOULD | S6 |
| RF-86 | Generación de release notes en formato resumido: qué se construyó, qué problema resuelve, qué módulos se afectaron, instrucciones de migración si aplica. | MUST | S6 |
| RF-87 | Generación de guía de rollback: pasos para revertir cada artefacto generado (migraciones down, código a revertir, configuración a restaurar). | SHOULD | S6 |

---

## 4. API Endpoints — M8 v2.0

### 4.1 Pipeline y Sesiones

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions | POST | Crea sesión de pipeline. Body: { tenant_id, created_by }. Retorna session_id con stage=1. |
| GET /api/prd-builder/sessions | GET | Lista sesiones del tenant. Params: ?status=&stage=&page=&limit=. |
| GET /api/prd-builder/sessions/:id | GET | Retorna sesión completa con estado actual del pipeline, progreso por etapa, y artefactos generados. |
| DELETE /api/prd-builder/sessions/:id | DELETE | Soft delete de sesión. Solo si no tiene artefactos aplicados en producción. |
| POST /api/prd-builder/sessions/:id/advance | POST | Avanza a la siguiente etapa. Requiere aprobación del gate actual. Valida precondiciones. |
| POST /api/prd-builder/sessions/:id/revert | POST | Revierte a la etapa anterior. Limpia artefactos de la etapa actual. |

### 4.2 Etapa 1 — Carga

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions/:id/ingest | POST | Sube archivos o texto. Multipart. Retorna source_ids. Valida límites (10 archivos, 25MB, 100MB total). |
| DELETE /api/prd-builder/sessions/:id/sources/:sourceId | DELETE | Elimina un source de la sesión. |
| GET /api/prd-builder/sessions/:id/profile | GET | Retorna el Issue Profile normalizado con entidades extraídas y clasificación. |
| POST /api/prd-builder/sessions/:id/clarify | POST | Responde preguntas de clarificación. Body: { answers: [{ questionId, answer }] }. Regenera Issue Profile. |

### 4.3 Etapa 2 — PRD

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions/:id/generate | POST | Genera PRD draft. Streaming SSE. Requiere Issue Profile completo. |
| GET /api/prd-builder/sessions/:id/prd | GET | Retorna PRD completo con secciones, score, checklist y preguntas pendientes. |
| PATCH /api/prd-builder/sessions/:id/sections/:sectionId | PATCH | Edita sección. Crea nueva versión. Dispara revalidación parcial. |
| POST /api/prd-builder/sessions/:id/sections/:sectionId/regenerate | POST | Regenera solo esta sección sin afectar las demás. |
| POST /api/prd-builder/sessions/:id/validate | POST | Ejecuta ciclo de validación completo. Retorna checklist + score. |
| POST /api/prd-builder/sessions/:id/questions/:qId/answer | POST | Responde pregunta de refinamiento. Dispara revalidación parcial de la sección afectada. |
| POST /api/prd-builder/sessions/:id/export | POST | Exporta PRD a .md con frontmatter YAML. Retorna URL de descarga. Bloqueado si hay blockers sin resolver. |

### 4.4 Etapa 3 — Análisis

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions/:id/analyze | POST | Ejecuta análisis de impacto contra codebase. Streaming SSE con progreso. |
| GET /api/prd-builder/sessions/:id/analysis | GET | Retorna resultado del análisis: grafo de dependencias, impacto, riesgos, estimación. |
| GET /api/prd-builder/sessions/:id/blueprint | GET | Retorna Implementation Blueprint con work items secuenciados. |
| PATCH /api/prd-builder/sessions/:id/blueprint/items/:itemId | PATCH | Modifica un work item del blueprint (cambiar prioridad, reordenar, excluir). |

### 4.5 Etapa 4 — Construcción

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions/:id/build | POST | Ejecuta construcción según blueprint. Streaming SSE. Genera artefactos de código. |
| GET /api/prd-builder/sessions/:id/artifacts | GET | Lista artefactos generados con diff, tipo (migration/service/component/page), y estado. |
| GET /api/prd-builder/sessions/:id/artifacts/:artifactId/diff | GET | Retorna diff completo del artefacto vs. código existente. |
| POST /api/prd-builder/sessions/:id/artifacts/:artifactId/approve | POST | Aprueba artefacto individual. |
| POST /api/prd-builder/sessions/:id/artifacts/:artifactId/reject | POST | Rechaza artefacto con comentario. Solicita regeneración. |
| POST /api/prd-builder/sessions/:id/build/verify | POST | Ejecuta verificación de build (compilación del monorepo). |

### 4.6 Etapa 5 — Pruebas

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions/:id/tests/generate | POST | Genera tests desde criterios de aceptación del PRD. |
| POST /api/prd-builder/sessions/:id/tests/run | POST | Ejecuta suite completa: tests generados + regresión. Streaming SSE con resultados en tiempo real. |
| GET /api/prd-builder/sessions/:id/tests/results | GET | Retorna resultados con mapeo RF → CA → Test → Resultado. |
| GET /api/prd-builder/sessions/:id/tests/coverage | GET | Retorna reporte de cobertura con RFs sin tests identificados. |
| POST /api/prd-builder/sessions/:id/tests/:testId/fix | POST | Solicita auto-corrección de test o código por fallo. |

### 4.7 Etapa 6 — Documentación

| Endpoint | Método | Descripción |
| --- | --- | --- |
| POST /api/prd-builder/sessions/:id/docs/generate | POST | Genera toda la documentación: actualización de PRD ref, changelog, OpenAPI, release notes, guía de rollback. |
| GET /api/prd-builder/sessions/:id/docs | GET | Lista documentos generados con tipo y preview. |
| GET /api/prd-builder/sessions/:id/docs/:docId | GET | Retorna documento específico con contenido completo. |
| POST /api/prd-builder/sessions/:id/docs/:docId/approve | POST | Aprueba documento individual. |
| POST /api/prd-builder/sessions/:id/complete | POST | Marca pipeline como completado. Requiere todos los gates aprobados. Emite evento PIPELINE_COMPLETED. |

---

## 5. Modelo de Datos — M8 v2.0

### 5.1 Tablas Existentes (Modificadas)

#### prd_sessions (MODIFICAR)

| Campo | Cambio | Detalle |
| --- | --- | --- |
| status | MODIFICAR CHECK | Agregar estados: `analyzing`, `building`, `testing`, `documenting`, `completed` |
| current_stage | NUEVA COLUMNA | INTEGER NOT NULL DEFAULT 1. CHECK (1-6). Etapa actual del pipeline. |
| stage_1_status | NUEVA COLUMNA | VARCHAR(20) DEFAULT 'pending'. CHECK (pending, in_progress, approved, skipped). |
| stage_2_status | NUEVA COLUMNA | VARCHAR(20) DEFAULT 'pending'. |
| stage_3_status | NUEVA COLUMNA | VARCHAR(20) DEFAULT 'pending'. |
| stage_4_status | NUEVA COLUMNA | VARCHAR(20) DEFAULT 'pending'. |
| stage_5_status | NUEVA COLUMNA | VARCHAR(20) DEFAULT 'pending'. |
| stage_6_status | NUEVA COLUMNA | VARCHAR(20) DEFAULT 'pending'. |
| issue_profile | NUEVA COLUMNA | JSONB NULL. Issue Profile normalizado (salida de etapa 1). |
| blueprint | NUEVA COLUMNA | JSONB NULL. Implementation Blueprint (salida de etapa 3). |
| completed_at | NUEVA COLUMNA | TIMESTAMPTZ NULL. Fecha de completitud del pipeline. |

#### prd_sources (SIN CAMBIOS)

Se mantiene como está. Agrega soporte de imágenes en la validación de ingesta.

#### prd_sections (SIN CAMBIOS)

Se mantiene el diseño actual con versionado.

### 5.2 Tablas Nuevas

#### prd_validation_results

| Campo | Tipo | Nullable | Descripción |
| --- | --- | --- | --- |
| id | UUID PK | NOT NULL | Identificador único |
| tenant_id | UUID FK | NOT NULL | Referencia al tenant (RLS) |
| session_id | UUID FK | NOT NULL | Referencia a prd_sessions |
| criterion_key | VARCHAR(20) | NOT NULL | VAL-01 a VAL-10 |
| criterion_type | VARCHAR(10) | NOT NULL | CHECK (blocker, warning) |
| section_key | VARCHAR(50) | NULL | Sección afectada (si aplica) |
| status | VARCHAR(10) | NOT NULL | CHECK (open, resolved) |
| question_text | TEXT | NULL | Pregunta generada para el usuario |
| answer_text | TEXT | NULL | Respuesta del usuario |
| resolved_at | TIMESTAMPTZ | NULL | Fecha de resolución |
| created_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (session_id), (session_id, status), (session_id, criterion_key)
RLS: tenant_id = current_setting('app.tenant_id')

#### pipeline_analysis

| Campo | Tipo | Nullable | Descripción |
| --- | --- | --- | --- |
| id | UUID PK | NOT NULL | Identificador único |
| tenant_id | UUID FK | NOT NULL | Referencia al tenant (RLS) |
| session_id | UUID FK | NOT NULL | Referencia a prd_sessions (UNIQUE) |
| dependency_graph | JSONB | NOT NULL | Grafo de módulos/tablas/endpoints afectados |
| impact_assessment | JSONB | NOT NULL | Clasificación de riesgo por componente |
| feasibility_checks | JSONB | NOT NULL | Resultados de validación de factibilidad |
| effort_estimation | JSONB | NULL | Estimación de esfuerzo por work item |
| sequencing_plan | JSONB | NOT NULL | Orden de implementación |
| total_story_points | NUMERIC(5,1) | NULL | Estimación total en story points |
| risk_level | VARCHAR(10) | NOT NULL | CHECK (low, medium, high, critical) |
| created_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (session_id) UNIQUE
RLS: tenant_id = current_setting('app.tenant_id')

#### pipeline_work_items

| Campo | Tipo | Nullable | Descripción |
| --- | --- | --- | --- |
| id | UUID PK | NOT NULL | Identificador único |
| tenant_id | UUID FK | NOT NULL | Referencia al tenant (RLS) |
| session_id | UUID FK | NOT NULL | Referencia a prd_sessions |
| sequence_order | INTEGER | NOT NULL | Orden de ejecución |
| category | VARCHAR(30) | NOT NULL | CHECK (migration, shared_type, backend_service, frontend_component, apex_page, test, documentation) |
| title | VARCHAR(255) | NOT NULL | Título descriptivo del work item |
| description | TEXT | NOT NULL | Descripción detallada |
| target_module | VARCHAR(50) | NULL | Módulo destino (M0-M18) |
| target_path | VARCHAR(500) | NULL | Ruta de archivo esperada |
| depends_on | UUID[] | NOT NULL DEFAULT '{}' | IDs de work items de los que depende |
| risk_level | VARCHAR(10) | NOT NULL | CHECK (low, medium, high) |
| story_points | NUMERIC(3,1) | NULL | Estimación |
| status | VARCHAR(20) | NOT NULL | CHECK (pending, in_progress, completed, skipped, failed) |
| created_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (session_id, sequence_order), (session_id, status)
RLS: tenant_id = current_setting('app.tenant_id')

#### pipeline_artifacts

| Campo | Tipo | Nullable | Descripción |
| --- | --- | --- | --- |
| id | UUID PK | NOT NULL | Identificador único |
| tenant_id | UUID FK | NOT NULL | Referencia al tenant (RLS) |
| session_id | UUID FK | NOT NULL | Referencia a prd_sessions |
| work_item_id | UUID FK | NOT NULL | Referencia a pipeline_work_items |
| artifact_type | VARCHAR(30) | NOT NULL | CHECK (migration, service, controller, validation, component, hook, api_client, apex_page, type_definition) |
| file_path | VARCHAR(500) | NOT NULL | Ruta del archivo generado |
| content | TEXT | NOT NULL | Contenido del archivo generado |
| diff_content | TEXT | NULL | Diff vs. archivo existente (si es modificación) |
| is_new_file | BOOLEAN | NOT NULL | true = nuevo, false = modificación de existente |
| approval_status | VARCHAR(20) | NOT NULL | CHECK (pending, approved, rejected, regenerated) |
| rejection_reason | TEXT | NULL | Motivo de rechazo |
| version | INTEGER | NOT NULL DEFAULT 1 | Versión (incrementa al regenerar) |
| created_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (session_id), (work_item_id), (session_id, approval_status)
RLS: tenant_id = current_setting('app.tenant_id')

#### pipeline_test_results

| Campo | Tipo | Nullable | Descripción |
| --- | --- | --- | --- |
| id | UUID PK | NOT NULL | Identificador único |
| tenant_id | UUID FK | NOT NULL | Referencia al tenant (RLS) |
| session_id | UUID FK | NOT NULL | Referencia a prd_sessions |
| test_type | VARCHAR(20) | NOT NULL | CHECK (unit, integration, e2e, regression) |
| test_name | VARCHAR(255) | NOT NULL | Nombre del test |
| test_file_path | VARCHAR(500) | NOT NULL | Ruta del archivo de test |
| rf_id | VARCHAR(10) | NULL | RF asociado (trazabilidad) |
| criteria_id | VARCHAR(15) | NULL | Criterio de aceptación asociado |
| status | VARCHAR(10) | NOT NULL | CHECK (pass, fail, error, skip) |
| error_message | TEXT | NULL | Mensaje de error si falló |
| duration_ms | INTEGER | NULL | Duración de ejecución |
| auto_fix_attempts | INTEGER | NOT NULL DEFAULT 0 | Intentos de corrección automática |
| run_number | INTEGER | NOT NULL DEFAULT 1 | Número de ejecución (incrementa al re-run) |
| created_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (session_id, test_type), (session_id, status), (session_id, rf_id)
RLS: tenant_id = current_setting('app.tenant_id')

#### pipeline_documents

| Campo | Tipo | Nullable | Descripción |
| --- | --- | --- | --- |
| id | UUID PK | NOT NULL | Identificador único |
| tenant_id | UUID FK | NOT NULL | Referencia al tenant (RLS) |
| session_id | UUID FK | NOT NULL | Referencia a prd_sessions |
| doc_type | VARCHAR(30) | NOT NULL | CHECK (prd_update, changelog, openapi, release_notes, rollback_guide) |
| title | VARCHAR(255) | NOT NULL | Título del documento |
| content | TEXT | NOT NULL | Contenido generado |
| target_path | VARCHAR(500) | NULL | Ruta donde se aplicará (si aplica a repo) |
| approval_status | VARCHAR(20) | NOT NULL | CHECK (pending, approved, rejected) |
| created_at | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (session_id, doc_type)
RLS: tenant_id = current_setting('app.tenant_id')

---

## 6. Eventos de Dominio

| Evento | Emisor | Consumidor | Payload |
| --- | --- | --- | --- |
| ISSUE_PROFILE_READY | Etapa 1 | Etapa 2 | { sessionId, profileSummary } |
| PRD_DRAFT_GENERATED | Etapa 2 | Activity Log (M7) | { sessionId, sectionCount, score } |
| PRD_APPROVED | Etapa 2 | Etapa 3, Activity Log | { sessionId, finalScore, rfCount } |
| ANALYSIS_COMPLETED | Etapa 3 | Etapa 4 | { sessionId, workItemCount, riskLevel, storyPoints } |
| BUILD_COMPLETED | Etapa 4 | Etapa 5 | { sessionId, artifactCount, buildSuccess } |
| TESTS_COMPLETED | Etapa 5 | Etapa 6 | { sessionId, totalTests, passed, failed, coverage } |
| DOCS_GENERATED | Etapa 6 | Activity Log | { sessionId, docCount } |
| PIPELINE_COMPLETED | Etapa 6 | Activity Log, Notificaciones | { sessionId, totalDuration, summary } |
| PIPELINE_FAILED | Cualquier etapa | Activity Log, Notificaciones | { sessionId, stage, error } |

---

## 7. Criterios de Aceptación

| ID | Criterio | Tipo |
| --- | --- | --- |
| M8-CA1 | Dado que un usuario sube un documento .docx de 100+ palabras, cuando completa la etapa 1, entonces se genera un Issue Profile con título, tipo, actores y módulos extraídos. | MUST |
| M8-CA2 | Dado que el Issue Profile está incompleto (falta "para quién"), cuando el sistema detecta el faltante, entonces genera preguntas de clarificación y bloquea el avance a etapa 2 hasta que se respondan. | MUST |
| M8-CA3 | Dado que el Issue Profile está completo, cuando se ejecuta la generación del PRD, entonces se produce un PRD con las secciones del documento de referencia, score >= 0, y numeración RF consecutiva. | MUST |
| M8-CA4 | Dado que un PRD tiene validación con blockers sin resolver, cuando el usuario intenta avanzar a etapa 3, entonces el sistema bloquea el avance y muestra los blockers pendientes. | MUST |
| M8-CA5 | Dado que un PRD está aprobado (score >= umbral, 0 blockers), cuando se ejecuta el análisis de impacto, entonces se genera un grafo de dependencias con al menos los módulos mencionados en el PRD. | MUST |
| M8-CA6 | Dado que el blueprint está aprobado, cuando se ejecuta la construcción, entonces se generan artefactos de código que compilan sin errores en el monorepo. | MUST |
| M8-CA7 | Dado que la construcción está completa, cuando se generan y ejecutan tests, entonces cada criterio de aceptación Given/When/Then del PRD tiene al menos un test asociado. | MUST |
| M8-CA8 | Dado que los tests pasan y la documentación está aprobada, cuando se marca el pipeline como completo, entonces se emite el evento PIPELINE_COMPLETED con resumen de duración y artefactos. | MUST |
| M8-CA9 | Dado que el usuario está en etapa 4 y rechaza un artefacto, cuando solicita regeneración, entonces se genera una nueva versión del artefacto sin afectar los artefactos ya aprobados. | MUST |
| M8-CA10 | Dado que un test falla y se solicita auto-corrección, cuando el sistema intenta corregir, entonces realiza máximo 3 intentos antes de escalar al usuario con el error detallado. | SHOULD |

---

## 8. Bugs Existentes a Corregir (Prerequisito)

Antes de implementar las nuevas etapas, se deben corregir los problemas críticos identificados en el code review:

| ID | Bug | Severidad | Etapa Afectada |
| --- | --- | --- | --- |
| BUG-01 | Connection leak en parseSourceAsync | CRÍTICO | Etapa 1 |
| BUG-02 | Connection leak en extractRequirements | CRÍTICO | Etapa 2 |
| BUG-04 | generateSections no abre transacción para borrar secciones previas | CRÍTICO | Etapa 2 |
| BUG-06 | Exportación permite exportar con blockers | ALTO | Etapa 2 |
| BUG-07 | Validación no persiste resultados individuales | ALTO | Etapa 2 |
| BUG-08 | Upload no valida cantidad máxima de archivos | ALTO | Etapa 1 |
| BUG-09 | Límite de archivo 50MB en vez de 25MB | MEDIO | Etapa 1 |
| BUG-10 | handleRegenerateSection regenera TODAS las secciones | ALTO | Etapa 2 |
| BUG-11/12 | Frontend duplicado index.tsx vs PRDSessionList | MEDIO | Todas |
| BUG-13 | Upload simulado con datos mock | MEDIO | Etapa 1 |
| BUG-14 | Navegación libre sin validación de estado | MEDIO | Todas |
| SEC-01 | No hay validación de ownership de sesión | ALTO | Todas |
| SEC-02 | No hay rate limiting en endpoints de IA | ALTO | Todas |
| ARCH-01 | Transacciones inconsistentes | ALTO | Todas |
| ARCH-02 | Prompts hardcodeados (mover a /app/prompts/) | MEDIO | Etapa 2 |
| ARCH-03 | 0 tests en todo el módulo | ALTO | Todas |

---

## 9. Integraciones

| Módulo | Tipo de Integración | Detalle |
| --- | --- | --- |
| M0 — Core Platform | Consume | Autenticación, multi-tenancy, email service |
| M5 — PRD-to-Page | Produce → Consume | Etapa 4 envía PRD a M5 para generación de páginas APEX |
| M7 — Activity Log | Produce | Todos los eventos de dominio se registran en Activity Log |
| M2 — Connection Manager | Consume (etapa 3) | Análisis de impacto consulta conexiones activas para validar factibilidad |
| M6 — Change Log | Produce (etapa 6) | La documentación genera entradas en el Change Log |
