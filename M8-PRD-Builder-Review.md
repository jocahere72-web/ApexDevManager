# Revisión del Módulo M8 — PRD Builder

**Fecha:** 2026-04-12  
**Revisado por:** Claude (asistente de Jc)  
**Fuentes:** PRD v5.1, Diseño Funcional U6, Código implementado (backend + frontend)

---

## 1. Resumen Ejecutivo

El módulo M8 PRD Builder tiene como propósito transformar insumos desestructurados (texto libre, Word, PDF, imágenes) en PRDs estructurados, validados y exportables, listos para alimentar el módulo M5 (PRD-to-Page Generator).

La implementación actual cubre la estructura general del flujo de 5 etapas, pero presenta **brechas significativas** respecto a lo definido en el PRD y el diseño funcional. A continuación se detalla funcionalidad por funcionalidad.

---

## 2. Matriz de Funcionalidades: Definido vs. Implementado

### 2.1 Etapa 1 — Ingesta

| Funcionalidad | PRD (RF) | Diseño Funcional | Implementado | Estado |
|---|---|---|---|---|
| Archivos .docx | RF-50 | Sí (mammoth) | Parcial — stub con texto placeholder | ⚠️ INCOMPLETO |
| Archivos .pdf | RF-50 | Sí (pdf-parse) | Parcial — stub con texto placeholder | ⚠️ INCOMPLETO |
| Archivos .doc | RF-50 | No mencionado | No | ❌ FALTA |
| Imágenes PNG/JPG | RF-50 | Sí (Claude Vision API) | No soportado en validation schema | ❌ FALTA |
| Imágenes .webp | RF-50 (PRD) | No | No | ❌ FALTA |
| Texto libre / Markdown | RF-50 | Sí | Parcial — stub | ⚠️ INCOMPLETO |
| Hasta 10 archivos por sesión | RF-50 | PRD-R01 | No validado en backend | ❌ FALTA |
| Máximo 25 MB por archivo | RF-50 | PRD-R02 | Validación en 50 MB (no 25 MB) | ⚠️ DISCREPANCIA |
| Límite total 100 MB por sesión | — | PRD-R03 | No validado | ❌ FALTA |
| Downscale de imágenes a 2048px | — | PRD-R04 | No implementado | ❌ FALTA |
| Chunking 4000 tokens / 200 overlap | — | PRD-R06 | No implementado | ❌ FALTA |
| Drag & drop de archivos en UI | PRD flujo | — | Mock con botón simulado | ⚠️ INCOMPLETO |

**Hallazgo crítico:** El parsing de documentos es completamente simulado (`[Parsed PDF content from ...]`). No hay integración real con `pdf-parse`, `mammoth`, ni Claude Vision API.

### 2.2 Etapa 2 — Extracción IA

| Funcionalidad | PRD (RF) | Diseño Funcional | Implementado | Estado |
|---|---|---|---|---|
| Extracción de actores | Flujo etapa 2 | Sí (entity: actor) | No — extrae goals, features, personas | ⚠️ DIFERENTE |
| Extracción de flujos | Flujo etapa 2 | Sí (entity: flow) | No | ❌ FALTA |
| Extracción de reglas de negocio | Flujo etapa 2 | Sí (entity: business_rule) | No | ❌ FALTA |
| Páginas APEX implícitas | Flujo etapa 2 | Sí (entity: apex_page) | No | ❌ FALTA |
| Tablas GENESYS relevantes | Flujo etapa 2 | Sí (entity: genesys_table) | No | ❌ FALTA |
| Scoring de confianza por entidad | — | PRD-R09 (0.0–1.0) | No | ❌ FALTA |
| Deduplicación semántica | — | PRD-R08 | No | ❌ FALTA |
| Warning entidades < 0.6 confianza | — | PRD-R10 | No | ❌ FALTA |

**Hallazgo crítico:** La extracción implementada produce un modelo genérico (goals, features, personas, constraints, assumptions, outOfScope) que **no coincide** con las entidades definidas en el PRD y diseño funcional (actors, flows, business_rules, apex_pages, genesys_tables). Esto es una **divergencia fundamental** del dominio APEX/GENESYS al que apunta el producto.

### 2.3 Etapa 3 — Generación Draft

| Funcionalidad | PRD (RF) | Diseño Funcional | Implementado | Estado |
|---|---|---|---|---|
| 10 secciones obligatorias | RF-52 | PRD-R11 | Sí, pero son 12 secciones "standard" diferentes a las 10 del PRD | ⚠️ DISCREPANCIA |
| Generación < 60 seg (5000 palabras) | RF-51 | — | Sin medición ni límite | ❌ FALTA |
| Streaming SSE | RF-51 | PRD-R13 | No — generación síncrona secuencial | ❌ FALTA |
| Edición de secciones | RF-56 | PRD-R12 | ✅ Implementado con versionado | ✅ OK |
| Regeneración individual de sección | — | PRD-R14 | Parcial — regenera todas, no individual | ⚠️ INCOMPLETO |
| Versionado de secciones | — | PRD-R15 | ✅ Implementado | ✅ OK |
| Templates (standard/lean/detailed) | — | No en PRD | ✅ Implementado (valor agregado) | ✅ EXTRA |

**Hallazgo:** Las 10 secciones del PRD son: (1) Contexto, (2) Actores, (3) Flujos, (4) RF, (5) RNF, (6) Modelo de datos, (7) Páginas APEX, (8) Reglas de negocio, (9) Integraciones, (10) Preguntas abiertas. Las 12 del template "standard" implementado son genéricas (Executive Summary, Goals, User Personas, etc.) y **no incluyen secciones específicas de APEX/GENESYS** como "Páginas APEX" o "Modelo de datos GENESYS".

### 2.4 Etapa 4 — Validación

| Funcionalidad | PRD (RF) | Diseño Funcional | Implementado | Estado |
|---|---|---|---|---|
| Checklist con bloqueantes y warnings | RF-53 | VAL-01 a VAL-10 | Parcial — validación genérica por IA | ⚠️ DIFERENTE |
| 10 checks específicos (VAL-01–VAL-10) | — | Sí | No — checks dinámicos generados por IA | ❌ FALTA |
| Preguntas por sección (criterio fallido) | RF-54 | Sí | No — no hay sistema de preguntas | ❌ FALTA |
| Revalidación parcial tras respuesta | RF-55 | PRD-R18 | No | ❌ FALTA |
| Bloqueo de exportación con blockers | RF-53 | PRD-R16 | No validado en `exportPRD()` | ❌ FALTA |
| Score 0–100 | — | Sí | ✅ Implementado | ✅ OK |

**Hallazgo crítico:** El sistema de preguntas de refinamiento es una funcionalidad clave del flujo PRD Builder y **no existe en la implementación**. Tampoco hay un endpoint para responder preguntas (`POST .../questions/:qId/answer`) aunque está definido en el PRD.

### 2.5 Etapa 5 — Exportación

| Funcionalidad | PRD (RF) | Diseño Funcional | Implementado | Estado |
|---|---|---|---|---|
| Export .md con frontmatter YAML | RF-57 | PRD-R19 | Parcial — frontmatter como texto, no YAML real | ⚠️ INCOMPLETO |
| Botón "Enviar a M5" | RF-58 | PRD-R20 | No implementado | ❌ FALTA |
| Habilitado solo sin blockers | RF-58 | PRD-R16 | No validado | ❌ FALTA |
| Descarga directa .md | — | PRD-R21 | ✅ Implementado (blob download) | ✅ OK |
| Formatos adicionales (YAML, JSON) | — | No en PRD | ✅ Implementado (valor agregado) | ✅ EXTRA |
| Trazabilidad fuente → sección | RF-59 | — | No | ❌ FALTA |

### 2.6 API — Endpoints

| Endpoint PRD | Implementado como | Estado |
|---|---|---|
| `POST /api/prd-builder/sessions` | `POST /api/prd/sessions` | ⚠️ Ruta diferente |
| `POST .../sessions/:id/ingest` | `POST .../sessions/:id/sources` | ⚠️ Ruta diferente |
| `POST .../sessions/:id/generate` | `POST .../sessions/:id/generate` | ✅ OK |
| `GET .../sessions/:id/prd` | `GET .../sessions/:id` | ⚠️ Ruta diferente |
| `PATCH .../sections/:sectionId` | `PUT /sections/:id` | ⚠️ Método y ruta diferentes |
| `POST .../sessions/:id/validate` | `POST .../sessions/:id/validate` | ✅ OK |
| `POST .../questions/:qId/answer` | No existe | ❌ FALTA |
| `POST .../sessions/:id/export` | `POST .../sessions/:id/export` | ✅ OK |
| `POST .../sessions/:id/send-to-m5` | No existe | ❌ FALTA |
| — | `POST .../sessions/:id/extract` | ✅ EXTRA (no en PRD) |
| — | `GET .../sessions` (listado) | ✅ EXTRA |

### 2.7 Modelo de Datos

| Tabla PRD | Implementada | Estado |
|---|---|---|
| `prd_sessions` | ✅ Migración 016 | ✅ OK |
| `prd_sources` | ✅ Migración 017 | ✅ OK |
| `prd_sections` | ✅ Migración 018 | ✅ OK |
| `prd_validation_results` | ❌ Sin migración | ❌ FALTA |
| RLS por tenant | Diseñado en FD | No verificable sin DB | ⚠️ PENDIENTE |

### 2.8 Eventos de Dominio

| Evento | Definido en PRD | Implementado | Estado |
|---|---|---|---|
| `PRD_DRAFT_GENERATED` | Sí | No | ❌ FALTA |
| `PRD_APPROVED` | Sí | No | ❌ FALTA |

### 2.9 Criterios de Aceptación

| Criterio | Descripción | Cumplido |
|---|---|---|
| M8-CA1 | Texto 100+ palabras → PRD con 10 secciones en < 60 seg | ❌ No medido, secciones no son las 10 del PRD |
| M8-CA2 | PRD con blockers → bloqueo de exportación | ❌ No hay validación antes de exportar |
| M8-CA3 | Respuesta a pregunta → revalidación con delta | ❌ No hay sistema de preguntas |
| M8-CA4 | PRD aprobado → envío a M5 crea job automático | ❌ No hay integración M5 |

---

## 3. Resumen de Hallazgos

### Estadísticas

| Categoría | Total | ✅ OK | ⚠️ Parcial/Discrepancia | ❌ Falta |
|---|---|---|---|---|
| Funcionalidades de negocio | 42 | 7 (17%) | 11 (26%) | 24 (57%) |
| Endpoints API | 11 | 3 (27%) | 4 (36%) | 4 (36%) |
| Criterios de aceptación | 4 | 0 (0%) | 0 (0%) | 4 (100%) |

### Brechas Críticas (Bloquean el lanzamiento)

1. **Parsing de documentos simulado** — No hay integración real con parsers de PDF, DOCX ni Claude Vision para imágenes.
2. **Modelo de extracción no alineado con el dominio APEX/GENESYS** — Extrae entidades genéricas en lugar de actores, flujos, reglas de negocio, páginas APEX y tablas GENESYS.
3. **Las 10 secciones del PRD no coinciden** — El template "standard" genera 12 secciones genéricas en lugar de las 10 secciones específicas del dominio definidas en el PRD.
4. **Sin streaming SSE** — La generación es síncrona y secuencial, lo cual bloquea la UX para documentos grandes.
5. **Sin sistema de preguntas de refinamiento** — Funcionalidad clave del flujo iterativo de validación que no existe.
6. **Sin integración con M5** — El endpoint "Enviar a M5" no existe y no se emiten los eventos de dominio `PRD_DRAFT_GENERATED` ni `PRD_APPROVED`.
7. **Sin bloqueo de exportación por blockers** — Se puede exportar un PRD incluso con validaciones bloqueantes sin resolver.

### Brechas Menores (No bloquean, pero deben resolverse)

1. **Rutas de API no alineadas** — `/api/prd/` vs `/api/prd-builder/` definido en el PRD.
2. **Límite de archivo en 50 MB** en vez de 25 MB como dice el PRD.
3. **No hay validación de cantidad máxima de archivos** (10) ni tamaño total de sesión (100 MB).
4. **Tabla `prd_validation_results`** no tiene migración.
5. **Soporte de imágenes (PNG/JPG/WEBP)** no incluido en el schema de validación `UploadSourceSchema`.
6. **Regeneración individual de secciones** no implementada (solo regenera todas).
7. **Trazabilidad fuente → sección** (RF-59, SHOULD) no implementada.

### Valor Agregado (No en PRD pero implementado)

1. Templates de secciones configurables (standard/lean/detailed) con opción de secciones custom.
2. Exportación en múltiples formatos (Markdown, YAML, JSON).
3. Endpoint de listado de sesiones con paginación y filtros.
4. Endpoint separado de extracción de requerimientos.

---

## 4. Recomendaciones de Priorización

**Prioridad 1 — Sprint S5 (Bloqueantes):**
- Implementar parsing real de PDF y DOCX (pdf-parse + mammoth)
- Alinear modelo de extracción al dominio APEX/GENESYS
- Alinear las 10 secciones obligatorias del PRD
- Implementar bloqueo de exportación si hay blockers sin resolver
- Implementar los 10 checks de validación (VAL-01 a VAL-10)

**Prioridad 2 — Sprint S5 (Importantes):**
- Implementar streaming SSE para generación
- Agregar soporte de imágenes (Claude Vision API)
- Implementar sistema de preguntas de refinamiento
- Alinear rutas de API al estándar `/api/prd-builder/`

**Prioridad 3 — Sprint S6:**
- Integración con M5 (endpoint send-to-m5 + eventos de dominio)
- Exportación .md con YAML frontmatter real
- Trazabilidad fuente → sección (RF-59)
- Migración para tabla `prd_validation_results`
