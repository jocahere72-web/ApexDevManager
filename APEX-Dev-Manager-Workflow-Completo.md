# APEX Dev Manager — Flujo Completo de Requerimientos

**Fecha:** 2026-04-13  
**Autor:** JC — Product Lead  
**Estado:** Diseño de flujo  
**Versión:** 1.0

---

## 1. Resumen Ejecutivo

Este documento define el flujo completo que sigue un requerimiento desde su creación hasta su entrega a producción. El flujo involucra 6 roles, 10 estados, validación automática por IA, múltiples gates de aprobación con devolución, y asignación explícita de responsables.

El Issue es el eje central. Todo artefacto (PRD, diseño, código, tests, docs) se genera y vive dentro del contexto de un issue.

---

## 2. Roles del Sistema

| # | Rol | Código en BD | Responsabilidad Principal | Existe Hoy |
|---|-----|-------------|--------------------------|------------|
| 1 | **Líder Operativo** | `ops_lead` | Crea requerimientos de clientes, aprueba PRDs, valida entregables | NO — agregar |
| 2 | **Jefe de Desarrollo** | `tech_lead` | Revisa requerimientos, asigna desarrolladores, aprueba PRDs y diseños | SÍ |
| 3 | **Desarrollador** | `developer` | Ejecuta el pipeline: PRD, análisis, diseño, construcción | SÍ |
| 4 | **QA / Tester** | `qa_analyst` | Programa y ejecuta pruebas, valida resultados | SÍ |
| 5 | **DBA** | `dba` | Aprueba cambios de base de datos (migraciones, tablas, índices) | NO — agregar |
| 6 | **Admin** | `admin` | Gestión del sistema, configuración, usuarios | SÍ |

### Relación con roles existentes

Los roles `release_manager`, `knowledge_editor`, `marketplace_publisher`, `devops_engineer` y `auditor` se mantienen para sus funciones actuales. Se agregan `ops_lead` y `dba` al array de roles en `packages/shared-types/src/auth.ts`.

---

## 3. Estados del Issue (Ampliados)

El flujo actual tiene 8 estados. Se amplía a 10 para capturar las gates de validación y aprobación:

| # | Estado | Label | Quién lo maneja | Descripción |
|---|--------|-------|-----------------|-------------|
| 1 | `draft` | Borrador | Líder Operativo | Issue creado pero aún no enviado a validación |
| 2 | `validation` | Validación IA | Sistema (IA) | Validación automática de completitud y calidad |
| 3 | `intake` | Recepción | Jefe de Desarrollo | Revisión del jefe: aceptar y asignar, o devolver |
| 4 | `prd` | PRD | Desarrollador | Generación y edición del PRD |
| 5 | `prd_approval` | Aprobación PRD | Líder Op. + Jefe Dev. | Doble aprobación del PRD |
| 6 | `design` | Análisis y Diseño | Desarrollador + DBA | Análisis de impacto, diseño APEX y BD |
| 7 | `build` | Construcción | Desarrollador | Generación de cambios APEX y BD |
| 8 | `test` | Pruebas | QA / Tester | Ejecución de pruebas, validación |
| 9 | `docs` | Documentación | Desarrollador | Generación de documentación final |
| 10 | `done` | Entregado | — | Listo para implementar en producción |

### Transiciones Válidas

```
draft → validation                    (Líder Op. envía a validar)
validation → draft                    (IA devuelve con observaciones)
validation → intake                   (IA aprueba, pasa a revisión)
intake → draft                        (Jefe Dev. devuelve con anotaciones)
intake → prd                          (Jefe Dev. acepta y asigna desarrollador)
prd → prd_approval                    (Desarrollador envía PRD a aprobación)
prd_approval → prd                    (Aprobadores devuelven con cambios)
prd_approval → design                 (Ambos aprobadores aceptan)
design → build                        (Diseño aprobado, DBA aprueba BD)
design → prd_approval                 (Diseño devuelto, requiere ajuste de PRD)
build → test                          (Construcción completada)
build → design                        (Falla build, vuelve a diseño)
test → build                          (Tests fallan, vuelve a construcción)
test → docs                           (Tests pasan)
docs → done                           (Documentación aprobada, entregado)
docs → test                           (Revisión revela problemas, vuelve a tests)
```

---

## 4. Diagrama de Flujo Completo

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                        FLUJO COMPLETO DE UN REQUERIMIENTO                       │
└─────────────────────────────────────────────────────────────────────────────────┘

  LÍDER OPERATIVO                  SISTEMA (IA)              JEFE DE DESARROLLO
  ─────────────────               ──────────────             ──────────────────
        │                              │                            │
        ▼                              │                            │
  ┌───────────┐                        │                            │
  │  Crear    │                        │                            │
  │  Requeri- │                        │                            │
  │  miento   │                        │                            │
  │  [draft]  │                        │                            │
  └─────┬─────┘                        │                            │
        │ enviar                       │                            │
        ▼                              ▼                            │
        │                  ┌──────────────────────┐                 │
        │                  │  Validación IA       │                 │
        │                  │  [validation]        │                 │
        │                  │                      │                 │
        │                  │  - Completitud       │                 │
        │                  │  - Claridad          │                 │
        │                  │  - Viabilidad        │                 │
        │                  │  - Criterios aceptac.│                 │
        │                  └──────┬───────────────┘                 │
        │                  ┌──────┴───────┐                         │
        │              ¿Aprobado?     Devolver                      │
        │                  │          con notas                     │
        │                  │              │                          │
        │                  │    ┌─────────▼─────────┐               │
        │                  │    │  Vuelve a [draft]  │               │
        │◄─────────────────│────│  Líder Op. corrige │               │
        │                  │    └────────────────────┘               │
        │                  ▼                                        │
        │              Pasa a                                       │
        │              intake                                       │
        │                  │                                        ▼
        │                  │                          ┌──────────────────────┐
        │                  └─────────────────────────►│  Revisión            │
        │                                             │  [intake]            │
        │                                             │                      │
        │                                             │  - Revisa req.       │
        │                                             │  - Valida alcance    │
        │                                             │  - Decide:           │
        │                                             └──────┬───────────────┘
        │                                             ┌──────┴───────┐
        │                                         Aceptar       Devolver
        │                                         + Asignar    con anotaciones
        │                                             │              │
        │                     ┌────────────────────┐  │    ┌─────────▼─────────┐
        │                     │ Asigna desarrollador│◄─┘    │  Vuelve a [draft]  │
        │◄────────────────────│ y mueve a [prd]    │        │  Con comentarios   │
        │                     └────────┬───────────┘        └────────────────────┘
        │                              │
        │                              ▼
        │                    DESARROLLADOR
        │                    ──────────────
        │                              │
        │                    ┌─────────▼──────────┐
        │                    │  Mi Panel           │
        │                    │  (Issues asignados) │
        │                    └─────────┬──────────┘
        │                              │ selecciona issue
        │                              ▼
        │                    ┌─────────────────────┐
        │                    │  Revisar Requerim.   │
        │                    │  [prd]               │
        │                    │                      │
        │                    │  - Ver detalle issue  │
        │                    │  - Adjuntar info      │
        │                    │  - Generar PRD (IA)   │
        │                    │  - Editar secciones   │
        │                    │  - Validar PRD        │
        │                    └─────────┬──────────┘
        │                              │ enviar a aprobación
        │                              ▼
  ┌─────▼─────────────────────────────────────────────┐
  │  Aprobación del PRD [prd_approval]                │
  │                                                    │
  │  Requiere aprobación de AMBOS:                    │
  │  ☐ Líder Operativo (validar que refleja el req.)  │
  │  ☐ Jefe de Desarrollo (validar viabilidad técn.)  │
  │                                                    │
  │  Cualquiera puede devolver con comentarios → [prd]│
  └───────────────────────┬────────────────────────────┘
                          │ ambos aprueban
                          ▼
                ┌─────────────────────┐
                │  Análisis y Diseño   │
                │  [design]            │
                │                      │
                │  DESARROLLADOR:      │
                │  - Análisis impacto  │
                │  - Diseño APEX       │
                │  - Diseño BD         │
                │  - Modificar diseño  │
                │                      │
                │  DBA:                │
                │  - Aprueba cambios   │
                │    de BD             │
                └─────────┬──────────┘
                          │ diseño + BD aprobados
                          ▼
                ┌─────────────────────┐
                │  Construcción        │
                │  [build]             │
                │                      │
                │  - Genera cambios    │
                │    APEX              │
                │  - Genera cambios    │
                │    BD                │
                │  - Muestra log       │
                │  - Verifica build    │
                └─────────┬──────────┘
                          │ build exitoso
                          ▼
                ┌─────────────────────┐         ┌──────────────┐
                │  Pruebas             │         │  QA / TESTER │
                │  [test]              │◄────────│              │
                │                      │         └──────────────┘
                │  - Programar tests   │
                │  - Ejecutar suite    │
                │  - Validar resultados│
                └─────────┬──────────┘
                    ┌─────┴──────┐
                 Pasan       Fallan
                    │            │
                    │    ┌───────▼───────┐
                    │    │ Vuelve a       │
                    │    │ [build]        │
                    │    │ para corrección│
                    │    └───────────────┘
                    ▼
                ┌─────────────────────┐
                │  Documentación       │
                │  [docs]              │
                │                      │
                │  - Genera docs       │
                │  - Release notes     │
                │  - Changelog         │
                │  - Guía rollback     │
                └─────────┬──────────┘
                          │
                          ▼
                ┌─────────────────────┐
                │  ✓ DONE             │
                │  [done]             │
                │                      │
                │  Listo para          │
                │  implementar en      │
                │  producción          │
                └─────────────────────┘
```

---

## 5. Detalle por Etapa

### 5.1 Etapa 1 — Creación del Requerimiento [draft]

**Actor:** Líder Operativo

**Pantalla:** Formulario de nuevo requerimiento

**Acciones:**
- Seleccionar cliente
- Seleccionar aplicación APEX (si aplica)
- Escribir título y descripción del requerimiento
- Indicar prioridad y tipo (feature, bug, enhancement, task)
- Adjuntar documentos (.docx, .pdf, imágenes)
- Agregar tags de contexto
- Enviar a validación

**Campos requeridos:** cliente, título, descripción (min. 100 caracteres), prioridad, tipo

**Datos que se persisten:**
- Issue creado con status `draft`
- `requestedBy` = ID del Líder Operativo
- Documentos adjuntos en `requirementDocuments[]`

---

### 5.2 Etapa 2 — Validación IA [validation]

**Actor:** Sistema (automático)

**Trigger:** Líder Operativo envía el requerimiento

**Validaciones del agente IA:**

| # | Criterio | Tipo | Detalle |
|---|----------|------|---------|
| V1 | Completitud | Bloqueante | ¿Tiene qué, por qué y para quién? |
| V2 | Claridad | Bloqueante | ¿La descripción es comprensible y no ambigua? |
| V3 | Alcance definido | Advertencia | ¿Se puede determinar el alcance del cambio? |
| V4 | Criterios de aceptación | Bloqueante | ¿Tiene al menos 1 criterio de aceptación o comportamiento esperado? |
| V5 | Viabilidad técnica | Advertencia | ¿Referencia componentes que existen en el sistema? |
| V6 | Sin duplicados | Advertencia | ¿Existe un issue similar ya registrado? |
| V7 | Documentación soporte | Advertencia | ¿Los archivos adjuntos son legibles y relevantes? |

**Resultado:**
- **Score >= 70 y 0 bloqueantes** → Pasa automáticamente a `intake`
- **Score < 70 o bloqueantes** → Vuelve a `draft` con observaciones detalladas por criterio

**Datos que se persisten:**
- Score de validación IA en campo `ai_validation_score` (nuevo)
- Observaciones en `ai_validation_notes` (JSONB, nuevo)
- Historial de validaciones (para ver mejoras entre intentos)

---

### 5.3 Etapa 3 — Revisión del Jefe de Desarrollo [intake]

**Actor:** Jefe de Desarrollo (tech_lead)

**Pantalla:** Bandeja de requerimientos pendientes de revisión

**Ve:**
- Detalle del requerimiento (título, descripción, documentos)
- Score y observaciones de la validación IA
- Info del cliente y aplicación
- Historial de devoluciones previas (si las hay)

**Acciones posibles:**

| Acción | Efecto |
|--------|--------|
| **Aceptar y asignar** | Selecciona un desarrollador de la lista → Issue pasa a `prd` con `assignedTo` actualizado |
| **Devolver con anotaciones** | Escribe comentarios → Issue vuelve a `draft` → Líder Operativo ve las anotaciones |

**Reglas:**
- Solo usuarios con rol `tech_lead` o `admin` pueden revisar
- La asignación es obligatoria para avanzar — no puede pasar a `prd` sin `assignedTo`
- Las anotaciones de devolución se guardan como comentarios del issue con tipo `review_return`

---

### 5.4 Etapa 4 — Generación del PRD [prd]

**Actor:** Desarrollador asignado

**Pantalla:** Panel del desarrollador → selecciona issue asignado → workspace PRD

**Sub-pasos:**

#### 4a. Revisión del requerimiento
- Ve la información completa del issue (descripción, docs, score IA, comentarios del jefe)
- Puede adjuntar información adicional (documentos técnicos, capturas, notas)

#### 4b. Generación del PRD
- Presiona "Generar PRD"
- El sistema usa el Issue Profile + documentos como contexto
- Genera PRD estructurado con las secciones del documento de referencia
- Streaming SSE con progreso

#### 4c. Edición del PRD
- Vista acordeón con secciones colapsables
- Editor inline por sección
- Botón "Regenerar" por sección individual
- Validación automática con score y checklist

#### 4d. Enviar a aprobación
- Requiere score >= umbral (default 70) y 0 blockers
- Al enviar → Issue pasa a `prd_approval`
- Se notifica al Líder Operativo y al Jefe de Desarrollo

**Datos que se persisten:**
- PRD session vinculada al issue (`prdSessionId`)
- Secciones del PRD con versionado
- Sources adicionales subidas por el desarrollador

---

### 5.5 Etapa 5 — Aprobación del PRD [prd_approval]

**Actores:** Líder Operativo + Jefe de Desarrollo (ambos obligatorios)

**Pantalla:** Vista de lectura del PRD con controles de aprobación

**Modelo de aprobación dual:**

```
┌─────────────────────────────────────────────┐
│  PRD: ADM-215 — Sistema de Notificaciones   │
├─────────────────────────────────────────────┤
│                                             │
│  [Secciones del PRD en modo lectura]        │
│                                             │
├─────────────────────────────────────────────┤
│  APROBACIONES                               │
│                                             │
│  Líder Operativo (María García):            │
│  ☐ Pendiente / ✓ Aprobado / ✗ Devuelto     │
│                                             │
│  Jefe de Desarrollo (Carlos López):         │
│  ☐ Pendiente / ✓ Aprobado / ✗ Devuelto     │
│                                             │
│  [Aprobar]  [Devolver con comentarios]      │
└─────────────────────────────────────────────┘
```

**Reglas:**
- Cada aprobador ve el PRD completo y el requerimiento original
- Pueden agregar comentarios por sección
- Si **cualquiera** devuelve → Issue vuelve a `prd` con los comentarios
- Solo cuando **ambos** aprueban → Issue avanza a `design`
- Se registra quién aprobó, cuándo, y con qué comentarios

**Datos que se persisten:**
- Tabla nueva `issue_approvals` con: `issueId`, `stage`, `approverUserId`, `approverRole`, `decision` (approved/returned), `comments`, `decidedAt`

---

### 5.6 Etapa 6 — Análisis de Impacto y Diseño [design]

**Actor principal:** Desarrollador asignado  
**Actor secundario:** DBA (aprueba cambios de BD)

**Pantalla:** Workspace de diseño dividido en paneles

**Sub-pasos:**

#### 6a. Análisis de impacto (automático)
- El sistema cruza el PRD aprobado contra el codebase
- Genera grafo de dependencias (módulos, tablas, endpoints afectados)
- Clasifica impacto: NEW vs MODIFIED
- Evalúa riesgo por componente (LOW/MEDIUM/HIGH)

#### 6b. Diseño APEX
- Descripción detallada de cambios en páginas APEX
- Nuevas páginas, regiones, items, procesos, validaciones
- Mockups o wireframes si aplica
- El desarrollador puede modificar lo generado

#### 6c. Diseño Base de Datos
- Nuevas tablas, columnas, índices, constraints
- Migraciones propuestas
- Impacto en datos existentes
- **Requiere aprobación del DBA** antes de avanzar

#### 6d. Blueprint de implementación
- Lista ordenada de work items
- Secuencia de ejecución respetando dependencias
- Estimación de esfuerzo

**Gate de avance:**
- Desarrollador aprueba el diseño general
- DBA aprueba los cambios de base de datos
- Ambas aprobaciones requeridas para avanzar a `build`

---

### 5.7 Etapa 7 — Construcción [build]

**Actor:** Desarrollador asignado

**Pantalla:** Workspace de construcción con log en tiempo real

**Sub-pasos:**

#### 7a. Generación de cambios
- El sistema ejecuta el blueprint aprobado
- Genera migraciones de BD (archivos TypeScript numerados)
- Genera/modifica servicios backend (controller + service + validation)
- Genera/modifica componentes frontend
- Genera cambios APEX (scripts SQL, page exports)

#### 7b. Log de ejecución
- Vista en tiempo real del progreso (SSE streaming)
- Por cada artefacto: estado (generando → generado → verificado)
- Errores de compilación mostrados inline

#### 7c. Revisión de cambios
- Diff view por archivo (antes/después)
- El desarrollador puede aceptar, rechazar o solicitar regeneración por archivo
- Verificación de build completa (compilación del monorepo)

**Gate de avance:**
- Todos los artefactos aprobados
- Build exitoso (0 errores de compilación)
- Si falla build → puede corregir y reintentar o devolver a `design`

---

### 5.8 Etapa 8 — Pruebas [test]

**Actor:** QA / Tester (o el desarrollador si no hay QA asignado)

**Pantalla:** Suite de pruebas con resultados en tiempo real

**Sub-pasos:**

#### 8a. Programación de pruebas
- El sistema genera tests automáticos desde los criterios de aceptación del PRD
- Tests unitarios para servicios y validaciones
- Tests de integración para endpoints
- El tester puede agregar tests manuales adicionales

#### 8b. Ejecución
- Ejecuta suite completa: tests generados + regresión de módulos afectados
- Resultados en tiempo real con mapeo de trazabilidad (RF → CA → Test → Resultado)

#### 8c. Evaluación de resultados

| Resultado | Acción |
|-----------|--------|
| Todos pasan | Avanza a `docs` |
| Hay fallos corregibles | Auto-corrección (max 3 intentos) → re-ejecución |
| Fallos requieren cambios | Vuelve a `build` para correcciones |
| Fallos requieren rediseño | Vuelve a `design` (caso extremo) |

**Gate de avance:**
- 100% de tests pasan (o el QA acepta los fallos como conocidos)
- Cobertura mínima cumplida
- QA aprueba resultados

---

### 5.9 Etapa 9 — Documentación [docs]

**Actor:** Desarrollador asignado

**Pantalla:** Panel de documentación con preview

**Documentos generados automáticamente:**

| Documento | Contenido |
|-----------|-----------|
| **PRD actualizado** | El PRD de referencia se actualiza con los nuevos RFs implementados |
| **Changelog** | Tipo de cambio, descripción, RFs implementados, breaking changes |
| **Release notes** | Qué se construyó, qué resuelve, instrucciones de migración |
| **Guía de rollback** | Pasos para revertir cada artefacto (migraciones down, código) |
| **Documentación API** | OpenAPI 3.0 para endpoints nuevos/modificados |

El desarrollador revisa, puede editar, y aprueba cada documento.

**Gate de avance:**
- Todos los documentos aprobados
- Issue pasa a `done`

---

### 5.10 Etapa 10 — Entregado [done]

**Actor:** Ninguno (estado terminal)

**Pantalla:** Resumen ejecutivo del issue

**Contiene:**
- Timeline completo: cuánto tiempo pasó en cada etapa, quién hizo qué
- Todos los artefactos generados (PRD, diseño, código, tests, docs)
- Métricas: tiempo total, devoluciones, re-trabajos, score del PRD
- Link a los archivos generados para implementar en producción

---

## 6. Permisos por Rol y Etapa

| Etapa | ops_lead | tech_lead | developer | qa_analyst | dba | admin |
|-------|----------|-----------|-----------|------------|-----|-------|
| **draft** (crear) | ✓ escribir | — | — | — | — | ✓ escribir |
| **draft** (editar) | ✓ autor | — | — | — | — | ✓ |
| **validation** | solo ver | solo ver | — | — | — | ✓ |
| **intake** (revisar) | solo ver | ✓ decidir | — | — | — | ✓ |
| **prd** (generar) | solo ver | solo ver | ✓ asignado | — | — | ✓ |
| **prd_approval** | ✓ aprobar | ✓ aprobar | solo ver | — | — | ✓ |
| **design** | solo ver | solo ver | ✓ asignado | — | ✓ aprobar BD | ✓ |
| **build** | — | solo ver | ✓ asignado | — | — | ✓ |
| **test** | — | solo ver | ✓ (si no hay QA) | ✓ ejecutar | — | ✓ |
| **docs** | solo ver | solo ver | ✓ asignado | — | — | ✓ |
| **done** | ✓ ver | ✓ ver | ✓ ver | ✓ ver | ✓ ver | ✓ ver |

---

## 7. Vistas por Rol (Pantallas)

### 7.1 Líder Operativo — Mi Panel

```
┌──────────────────────────────────────────────────────────┐
│  Mis Requerimientos                          [+ Nuevo]   │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  PENDIENTES DE MI ACCIÓN                                 │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-218  Módulo de reportes        [prd_approval]  │  │
│  │          ⚠ Esperando tu aprobación del PRD        │  │
│  ├────────────────────────────────────────────────────┤  │
│  │ ADM-220  Integración SAP           [draft]         │  │
│  │          ⚠ Devuelto por IA: falta criterio accept.│  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  EN PROGRESO                                             │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-215  Notificaciones            [build]         │  │
│  │          Asignado a: Juan Pérez                    │  │
│  ├────────────────────────────────────────────────────┤  │
│  │ ADM-210  Dashboard cliente         [test]          │  │
│  │          Asignado a: Ana Gómez                     │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  COMPLETADOS (últimos 30 días)                           │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-198  Login MFA                 [done] ✓        │  │
│  └────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────┘
```

### 7.2 Jefe de Desarrollo — Mi Panel

```
┌──────────────────────────────────────────────────────────┐
│  Panel de Desarrollo                                     │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  PENDIENTES DE MI ACCIÓN                                 │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-222  API de pagos              [intake]        │  │
│  │          ⚠ Revisar y asignar                      │  │
│  ├────────────────────────────────────────────────────┤  │
│  │ ADM-218  Módulo de reportes        [prd_approval]  │  │
│  │          ⚠ Esperando tu aprobación del PRD        │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  PIPELINE DEL EQUIPO (Kanban)                            │
│  ┌──────┬──────┬──────┬──────┬──────┬──────┬──────┐     │
│  │draft │valid.│intake│ prd  │design│build │ test │     │
│  │  3   │  1   │  2   │  4   │  2   │  1   │  1   │     │
│  └──────┴──────┴──────┴──────┴──────┴──────┴──────┘     │
│                                                          │
│  EQUIPO                                                  │
│  Juan Pérez (dev)    — 3 issues activos                  │
│  Ana Gómez (dev)     — 2 issues activos                  │
│  Pedro Ruiz (qa)     — 1 issue en test                   │
└──────────────────────────────────────────────────────────┘
```

### 7.3 Desarrollador — Mi Panel

```
┌──────────────────────────────────────────────────────────┐
│  Mis Issues Asignados                                    │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  REQUIEREN MI ACCIÓN                                     │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-215  Notificaciones            [prd]           │  │
│  │          ▶ Generar PRD                             │  │
│  ├────────────────────────────────────────────────────┤  │
│  │ ADM-210  Dashboard cliente         [build]         │  │
│  │          ▶ Revisar artefactos generados            │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  EN ESPERA (esperando aprobación de otros)               │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-218  Módulo de reportes        [prd_approval]  │  │
│  │          Esperando: Líder Op. ☐  Jefe Dev. ☐      │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  COMPLETADOS (últimos 30 días)                           │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-198  Login MFA                 [done] ✓        │  │
│  └────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────┘
```

### 7.4 QA / Tester — Mi Panel

```
┌──────────────────────────────────────────────────────────┐
│  Pruebas Pendientes                                      │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  LISTOS PARA PRUEBAS                                     │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-210  Dashboard cliente         [test]          │  │
│  │          12 tests generados, 0 ejecutados          │  │
│  │          [Ejecutar Suite]                          │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  EN EJECUCIÓN                                            │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-205  API clientes              [test]          │  │
│  │          8/15 tests ejecutados ████░░░ 53%         │  │
│  └────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────┘
```

### 7.5 DBA — Mi Panel

```
┌──────────────────────────────────────────────────────────┐
│  Cambios de BD Pendientes                                │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  PENDIENTES DE APROBACIÓN                                │
│  ┌────────────────────────────────────────────────────┐  │
│  │ ADM-215  Notificaciones            [design]        │  │
│  │          2 tablas nuevas, 1 tabla modificada        │  │
│  │          3 índices, 2 FKs                          │  │
│  │          [Ver Diseño BD]  [Aprobar]  [Rechazar]    │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  HISTORIAL                                               │
│  ADM-210  Dashboard — ✓ Aprobado 2026-04-10              │
│  ADM-198  Login MFA — ✓ Aprobado 2026-04-05              │
└──────────────────────────────────────────────────────────┘
```

---

## 8. Modelo de Datos — Cambios Necesarios

### 8.1 Tabla `users` — Nuevos Roles

Agregar a la definición de roles en `shared-types/src/auth.ts`:

```typescript
export type UserRole =
  | 'admin'
  | 'ops_lead'       // NUEVO
  | 'tech_lead'
  | 'developer'
  | 'qa_analyst'
  | 'dba'            // NUEVO
  | 'release_manager'
  | 'knowledge_editor'
  | 'marketplace_publisher'
  | 'devops_engineer'
  | 'auditor';
```

### 8.2 Tabla `issues` — Columnas Nuevas

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `ai_validation_score` | INTEGER NULL | Score de validación IA (0-100) |
| `ai_validation_notes` | JSONB NULL | Observaciones detalladas de la IA por criterio |
| `ai_validated_at` | TIMESTAMPTZ NULL | Fecha de última validación IA |
| `returned_reason` | TEXT NULL | Razón de devolución (intake → draft) |
| `returned_by` | UUID NULL FK users | Quién devolvió |
| `returned_at` | TIMESTAMPTZ NULL | Cuándo se devolvió |

### 8.3 Tabla `issue_statuses` — Actualizar CHECK

Ampliar el CHECK de status para incluir los nuevos estados:

```sql
ALTER TABLE issues DROP CONSTRAINT issues_status_check;
ALTER TABLE issues ADD CONSTRAINT issues_status_check
  CHECK (status IN ('draft', 'validation', 'intake', 'prd', 'prd_approval', 'design', 'build', 'test', 'docs', 'done'));
```

### 8.4 Tabla NUEVA: `issue_approvals`

| Campo | Tipo | Nullable | Descripción |
|-------|------|----------|-------------|
| `id` | UUID PK | NOT NULL | Identificador único |
| `tenant_id` | UUID FK | NOT NULL | Tenant (RLS) |
| `issue_id` | UUID FK issues | NOT NULL | Issue que se aprueba |
| `stage` | VARCHAR(20) | NOT NULL | Etapa de aprobación (prd_approval, design) |
| `approver_user_id` | UUID FK users | NOT NULL | Quién decide |
| `approver_role` | VARCHAR(30) | NOT NULL | Rol del aprobador |
| `decision` | VARCHAR(10) | NOT NULL | CHECK (pending, approved, returned) |
| `comments` | TEXT | NULL | Comentarios de aprobación/devolución |
| `decided_at` | TIMESTAMPTZ | NULL | Fecha de decisión |
| `created_at` | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (issue_id, stage), (issue_id, stage, approver_role) UNIQUE
RLS: tenant_id = current_setting('app.tenant_id')

### 8.5 Tabla NUEVA: `issue_return_history`

| Campo | Tipo | Nullable | Descripción |
|-------|------|----------|-------------|
| `id` | UUID PK | NOT NULL | Identificador único |
| `tenant_id` | UUID FK | NOT NULL | Tenant (RLS) |
| `issue_id` | UUID FK issues | NOT NULL | Issue devuelto |
| `from_stage` | VARCHAR(20) | NOT NULL | Etapa desde la que se devuelve |
| `to_stage` | VARCHAR(20) | NOT NULL | Etapa a la que regresa |
| `returned_by` | UUID FK users | NOT NULL | Quién devolvió |
| `reason` | TEXT | NOT NULL | Razón de la devolución |
| `annotations` | JSONB | NULL | Anotaciones por sección (para PRD) |
| `created_at` | TIMESTAMPTZ | NOT NULL | DEFAULT NOW() |

Indexes: (issue_id), (issue_id, from_stage)
RLS: tenant_id = current_setting('app.tenant_id')

---

## 9. Notificaciones

| Evento | Destinatario | Mensaje |
|--------|-------------|---------|
| Issue validado por IA (aprobado) | Jefe de Desarrollo | "Nuevo requerimiento ADM-XXX listo para revisión" |
| Issue devuelto por IA | Líder Operativo | "ADM-XXX requiere correcciones: [resumen]" |
| Issue devuelto por Jefe Dev. | Líder Operativo | "ADM-XXX devuelto por [nombre]: [motivo]" |
| Issue asignado | Desarrollador | "Se te asignó ADM-XXX: [título]" |
| PRD enviado a aprobación | Líder Op. + Jefe Dev. | "PRD de ADM-XXX listo para aprobación" |
| PRD devuelto | Desarrollador | "PRD de ADM-XXX devuelto por [nombre]: [motivo]" |
| PRD aprobado por ambos | Desarrollador | "PRD de ADM-XXX aprobado — puedes iniciar diseño" |
| Diseño BD pendiente | DBA | "Cambios de BD en ADM-XXX pendientes de aprobación" |
| BD aprobada | Desarrollador | "Cambios BD de ADM-XXX aprobados por DBA" |
| Build completado | Desarrollador + QA | "Build de ADM-XXX completado — listo para pruebas" |
| Tests fallidos | Desarrollador | "ADM-XXX: [N] tests fallaron — requiere corrección" |
| Tests pasaron | Desarrollador | "ADM-XXX: todos los tests pasaron — continuar a docs" |
| Issue completado | Líder Op. + Jefe Dev. | "ADM-XXX completado — listo para producción" |

---

## 10. Reglas de Negocio Clave

| # | Regla | Enforcement |
|---|-------|-------------|
| RN-01 | Un issue solo puede avanzar siguiendo las transiciones válidas definidas en §3 | Backend: `transitionIssue()` valida transición |
| RN-02 | Solo el autor del issue (`requestedBy`) puede editarlo en `draft` | Backend: middleware de ownership |
| RN-03 | La validación IA es automática y no se puede saltar | Backend: transición `draft → intake` pasa por validación |
| RN-04 | Un issue no puede pasar a `prd` sin `assignedTo` | Backend: CHECK en transición |
| RN-05 | Solo el desarrollador asignado puede trabajar en etapas prd/design/build/docs | Backend: middleware `assignedTo === currentUser` |
| RN-06 | La aprobación del PRD requiere ambos: `ops_lead` (o autor) Y `tech_lead` | Backend: contar approvals por stage |
| RN-07 | Si cualquier aprobador devuelve el PRD, se invalidan aprobaciones previas | Backend: reset approvals al devolver |
| RN-08 | Los cambios de BD en `design` requieren aprobación de un usuario con rol `dba` | Backend: flag `db_approved` en design |
| RN-09 | Un issue puede ser devuelto a una etapa anterior pero no puede saltar etapas hacia adelante | Backend: validación de transiciones |
| RN-10 | Cada devolución genera un registro en `issue_return_history` para trazabilidad | Backend: trigger en transición de retorno |
| RN-11 | Un issue en `done` no puede volver a ninguna etapa anterior | Backend: transiciones terminales |
| RN-12 | Las métricas de tiempo por etapa se calculan desde las transiciones | Computed: diff entre timestamps de transiciones |

---

## 11. Impacto en el Sistema Actual

### Lo que CAMBIA

| Componente | Cambio |
|-----------|--------|
| `IssueStatus` type | De 8 a 10 estados (agregar `draft`, `validation`, `prd_approval`, `docs`; remover o renombrar `review`, `deploy`) |
| `transitionIssue()` backend | Nueva lógica de transiciones con validación de permisos por rol |
| `issues.service.ts` | Agregar lógica de validación IA, asignación, aprobaciones |
| Frontend: sidebar | Panel por rol reemplaza el sidebar genérico |
| Frontend: issue workspace | Stepper de 10 etapas con UI adaptativa por rol |
| `shared-types/auth.ts` | Agregar `ops_lead` y `dba` a `UserRole` |
| Process params | Configurar `ApprovalRules` para `prd_approval` y `design` |

### Lo que NO cambia

| Componente | Razón |
|-----------|-------|
| Backend modules (28) | Los endpoints se mantienen, solo cambia quién los llama |
| Multi-tenancy + RLS | Sin cambios |
| PRD Builder (ya rehecho) | Se integra tal cual en la etapa `prd` |
| API clients (24) | Sin cambios |
| Autenticación JWT | Sin cambios, solo se agregan roles |

---

## 12. Resumen de Entregables Técnicos

| # | Entregable | Tipo |
|---|-----------|------|
| 1 | Migración: nuevos estados en `issues`, columnas nuevas | SQL migration |
| 2 | Migración: tabla `issue_approvals` | SQL migration |
| 3 | Migración: tabla `issue_return_history` | SQL migration |
| 4 | Agregar roles `ops_lead`, `dba` a shared-types | TypeScript |
| 5 | Servicio de validación IA para requerimientos | Backend service |
| 6 | Lógica de aprobación dual (PRD) | Backend service |
| 7 | Lógica de aprobación DBA (design) | Backend service |
| 8 | Transiciones ampliadas con validación de permisos | Backend service |
| 9 | Panel por rol (5 vistas) | Frontend components |
| 10 | Issue workspace con stepper de 10 etapas | Frontend component |
| 11 | Notificaciones por evento | Backend + frontend |
| 12 | Vista de aprobación PRD (doble aprobador) | Frontend component |
