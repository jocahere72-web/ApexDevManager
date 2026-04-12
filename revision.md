# Revision actual de errores

Fecha: 2026-04-12

Ultima actualizacion: 2026-04-12T05:35:31Z

Esta revision revalida los hallazgos reportados contra el estado actual del backend y agrega una revision de construccion frontend. No se ejecutaron tests ni typecheck porque `node` no esta disponible en el PATH de esta sesion.

## Estado de hallazgos anteriores

Corregidos o mitigados en la revision actual:

- Los consumidores principales ya no hacen `SELECT id, tenant_id, type, config, encrypted_credentials FROM connections`; ahora usan `getConnectionForTenant()`.
- `dashboard.service.ts` ya consulta `last_check_at`, `last_latency_ms` y `last_error` en lugar de `last_tested_at`, `response_time_ms` y `error_message`.
- `usage-intelligence` y `dashboards` ya cambiaron las consultas revisadas de `pool.query()` a `tenantQuery(client, ...)`, y sus controladores pasan `req.dbClient`.
- Revalidado nuevamente: el finding de RLS parcial en `usage-intelligence` es falso positivo en el estado actual; las lineas 40, 50, 58, 66, 227 y 240 de `usage.service.ts` usan `tenantQuery(client, ...)`.
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

## 3. Servicios frontend duplican el prefijo `/api/v1`

Severidad: P1

Archivos:

- `apps/web/src/lib/api-client.ts`
- `apps/web/src/services/admin.api.ts`
- `apps/web/src/services/marketplace.api.ts`
- `apps/web/src/services/factory.api.ts`
- `apps/web/src/services/dashboard.api.ts`
- `apps/web/src/services/test-studio.api.ts`
- `apps/web/src/services/knowledge.api.ts`
- `apps/web/src/services/usage.api.ts`

Problema:

`apiClient` ya define `baseURL: '/api/v1'`, pero varios servicios declaran constantes como `'/api/v1/usage'`, `'/api/v1/dashboard'`, `'/api/v1/knowledge'` y similares. Axios concatena ambos valores y termina llamando rutas como `/api/v1/api/v1/usage`, que no existen en el backend.

Impacto:

Las paginas construidas sobre esos servicios pueden fallar aunque el backend este correcto: dashboards, usage intelligence, knowledge, marketplace, test studio, factory y admin quedan apuntando a URLs invalidas.

Mejor solucion:

- Mantener una sola fuente del prefijo API.
- Si `apiClient.baseURL` sigue siendo `/api/v1`, cambiar los servicios a rutas relativas al recurso: `/usage`, `/dashboard`, `/knowledge`, `/marketplace`, `/test-studio`, `/factory`, `/admin`.
- Agregar una prueba pequena de contrato para cada service client critico que valide el path final.

## 4. Frontend de conexiones no coincide con el contrato backend

Severidad: P1

Archivos:

- `apps/web/src/services/connections.api.ts`
- `apps/web/src/features/connections/hooks/useConnections.ts`
- `apps/web/src/features/connections/components/ConnectionList.tsx`
- `apps/api/src/modules/connections/connections.controller.ts`
- `apps/api/src/modules/connections/connections.validation.ts`

Problema:

El backend devuelve envelopes `ApiResponse` y `PaginatedResponse` con `{ success, data, pagination }`, pero `connections.api.ts` tipa y retorna directamente `PaginatedConnections` o `Connection`. La lista espera `data.data`, `data.totalPages`, `data.page` y `data.total`, pero la respuesta real trae `data` y `pagination.totalItems`.

Tambien hay desalineacion de rutas y payloads:

- El frontend usa `PUT /connections/:id`, pero el backend expone `PATCH /:id`.
- El frontend usa `POST /connections/test` con payload completo, pero el backend expone `POST /:id/test`.
- El frontend llama `/connections/:id/health-history` y `/connections/:id/changelog`, pero el controller revisado solo expone `/connections/:id/health`.
- El frontend define `ConnectionType` como `ORDS | JDBC`, mientras la validacion backend acepta `ords | jdbc`.

Impacto:

La pagina de conexiones puede fallar al listar, actualizar, probar conexiones y cargar paneles de detalle. Esta es una falla de integracion funcional, no de presentacion.

Mejor solucion:

- Crear tipos frontend para `ApiResponse<T>` y `PaginatedResponse<T>` o reutilizar los compartidos si existen.
- Desempaquetar respuestas en el service: `response.data.data` y mapear `response.data.pagination` al modelo que consume la UI.
- Cambiar update a `PATCH /connections/:id`.
- Cambiar test a `POST /connections/:id/test` y adaptar la UI para probar una conexion existente, o crear un endpoint backend separado para probar payloads sin persistir.
- Eliminar, ocultar o implementar las pantallas de `health-history` y `changelog`.
- Normalizar `type` a lowercase antes de enviar al backend o alinear los tipos compartidos.

## 5. Explorer sigue construido con conexiones stub y expansion incompleta

Severidad: P1

Archivo:

- `apps/web/src/features/explorer/index.tsx`

Problema:

La pantalla usa `STUB_CONNECTIONS` con ids `conn-1`, `conn-2` y `conn-3`, no conexiones reales del API. Luego llama `useApplications(selectedConnectionId)` con esos ids ficticios. Ademas, `handleExpandNode()` solo marca el nodo como `isLoading: true`; no usa `usePages` ni `useComponents` para cargar hijos, aunque esos hooks estan importados. `handleOpenInEditor()` solo hace `console.info`.

Impacto:

Explorer parece una pantalla terminada, pero en uso real no navega el arbol de aplicaciones APEX ni abre elementos en el editor. Puede mostrar listas vacias o errores por ids inexistentes.

Mejor solucion:

- Reemplazar `STUB_CONNECTIONS` por el hook real de conexiones.
- Conectar `handleExpandNode()` a la carga real de paginas/componentes o a un endpoint de arbol completo.
- Persistir hijos cargados en el estado del arbol y apagar `isLoading` al resolver.
- Conectar `handleOpenInEditor()` con la ruta/estado del editor.
- Agregar prueba de UI o integracion que seleccione una conexion real, expanda una aplicacion y valide nodos hijos.

## 6. Paginas construidas como formularios de UUID manual o placeholders

Severidad: P2

Archivos:

- `apps/web/src/features/auto-docs/components/DocsGenerator.tsx`
- `apps/web/src/features/dependency-analyzer/components/DependencyGraph.tsx`
- `apps/web/src/features/prd-to-page/components/PageGenerator.tsx`
- `apps/web/src/features/prd-builder/components/PRDWorkspace.tsx`
- `apps/web/src/features/ai-studio/components/UsageDashboard.tsx`
- `apps/web/src/features/usage-intelligence/components/CostDashboard.tsx`
- `apps/web/src/features/connections/components/ConnectionDetail.tsx`

Problema:

Varias pantallas no estan integradas con flujos reales de seleccion/navegacion:

- Auto Docs pide `Connection ID` manual.
- Dependency Analyzer pide `Connection ID` manual.
- PRD to Page pide `PRD Session ID` y `Connection ID` como UUIDs escritos a mano.
- PRD Workspace contiene simulacion con mock source.
- Usage dashboards y Connection Detail mantienen placeholders de graficas.

Impacto:

La experiencia queda fragmentada: el usuario necesita copiar UUIDs entre pantallas, algunas acciones simulan datos y varias secciones prometen visualizaciones que no existen. Esto explica la percepcion de que muchas paginas estan mal construidas aunque compilen.

Mejor solucion:

- Introducir selectores compartidos para conexiones, sesiones PRD y objetos APEX.
- Pasar contexto por ruta o estado desde Explorer/Connections hacia Auto Docs, Dependency Analyzer y PRD to Page.
- Reemplazar placeholders de graficas por componentes reales o esconder esas secciones hasta que exista implementacion.
- Convertir mocks de flujo en estados explicitos de demo/deshabilitado si aun no hay backend real.
- Agregar pruebas de navegacion end-to-end para los flujos principales: seleccionar conexion, explorar app, generar docs, analizar dependencias y abrir editor.

## 7. Layout principal no es responsive y satura la navegacion

Severidad: P1

Archivo:

- `apps/web/src/layouts/MainLayout.tsx`

Problema:

El layout principal renderiza un sidebar fijo de `15rem` con alrededor de veinte modulos visibles y un header horizontal fijo. No hay breakpoint, drawer, colapso, agrupacion de modulos, navegacion secundaria ni patron mobile. La busqueda de `@media`, `matchMedia` y helpers equivalentes no mostro un sistema responsive en `apps/web/src`.

Impacto:

En pantallas pequenas o medianas, la interfaz queda rapidamente comprimida: el contenido principal pierde espacio, los nombres del usuario/roles pueden competir con el header, y los modulos de producto se presentan como una lista plana dificil de navegar. Esto afecta usabilidad aunque las rutas existan.

Mejor solucion:

- Definir un shell responsive compartido.
- Agrupar navegacion por dominios: Core, APEX, AI, Delivery, Operations, Admin.
- Agregar sidebar colapsable en desktop y drawer en mobile/tablet.
- Mover usuario/tenant/roles a un menu de cuenta.
- Agregar pruebas visuales o screenshots de al menos desktop, tablet y mobile.

## 8. Pantallas de trabajo usan columnas fijas sin adaptacion visual

Severidad: P1

Archivos:

- `apps/web/src/features/ai-studio/index.tsx`
- `apps/web/src/features/explorer/index.tsx`
- `apps/web/src/features/dashboards/components/OverviewDashboard.tsx`
- `apps/web/src/features/dependency-analyzer/components/DependencyGraph.tsx`
- `apps/web/src/features/editor/index.tsx`

Problema:

Varias pantallas criticas estan construidas con paneles fijos: AI Studio usa `280px + flex + 300px`, Explorer usa `280px + flex + 320px`, Editor agrega un panel `w-80`, y dashboards/dependencies tienen grids `1fr 1fr` sin breakpoint local. Son layouts de escritorio, pero el producto no define como se reorganizan en espacios estrechos.

Impacto:

Las pantallas mas importantes del producto pueden quedar cortadas, con scroll horizontal implicito, paneles demasiado pequenos o contenido oculto. Esto golpea especialmente editor, explorer, AI Studio y dashboards, que son experiencias de trabajo largas.

Mejor solucion:

- Crear componentes compartidos `WorkspaceLayout`, `ResizablePanel`, `ResponsiveSplitPane` o equivalente.
- Definir reglas por ancho: columnas completas en desktop, tabs/paneles apilados en tablet, drawer/bottom panel en mobile.
- Evitar widths fijos sin `minmax`, `clamp` o breakpoints.
- Probar cada workspace con datos largos y textos reales.

## 9. No hay sistema visual consistente; predominan estilos inline por modulo

Severidad: P2

Archivos:

- `apps/web/src/layouts/MainLayout.tsx`
- `apps/web/src/pages/LoginPage.tsx`
- `apps/web/src/features/*`

Problema:

La interfaz mezcla estilos inline, algunos `className` de Tailwind y objetos `CSSProperties` por modulo. Los colores, radios, tarjetas, tablas, botones, tabs, estados vacios y mensajes de error se redefinen en cada pantalla. El dashboard inicial tambien es una pantalla de bienvenida basica, mientras existe otro modulo de dashboards mas completo en `/dashboards`, lo que refuerza la sensacion de producto ensamblado por piezas.

Impacto:

La UI puede compilar, pero no se siente como una aplicacion consistente: los modulos cambian de densidad, paleta, jerarquia y comportamiento. Tambien se vuelve caro corregir accesibilidad, responsive y estados de carga/error porque cada pantalla los implementa a mano.

Mejor solucion:

- Crear un design system minimo: tokens, botones, inputs, cards, tabs, tables, empty states, loading states y error banners.
- Migrar progresivamente estilos inline repetidos a componentes compartidos.
- Unificar paleta, tipografia, espaciados y radios.
- Reemplazar el dashboard raiz con una home operativa que use los mismos widgets reales o redirigir a `/dashboards` si esa es la experiencia canonica.
- Agregar revision visual con Playwright cuando Node este disponible.

## 10. Resultados de pruebas frontend y revision visual con Playwright

Severidad: P1

Ejecucion:

- Servidor local Vite: `http://127.0.0.1:5173/`
- Viewports probados: desktop `1440x900`, tablet `768x1024`, mobile `390x844`
- Rutas capturadas: `/`, `/connections`, `/explorer`, `/ai-studio`, `/dashboards`, `/usage`, `/editor`
- Evidencia generada: `/tmp/apexdev-ui-review/` y `/tmp/apexdev-ui-review-mocked/`

Comandos ejecutados:

```bash
PATH=/opt/homebrew/bin:$PATH pnpm --filter @apex-dev-manager/web test
PATH=/opt/homebrew/bin:$PATH pnpm --filter @apex-dev-manager/web typecheck
PATH=/opt/homebrew/bin:$PATH pnpm --filter @apex-dev-manager/web build
```

Resultado:

- `typecheck`: paso.
- `test`: inicialmente fallo porque faltaba `jsdom`; se agrego `jsdom` como devDependency y luego paso `1 test`.
- `build`: paso, `223 modules transformed`.
- Playwright: paso con Chromium headless fuera del sandbox.

Hallazgos visuales confirmados:

- En mobile `390px`, el sidebar conserva aproximadamente `257px` y deja el area principal en aproximadamente `117px`. Esto confirma que el shell no es usable en mobile aunque no siempre aparezca overflow horizontal medido por el documento.
- En tablet `768px`, el main queda en aproximadamente `495px`, muy estrecho para workspaces como AI Studio, Explorer, Editor y Dashboards.
- La navegacion mantiene 20 items visibles en todos los viewports, sin agrupacion ni modo drawer.
- `/connections`, `/explorer` y `/ai-studio` redirigen al login en la corrida sin backend mockeado porque las llamadas API iniciales reciben 401 y el interceptor global limpia sesion. Con API mockeada renderizan, pero siguen mostrando la misma limitacion de layout.
- `/dashboards`, `/usage` y `/connections` en mobile muestran contenido recortado visualmente por falta de reorganizacion responsive.

Mejor solucion:

- Convertir el shell en responsive antes de seguir puliendo paginas individuales.
- Agregar una suite Playwright versionada en el repo con screenshots o assertions de layout para desktop, tablet y mobile.
- Mockear API en pruebas visuales para validar interfaz sin depender del backend.
- Agregar `jsdom` de forma permanente para que Vitest no falle por entorno faltante.
- Revisar el interceptor de 401 para distinguir expiracion de token, permisos insuficientes y errores de endpoints opcionales.
