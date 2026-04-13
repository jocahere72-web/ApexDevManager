# APEX Dev Manager — Reestructuración UX: De Módulos a Pipeline

**Fecha:** 2026-04-13
**Autor:** JC — Product Lead
**Estado:** Propuesta de diseño

---

## 1. El Problema

La aplicación tiene 21 features en el sidebar, cada una como página independiente. El usuario (analista/developer) debe saber qué módulo abrir, en qué orden, y cómo conectar la salida de uno con la entrada de otro. No hay un flujo guiado. El resultado: herramientas poderosas que nadie usa en secuencia.

Pero el sistema de issues **ya define** el flujo correcto:

```
intake → prd → design → build → review → test → deploy → done
```

El cambio propuesto es simple: hacer que la UI siga ese flujo en vez de exponer 21 herramientas sueltas.

---

## 2. La Nueva Arquitectura UX

### Antes (módulos independientes)

```
Sidebar (21 items)
├── Dashboard
├── Issues              ← lista plana, solo CRUD
├── Clients
├── Connections
├── Explorer
├── Editor
├── AI Studio
├── PRD Builder         ← aislado
├── Page Gen            ← aislado
├── Change Manager      ← aislado
├── Schema Inspector
├── Releases            ← aislado
├── Dependencies
├── Auto Docs
├── Test Studio         ← aislado
├── Knowledge
├── Code Factory
├── Marketplace
├── Usage
├── Dashboards
├── Governance
└── Admin
```

### Después (pipeline + herramientas)

```
Sidebar (5 items)
├── Pipeline            ← EL CENTRO: issues como pipeline visual
├── Explorar            ← Explorer + Schema Inspector + Knowledge (fusionados)
├── Conexiones          ← Connections (configuración, necesita ser standalone)
├── Operaciones         ← Dashboards + Usage + Governance (fusionados)
└── Configuración       ← Admin + LLM Providers + Marketplace (fusionados)
```

La magia está en que **Pipeline** absorbe el 70% de la funcionalidad. Al abrir un issue, cada etapa del pipeline renderiza la UI del módulo correspondiente **dentro del contexto del issue**.

---

## 3. Mapeo: Módulos Actuales → Pipeline Stage

### Módulos que se ABSORBEN en el pipeline (dejan de ser páginas)

| Módulo Actual | Ruta Actual | Stage del Pipeline | Cómo se integra |
| --- | --- | --- | --- |
| PRD Builder (M8) | /prd | **PRD** | Ya lo rehícimos. Se renderiza cuando el issue está en `prd`. |
| Page Gen (M5) | /page-gen | **Design** | Se invoca desde la etapa Design del issue. Genera páginas APEX desde el PRD aprobado. |
| Editor (M3) | /editor | **Build** | Se embebe en la etapa Build para editar el código generado. |
| AI Studio (M4) | /ai-studio | **Build** | Se integra como asistente en la etapa Build (chat lateral para preguntas al AI). |
| Code Factory | /code-factory | **Build** | Templates de código se ofrecen como opción durante Build. |
| Dependencies | /dependencies | **Review** | Se ejecuta automáticamente al entrar en Review para análisis de impacto. |
| Auto Docs | /auto-docs | **Review** | Se genera documentación automática como artefacto del Review. |
| Test Studio | /test-studio | **Test** | Se renderiza en la etapa Test del issue. Tests vinculados al PRD. |
| Change Manager (M6) | /change-manager | **Deploy** | Se crea changeset automáticamente al entrar en Deploy. |
| Release Manager (M9) | /releases | **Deploy** | La release se gestiona desde la etapa Deploy del issue. |

### Módulos que se MANTIENEN como páginas standalone

| Módulo | Ruta | Por qué se mantiene |
| --- | --- | --- |
| Connections (M2) | /connections | Configuración previa al pipeline. Se necesita para conectar BD/APEX antes de trabajar. |
| Explorer (M7) + Schema Inspector | /explore | Herramienta de exploración que se usa transversalmente. Se fusionan en una sola página "Explorar". |
| Knowledge Engine | /explore | Se integra dentro de "Explorar" como una pestaña de búsqueda. |

### Módulos que se MUEVEN a secciones de configuración

| Módulo | Destino | Nota |
| --- | --- | --- |
| Admin | /settings | Se mantiene como está, solo cambia la ruta. |
| LLM Providers | /settings/llm | Sub-sección de Settings. |
| Marketplace | /settings/marketplace | Sub-sección de Settings. |
| Clients | /settings/clients | Se mueve a configuración. El cliente se selecciona al crear el issue. |
| AI Governance | /operations | Se mueve a Operaciones. |
| Dashboards | /operations | Se mueve a Operaciones. |
| Usage Intelligence | /operations | Se mueve a Operaciones. |

---

## 4. La Experiencia del Pipeline

### 4.1 Vista Principal: Kanban de Issues

Al entrar a "Pipeline", el usuario ve un tablero kanban con las 8 columnas del flujo:

```
┌─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┐
│ INTAKE  │   PRD   │ DESIGN  │  BUILD  │ REVIEW  │  TEST   │ DEPLOY  │  DONE   │
│         │         │         │         │         │         │         │         │
│ ┌─────┐ │ ┌─────┐ │         │ ┌─────┐ │         │         │         │ ┌─────┐ │
│ │ADM- │ │ │ADM- │ │         │ │ADM- │ │         │         │         │ │ADM- │ │
│ │215  │ │ │198  │ │         │ │142  │ │         │         │         │ │089  │ │
│ │     │ │ │     │ │         │ │     │ │         │         │         │ │     │ │
│ └─────┘ │ └─────┘ │         │ └─────┘ │         │         │         │ └─────┘ │
│ ┌─────┐ │         │         │         │         │         │         │         │
│ │ADM- │ │         │         │         │         │         │         │         │
│ │220  │ │         │         │         │         │         │         │         │
│ └─────┘ │         │         │         │         │         │         │         │
└─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┘
```

Cada card muestra: código, título, prioridad, asignado a, cliente, y tiempo en la etapa actual.

Alternativa: vista de lista con filtros por stage (para equipos con muchos issues).

### 4.2 Vista de Issue: Pipeline Individual

Al hacer clic en un issue, se abre la vista de pipeline individual. Es un stepper horizontal (como el PRD Builder que rehícimos) pero con las 8 etapas del flujo completo:

```
┌──────────────────────────────────────────────────────────────────────────┐
│  ← Volver    ADM-215: Sistema de Notificaciones            ● high      │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  [INTAKE] → [PRD ●] → [DESIGN] → [BUILD] → [REVIEW] → [TEST] → [DEPLOY]│
│                                                                          │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  ┌────────────────────────────────────────────────────────────────────┐  │
│  │                                                                    │  │
│  │   Aquí se renderiza la UI de la etapa activa.                     │  │
│  │                                                                    │  │
│  │   Si el issue está en PRD → se muestra el PRD Builder             │  │
│  │   Si está en BUILD → se muestra el Editor + AI Studio             │  │
│  │   Si está en TEST → se muestra el Test Studio                     │  │
│  │                                                                    │  │
│  │   Cada etapa tiene su UI específica pero comparte el              │  │
│  │   contexto del issue (cliente, conexión, app, artefactos).        │  │
│  │                                                                    │  │
│  └────────────────────────────────────────────────────────────────────┘  │
│                                                                          │
│  ┌─ Artefactos del Issue ────────────────────────────────────────────┐  │
│  │  📄 PRD (aprobado) │ 📐 3 páginas APEX │ 🧪 12 tests │ 📦 v1.2 │  │
│  └────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────┘
```

### 4.3 Qué renderiza cada etapa

| Etapa | UI que se muestra | Módulos backend que consume |
| --- | --- | --- |
| **Intake** | Formulario del issue: título, descripción, prioridad, tipo, cliente, app, documentos adjuntos, tags. | issues, clients |
| **PRD** | El PRD Builder que acabamos de rehacer (selector de req → contexto → generar → acordeón → aprobar). | prd-builder, issues |
| **Design** | Análisis de impacto (automático desde PRD) + Page Gen para diseñar páginas APEX. Blueprint de implementación. | dependency-analyzer, prd-to-page, schema-inspector |
| **Build** | Editor de código embebido + AI Studio como chat lateral + Code Factory para templates. Lista de artefactos generados con diffs. | editor, ai-studio, code-factory |
| **Review** | Checklist de revisión: impacto verificado, docs generados, código revisado. Auto Docs genera documentación. | dependency-analyzer, auto-docs |
| **Test** | Test Studio embebido: suite de tests vinculados a criterios de aceptación del PRD. Ejecución y resultados. | test-studio |
| **Deploy** | Change Manager crea changeset + Release Manager gestiona el despliegue. Checklist pre-deploy. | change-manager, release-manager |
| **Done** | Resumen: timeline completo del issue, artefactos generados, métricas (tiempo por etapa, re-trabajos). | issues (activities) |

### 4.4 Barra lateral de artefactos

En la vista de issue, una barra lateral colapsable muestra todos los artefactos generados a lo largo del pipeline:

- PRD aprobado (.md)
- Análisis de impacto
- Páginas APEX generadas
- Archivos de código (con diffs)
- Tests generados
- Documentación
- Changeset
- Release notes

Cada artefacto es clickeable y abre un preview.

---

## 5. Sidebar Simplificado

### Nuevo Sidebar (5 entradas)

```
┌──────────────────────┐
│  APEX Dev Manager    │
│                      │
│  🔄 Pipeline         │  ← Kanban/lista de issues (pantalla principal)
│  🔍 Explorar         │  ← Explorer + Schema + Knowledge (fusionados)
│  🔌 Conexiones       │  ← Connections (standalone, necesario)
│  📊 Operaciones      │  ← Dashboards + Usage + Governance
│  ⚙️ Configuración    │  ← Admin + LLM + Marketplace + Clients
│                      │
└──────────────────────┘
```

### Por qué 5 y no 21

La regla es simple: si la funcionalidad opera **en el contexto de un issue**, es una etapa del pipeline, no una página. Si opera **sin issue** (configuración, exploración, monitoreo), es una página standalone.

---

## 6. Lo Que NO Cambia

- **Backend**: Los 28 módulos backend se mantienen. Los endpoints no cambian. Solo cambia quién los llama y desde dónde.
- **Base de datos**: Las tablas no cambian. El campo `issueId` ya existe en las relaciones clave.
- **API clients**: Los 24 archivos de API se mantienen. Solo se reorganiza quién los importa.
- **Autenticación, multi-tenancy, RLS**: Sin cambios.
- **Tipos compartidos**: Sin cambios mayores.

---

## 7. Plan de Migración Incremental

### Fase 1: Pipeline View (2 semanas)

**Objetivo**: Crear la vista de pipeline como pantalla principal sin romper nada.

Cambios:
- Crear `features/pipeline/` con vista kanban/lista de issues
- Crear `features/pipeline/IssueWorkspace.tsx` con el stepper de 8 etapas
- La etapa PRD ya está hecha (el PRD Builder que rehícimos)
- Las demás etapas muestran un placeholder: "Próximamente — Por ahora, usa [módulo] directamente"
- Agregar "Pipeline" al sidebar como primera opción
- No se elimina ningún módulo del sidebar aún

**Resultado**: Los usuarios pueden empezar a usar el pipeline para PRD, y para las demás etapas el placeholder los dirige al módulo actual.

### Fase 2: Etapa Design (2 semanas)

**Objetivo**: Embeber análisis de impacto + Page Gen dentro de la etapa Design.

Cambios:
- Crear componente `DesignStage.tsx` que combina Dependency Analyzer + Page Gen
- El análisis se ejecuta automáticamente al entrar en Design (toma el PRD aprobado como input)
- Page Gen se muestra para generar páginas APEX desde el PRD
- Quitar `/dependencies` y `/page-gen` del sidebar (siguen accesibles pero ya no se necesitan por separado)

### Fase 3: Etapa Build (2 semanas)

**Objetivo**: Embeber Editor + AI Studio en la etapa Build.

Cambios:
- Crear componente `BuildStage.tsx` con editor Monaco embebido
- AI Studio se muestra como panel lateral colapsable
- Code Factory se ofrece como opción "Generar desde template"
- Quitar `/editor`, `/ai-studio`, `/code-factory` del sidebar

### Fase 4: Etapas Review + Test + Deploy (3 semanas)

**Objetivo**: Completar las etapas restantes.

Cambios:
- `ReviewStage.tsx`: checklist de revisión + Auto Docs embebido
- `TestStage.tsx`: Test Studio embebido con vinculación a criterios del PRD
- `DeployStage.tsx`: Change Manager + Release Manager embebidos
- Quitar `/change-manager`, `/releases`, `/test-studio`, `/auto-docs` del sidebar

### Fase 5: Consolidación del sidebar (1 semana)

**Objetivo**: Simplificar a 5 entradas.

Cambios:
- Fusionar Explorer + Schema Inspector + Knowledge en "Explorar"
- Mover Dashboards + Usage + Governance a "Operaciones"
- Mover Admin + LLM + Marketplace + Clients a "Configuración"
- Eliminar todas las entradas de sidebar que ya están absorbidas
- Redirigir rutas antiguas a las nuevas (backward compatibility)

### Resumen del Cronograma

| Fase | Duración | Resultado |
| --- | --- | --- |
| Fase 1 | 2 semanas | Pipeline con PRD funcional, demás etapas con placeholder |
| Fase 2 | 2 semanas | Design stage operativo |
| Fase 3 | 2 semanas | Build stage operativo |
| Fase 4 | 3 semanas | Review + Test + Deploy operativos |
| Fase 5 | 1 semana | Sidebar simplificado a 5 entradas |
| **Total** | **10 semanas** | **Pipeline completo, sidebar simplificado** |

---

## 8. Riesgos y Mitigaciones

| Riesgo | Mitigación |
| --- | --- |
| Usuarios acostumbrados al sidebar actual | Fase 1 no elimina nada. Se agrega el pipeline como opción. Transición gradual. |
| Módulos que no funcionan bien embebidos | Cada módulo se embebe "as-is" primero, se refactoriza después. |
| Etapas del pipeline que no todos los issues necesitan | El pipeline permite "skip" de etapas opcionales. Solo Intake y PRD son obligatorias. |
| Performance al cargar muchos módulos en una vista | Lazy loading por etapa. Solo se carga la UI de la etapa activa. |
| Backend no preparado para flujo secuencial | El sistema de transiciones de issues ya valida la secuencia de estados. |
