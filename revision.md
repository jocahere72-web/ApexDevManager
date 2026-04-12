# Revision actual de errores

Fecha: 2026-04-12

Ultima actualizacion: 2026-04-12T04:24:43Z

Esta revision revalida los hallazgos reportados contra el estado actual del backend. No se ejecutaron tests ni typecheck porque `node` no esta disponible en el PATH de esta sesion.

## Estado de hallazgos anteriores

Corregidos o mitigados en la revision actual:

- Los consumidores principales ya no hacen `SELECT id, tenant_id, type, config, encrypted_credentials FROM connections`; ahora usan `getConnectionForTenant()`.
- `dashboard.service.ts` ya consulta `last_check_at`, `last_latency_ms` y `last_error` en lugar de `last_tested_at`, `response_time_ms` y `error_message`.
- `usage-intelligence` y `dashboards` ya cambiaron las consultas revisadas de `pool.query()` a `tenantQuery(client, ...)`, y sus controladores pasan `req.dbClient`.
- El script de test de API ya apunta a `test/**/*.test.ts`.
- `users.service.ts` ya usa `hashPassword()` compartido.
- `usage-intelligence` ya valida `granularity` y usa `GRANULARITY_MAP`.
- La clave de pool MCP ya incluye `tenantId` y `connectionId`.
- `@apex-dev-manager/shared-types` ya esta declarado en `apps/api/package.json` y `apps/web/package.json` como `workspace:^`.
- Explorer ya no convierte siempre `workspaceName` a `WORKSPACE_ID`; ahora construye un filtro `{ id }` si el valor es numerico o `{ name }` si es texto, y los adaptadores MCP/ORDS aceptan ambos filtros.
- El hallazgo de auditoria `audit_logs` ya no aplica para auth/users/connections: los tres servicios escriben en `audit_events`, que es la tabla definida por las migraciones.
- Schema Inspector ya propaga `req.dbClient` en sus rutas Oracle y reenvia `client` desde `getSchema`, `getTable`, `getTableDDL`, `createSnapshot` y `generateERD` hacia la resolucion de conexiones.

## 1. Rate limiter de AI Studio sigue usando `pool.query()` directo

Severidad: P1

Archivos:

- `apps/api/src/modules/ai-studio/rate-limiter.ts`

Problema:

La migracion de RLS/tenant client avanzo bastante: las busquedas anteriores ya no muestran `pool.query()` en los modulos grandes revisados. El residuo que queda en esa seleccion esta en `ai-studio/rate-limiter.ts`, donde `checkRateLimit()` y `getTenantMonthlyBudget()` consultan `ai_token_usage` y `tenants` con `pool.query()` directo.

Ademas, los call sites actuales todavia no le pasan el client tenant-scoped:

- `ai.controller.ts` en quick action llama `checkRateLimit(req.tenantId!, req.userId!)`.
- `ai.service.ts` en `chat()` llama `checkRateLimit(tenantId, userId)` aunque la funcion ya recibe `client?: PoolClient`.
- `ai.service.ts` en `streamChat()` llama `checkRateLimit(tenantId, userId)` aunque la funcion ya recibe `client?: PoolClient`.

Impacto:

Si estas tablas dependen de politicas RLS basadas en `app.current_tenant`, el rate limiter no usa el cliente tenant-scoped del request. En la practica puede depender solo de filtros manuales por `tenant_id`, que no es consistente con el resto de la ruta autenticada.

Mejor solucion:

- Cambiar `checkRateLimit(tenantId, userId, client?: PoolClient)`.
- Usar `tenantQuery(client, ...)` para `ai_token_usage` y para leer el presupuesto del tenant.
- Pasar `req.dbClient` desde el flujo de AI Studio que invoca el rate limiter.
- Reenviar `client` desde `chat()` y `streamChat()` hacia `checkRateLimit()`.
- Agregar test que confirme que el rate limiter usa el client tenant-scoped.

## 2. Validacion ejecutable pendiente

Severidad: P2

Problema:

No se pudo ejecutar typecheck ni test porque el entorno no encuentra `node`.

Comandos pendientes:

```bash
pnpm --filter @apex-dev/api typecheck
pnpm --filter @apex-dev/api test
```

Motivo observado:

```text
node not found
```

Mejor solucion:

- Ejecutar la validacion en un shell con Node 20+ disponible.
- Cerrar esta revision solo despues de typecheck y tests backend.
