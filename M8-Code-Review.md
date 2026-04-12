# Code Review — M8 PRD Builder + M5 PRD-to-Page

**Fecha:** 2026-04-12  
**Alcance:** Revisión de calidad de código, bugs, patrones y completitud de la implementación existente  
**Archivos revisados:** 16 archivos (0 tests)

---

## 1. Inventario de Archivos

| Capa | Archivos | LOC aprox |
|------|----------|-----------|
| Backend — PRD Builder | `index.ts`, `prd.service.ts`, `prd.controller.ts`, `prd.validation.ts` | ~1,330 |
| Backend — PRD-to-Page | `index.ts`, `page-gen.service.ts`, `page-gen.controller.ts` | ~480 |
| Migraciones | `016_prd-sessions.ts`, `017_prd-sources.ts`, `018_prd-sections.ts` | ~270 |
| Shared Types | `prd.ts` | ~230 |
| Frontend — PRD Builder | `index.tsx`, `PRDSessionList.tsx`, `PRDWorkspace.tsx`, `usePRD.ts` | ~1,240 |
| Frontend — PRD-to-Page | `index.tsx`, `PageGenerator.tsx` | ~740 |
| Frontend — API Client | `prd.api.ts` | ~235 |
| **Tests** | **Ninguno** | **0** |

**Total: ~4,525 LOC en 16 archivos, 0 tests.**

---

## 2. Bugs y Problemas Encontrados

### 2.1 CRÍTICOS (causan errores en runtime)

**BUG-01: Connection leak en `parseSourceAsync`**  
📁 `prd.service.ts:287-359`  
El parámetro `client` se recibe pero no se usa internamente. En el `catch` de la línea 350, se usa `tenantQuery(client, ...)` para marcar el error, pero `client` viene del scope externo y podría ser `undefined`. Sin embargo, el bug real es que `txClient` se adquiere con `getClient()` pero si hay un error **después del ROLLBACK**, el `tenantQuery` en el catch usa un `client` potencialmente nulo.

```typescript
// Línea 350: client podría ser undefined
await tenantQuery(client,  // ← client es el parámetro externo, no txClient
  `UPDATE prd_sources SET parse_status = 'error'...`,
```

**BUG-02: Connection leak en `extractRequirements`**  
📁 `prd.service.ts:368-481`  
Se hace `const txClient = await getClient()` en línea 374, se usa para `BEGIN` y `COMMIT` (líneas 377-408), pero luego el código AI está **fuera de la transacción** (ya se hizo COMMIT). Si la llamada a Claude falla (línea 436-456), el `catch` en línea 468 intenta `txClient.query('ROLLBACK')` pero la transacción ya se cerró con COMMIT. El txClient se libera en `finally`, pero el ROLLBACK innecesario genera warnings.

Peor aún: si el `UPDATE prd_sessions` de la línea 459 falla (que usa `tenantQuery(client, ...)` con el parámetro externo), no se captura correctamente.

**BUG-03: `parse_status` usa 'error' en servicio pero 'failed' en diseño funcional**  
📁 `prd.service.ts:351` vs `functional-design.md` (campo `parse_status: pending|parsing|parsed|failed`)  
La migración `017` tiene el CHECK constraint con `'error'`, pero el diseño funcional dice `'failed'`. El servicio usa `'error'` consistentemente, pero los shared-types definen `PRDSourceParseStatus = 'pending' | 'parsing' | 'parsed' | 'error'`. Hay **inconsistencia con el FD** pero internamente es consistente.

**BUG-04: `generateSections` no abre transacción para borrar secciones previas**  
📁 `prd.service.ts:530-533`  
El `UPDATE prd_sections SET is_current = false` (línea 530) se ejecuta con `tenantQuery(client, ...)` **fuera** de la transacción (que se abre en línea 539). Si la generación falla a mitad del loop, las secciones previas ya están marcadas como `is_current = false` y no se restauran. El PRD queda **sin secciones visibles**.

```typescript
// Esto está FUERA de la transacción:
await tenantQuery(client,
  `UPDATE prd_sections SET is_current = false WHERE session_id = $1...`,
  [sessionId, tenantId],
);

// La transacción se abre DESPUÉS:
const txClient = await getClient();
await txClient.query('BEGIN');
```

**BUG-05: `applyPage` — posible uso de `client` externo después de `txClient`**  
📁 `page-gen.service.ts:251`  
Después de hacer `COMMIT` con `txClient`, se usa `tenantQuery(client, ...)` (parámetro externo, probablemente `undefined`) para el UPDATE final. Si `client` es undefined, `tenantQuery` debería usar el pool, pero la mezcla de conexiones es peligrosa.

### 2.2 ALTOS (lógica incorrecta / datos corruptos)

**BUG-06: Exportación permite exportar con blockers**  
📁 `prd.service.ts:825-930`  
`exportPRD()` no verifica si hay blockers sin resolver. Según RF-58 y PRD-R16, la exportación debe bloquearse si `validation_blockers > 0`. Actualmente se puede exportar cualquier PRD sin restricción.

**BUG-07: Validación no persiste resultados individuales**  
📁 `prd.service.ts:704-816`  
`validatePRD()` guarda el score y conteos en `prd_sessions`, pero **no persiste los checks individuales** en `prd_validation_results`. Esto significa que al recargar la página, solo se ven los conteos pero no los detalles de cada check. Además, la tabla `prd_validation_results` ni siquiera tiene migración.

**BUG-08: Upload no valida cantidad máxima de archivos por sesión**  
📁 `prd.service.ts:243-282` + `prd.validation.ts:21-49`  
No hay validación de que la sesión no exceda 10 archivos. Se puede subir archivos indefinidamente.

**BUG-09: Límite de archivo inconsistente**  
📁 `prd.validation.ts:42`  
El schema permite archivos de hasta `50 * 1024 * 1024` (50 MB), pero el PRD y el diseño funcional dicen 25 MB.

**BUG-10: `handleRegenerateSection` regenera TODAS las secciones**  
📁 `PRDWorkspace.tsx:265-272`  
El botón "Regenerate" de cada sección llama `generateSections.mutate({ templateStyle })`, que regenera **todas** las secciones, no solo la seleccionada. Esto destruye ediciones manuales del usuario en otras secciones.

### 2.3 MEDIOS (UX / calidad)

**BUG-11: Frontend duplicado — `index.tsx` y `PRDSessionList.tsx` hacen lo mismo**  
📁 `prd-builder/index.tsx` + `prd-builder/components/PRDSessionList.tsx`  
El `index.tsx` tiene su propia implementación de listado de sesiones con `useState`/`useEffect`, mientras que `PRDSessionList.tsx` usa React Query via `usePRDSessions()`. No está claro cuál se usa en el routing. Si se usa `index.tsx`, no se beneficia de React Query.

**BUG-12: `index.tsx` usa `apiClient` directamente, no los hooks**  
📁 `prd-builder/index.tsx:9`  
Importa `apiClient` directamente en lugar de usar `usePRDSessions()` / `useCreateSession()`. Esto rompe el patrón establecido con React Query y pierde cache, refetch automático, y estado de loading/error integrado.

**BUG-13: Upload simulado con datos mock**  
📁 `PRDWorkspace.tsx:216-225`  
El botón "Upload Document" no abre un file picker real. Inserta un source ficticio con datos hardcodeados (`requirements.pdf`, `storageKey: uploads/...`). No hay integración con almacenamiento de objetos.

**BUG-14: No hay validación de estado antes de avanzar etapas**  
📁 `PRDWorkspace.tsx`  
Se puede navegar libremente entre etapas sin restricción. Por ejemplo, se puede ir a "Export" sin haber generado secciones. El botón "Continue" verifica datos, pero nada impide hacer clic directo en el stepper.

**BUG-15: Polling infinito potencial en `PageGenerator`**  
📁 `PageGenerator.tsx:205-212`  
El `refetchInterval` para jobs en estado `generating` o `applying` hace polling cada 2 segundos **sin límite**. Si un job queda atascado, el polling nunca se detiene.

---

## 3. Problemas de Arquitectura y Patrones

### 3.1 Manejo de transacciones inconsistente

El servicio mezcla tres enfoques para transacciones:

1. **`tenantQuery(client, ...)`** — usa la conexión del middleware (o el pool si es undefined)
2. **`getClient()` + BEGIN/COMMIT/ROLLBACK** — transacción manual
3. **Mezcla de ambos** — dentro de una transacción manual, algunas queries usan `tenantQuery(client, ...)` en vez de `txClient.query()`

Esto causa:
- Queries fuera de la transacción cuando deberían estar dentro
- Riesgo de deadlocks por tener dos conexiones al pool simultáneamente
- El parámetro `client` se arrastra por todas las funciones pero rara vez se usa correctamente

**Recomendación:** Unificar en un solo patrón. Idealmente, el middleware inyecta la conexión en `req.dbClient` y todas las queries la usan. Las transacciones se manejan a nivel de servicio con ese mismo client.

### 3.2 Prompts de IA hardcodeados

Los prompts para Claude están embebidos como strings directamente en el servicio:
- `prd.service.ts:419-430` — prompt de extracción
- `prd.service.ts:555-558` — prompt de generación
- `prd.service.ts:736-754` — prompt de validación
- `page-gen.service.ts:101-128` — prompt de generación de página

Según las reglas del proyecto: *"Los prompts van en archivos .txt en /app/prompts/, no hardcodeados"*.

### 3.3 Sin manejo de errores de parseo de JSON de la IA

Cuando Claude devuelve una respuesta que no es JSON válido:
- En `extractRequirements`: usa fallback con `rawNotes` (línea 447) — aceptable
- En `validatePRD`: devuelve score 0 con checks vacíos (línea 781) — pierde la respuesta
- En `generatePageAsync`: lanza error genérico (línea 143) — el job queda en error sin contexto

No hay reintentos ni logging del contenido que falló para debug.

### 3.4 Estilos inline en frontend

Todos los componentes usan `CSSProperties` inline (~200 líneas de estilos por componente). Esto:
- Hace que los archivos sean ~50% estilos
- No permite hover/focus/media queries (CSS-in-JS limitations)
- Duplica estilos entre componentes (mismo `buttonStyle`, `badgeStyle`, etc.)

### 3.5 Sin separación de PRD-to-Page validations

El controller de `page-gen.controller.ts` define los schemas de validación (Zod) inline en el mismo archivo, mientras que PRD Builder los tiene en un archivo separado (`prd.validation.ts`). Inconsistencia de patrón.

---

## 4. Seguridad

| Problema | Severidad | Detalle |
|---|---|---|
| No hay validación de ownership de sesión | ALTO | Un usuario puede acceder/modificar sesiones de otro usuario del mismo tenant |
| No hay rate limiting en endpoints de IA | ALTO | Los endpoints `/extract`, `/generate`, `/validate` llaman a Claude API sin throttle |
| `storageKey` se acepta del cliente | MEDIO | El frontend envía `storageKey` como parámetro. Un atacante podría enviar paths maliciosos |
| No hay sanitización del contenido exportado | MEDIO | El markdown exportado podría contener XSS si se renderiza en otro contexto |
| SQL injection protegido | OK | Todas las queries usan parametrización ($1, $2, etc.) |
| RLS habilitado en todas las tablas | OK | Las políticas de tenant isolation están correctas en las migraciones |

---

## 5. Tests — AUSENCIA TOTAL

**No hay un solo test en todo el módulo.** Ni unitarios, ni de integración, ni e2e.

Dado que el proyecto define TDD como metodología obligatoria (*"Siempre escribir el test primero"*), esta es una violación grave del proceso.

Tests prioritarios que deberían existir:

1. **Unit tests del servicio:**
   - `createSession` — crea sesión correctamente
   - `uploadSource` — valida límites de archivos
   - `extractRequirements` — parsea JSON de IA, maneja fallback
   - `generateSections` — genera N secciones, maneja error mid-loop
   - `validatePRD` — parsea checklist, cuenta blockers/warnings
   - `exportPRD` — bloquea con blockers, genera markdown/yaml/json
   - `updateSection` — crea nueva versión, marca anterior como no-current

2. **Integration tests:**
   - Flujo completo: create → upload → extract → generate → validate → export
   - Multi-tenant isolation

3. **Frontend tests:**
   - Renderizado de cada etapa del wizard
   - Transiciones de estado correctas

---

## 6. Lo Que Sí Está Bien

A pesar de los problemas, hay aspectos positivos en la implementación:

**Arquitectura general:** La separación en capas (controller → service → DB) es limpia. Los módulos están bien aislados con exports claros en `index.ts`.

**React Query hooks:** El archivo `usePRD.ts` sigue buenas prácticas: query key factory, invalidación automática en mutations, tipos correctos.

**API client tipado:** `prd.api.ts` tiene funciones bien tipadas con interfaces claras para cada operación.

**Versionado de secciones:** El patrón de crear nueva versión + marcar `is_current = false` en la anterior es correcto y permite historial de cambios.

**PRDSessionList:** Buen componente con manejo de estados (loading, error, empty), accesibilidad (role="button", tabIndex, onKeyDown), y UI limpia con status badges colorizados.

**PRD-to-Page preview:** El componente `PageDefinitionPreview` tiene un toggle visual/JSON que es útil para revisión, y muestra las regiones, items, procesos y validaciones de forma organizada.

**Migraciones:** Las 3 migraciones están bien estructuradas con RLS, indexes correctos, constraints CHECK, y funciones `down()` para rollback limpio.

**Shared types:** El archivo `prd.ts` tiene tipos completos y bien estructurados para todo el dominio del módulo.

---

## 7. Resumen de Hallazgos por Severidad

| Severidad | Cantidad | Ejemplos |
|---|---|---|
| 🔴 Crítico | 5 | Connection leaks, secciones perdidas si falla generación, transacciones rotas |
| 🟠 Alto | 5 | Export sin bloqueo, validación no persistida, límites no validados, regenerate destructivo |
| 🟡 Medio | 5 | Frontend duplicado, upload mock, polling infinito, navegación sin restricción |
| 🔵 Arquitectura | 5 | Transacciones inconsistentes, prompts hardcodeados, estilos inline, sin tests |
| 🟣 Seguridad | 4 | Sin ownership check, sin rate limiting, storageKey del cliente, sin sanitización |
| **Total** | **24 hallazgos** |

---

## 8. Recomendaciones de Acción Inmediata

1. **Escribir tests** antes de cualquier otro cambio — al menos los unitarios del servicio
2. **Corregir manejo de transacciones** — unificar patrón, arreglar BUG-04 urgente
3. **Agregar validación de exportación** — bloquear si `validation_blockers > 0`
4. **Mover prompts a archivos** — `/app/prompts/prd-extract.txt`, etc.
5. **Implementar upload real** — integrar file picker + object storage
6. **Agregar rate limiting** — limitar llamadas a Claude API por tenant
7. **Resolver frontend duplicado** — elegir uno de los dos enfoques de listado
