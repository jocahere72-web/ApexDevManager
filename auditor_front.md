# Auditoria Frontend

**Fecha**: 2026-04-12
**Alcance**: Revision de interfaz grafica, flujo de autenticacion del cliente y consistencia visual del frontend.

## Resumen Ejecutivo

La interfaz ya tiene partes migradas al template visual comun, pero todavia hay pantallas y flujos con comportamiento inconsistente. Los riesgos mas importantes son el manejo global de `401`, que puede sacar al usuario de la aplicacion por errores no fatales, y Explorer, que aun conserva una URL hardcodeada del ambiente y una composicion visual propia fuera del shell comun.

## Hallazgos

### Finding 1 - [P1] Interceptor 401 sigue expulsando por errores no fatales

**Archivo**: `apps/web/src/lib/api-client.ts:43-52`

**Problema**: El interceptor todavia intenta refrescar token y, si falla, limpia la sesion y redirige a `/login` para cualquier `401` que no sea una ruta de autenticacion. En pantallas con llamadas opcionales, datos parciales o API mockeada, un endpoint secundario puede expulsar al usuario de toda la app.

**Impacto**: Experiencia inestable. El usuario puede perder contexto de trabajo por una llamada secundaria fallida, aunque el problema no sea una sesion expirada.

**Mejor solucion**:
- Diferenciar `401` por token expirado/invalido de `401` por permisos, datos no disponibles o endpoints opcionales.
- Redirigir solo si el backend devuelve un codigo claro como `TOKEN_EXPIRED`, `INVALID_TOKEN` o `AUTHENTICATION_REQUIRED`, o si la request marca explicitamente `authRedirectOn401`.
- Mantener el rechazo normal del error para las demas llamadas, permitiendo que cada pantalla muestre su estado de error.

**Verificacion sugerida**:
- Simular un `401` en `/connections` o `/explorer` sin codigo de token invalido y confirmar que no redirige a `/login`.
- Simular un `401` con token expirado y confirmar que refresca o redirige correctamente.

### Finding 2 - [P2] Placeholder visible en historial de latencia

**Archivo**: `apps/web/src/features/connections/components/ConnectionDetail.tsx:190-199`

**Problema**: La pantalla muestra el texto literal `Latency chart placeholder -- integrate charting library here` aunque tambien informa que hay data points disponibles.

**Impacto**: La pantalla parece incompleta y entrega una experiencia visual de prototipo en un modulo funcional.

**Mejor solucion**:
- Si hay `healthHistory`, renderizar una visualizacion simple con los puntos disponibles, por ejemplo barras compactas, mini timeline o tabla resumida.
- Si no hay datos, mostrar un empty state real: "No latency checks recorded yet."
- Eliminar cualquier copy de implementacion interna o placeholder tecnico.

**Verificacion sugerida**:
- Abrir el detalle de una conexion con historial y confirmar que no aparece texto placeholder.
- Abrir una conexion sin historial y confirmar que aparece un estado vacio limpio.

### Finding 3 - [P1] Explorer abre una URL hardcodeada del ambiente

**Archivo**: `apps/web/src/features/explorer/index.tsx:247-255`

**Problema**: Los botones `Run Application` y `Run Page` abren `http://99.0.5.232:8031/ords/r/infortributos/...`, con host, puerto y workspace hardcodeados.

**Impacto**: En una app multi-tenant, Explorer puede abrir un ambiente incorrecto, romper en otros despliegues o exponer una URL interna no portable.

**Mejor solucion**:
- Construir la URL desde los datos de la conexion seleccionada, por ejemplo `ordsBaseUrl` y `workspaceName`.
- Mejor aun, pedir al backend una `launchUrl` validada para la aplicacion o pagina seleccionada.
- Evitar IPs, workspaces y paths hardcodeados en componentes UI.

**Verificacion sugerida**:
- Probar Explorer con dos conexiones de distinto tenant/ambiente y confirmar que cada boton abre la URL correcta.
- Buscar en el frontend que no queden referencias a `99.0.5.232`.

### Finding 4 - [P2] Explorer todavia no esta migrado al shell visual comun

**Archivo**: `apps/web/src/features/explorer/index.tsx:168-237`

**Problema**: Explorer renderiza su propio topbar, cards, search input, botones y hover styles inline en lugar de usar `AppPage`, `AppPageHeader`, `AppCard`, `app-input`, `app-button` y clases del template.

**Impacto**: La pantalla queda visualmente distinta del resto de la aplicacion y es mas fragil en responsive. Tambien aumenta el costo de mantener cambios globales de estilo.

**Mejor solucion**:
- Migrar Explorer a `AppPage` y `AppPageHeader`.
- Reemplazar topbar propio por acciones del header o una toolbar del template.
- Convertir cards de aplicaciones, paginas y componentes a `AppCard` o clases equivalentes.
- Mover hover/responsive al CSS compartido y evitar estilos inline salvo valores dinamicos indispensables.

**Verificacion sugerida**:
- Revisar Explorer en desktop y mobile con Playwright.
- Confirmar que no haya topbar duplicado dentro de la pagina.
- Confirmar que inputs, botones y cards usen las clases del template.

### Finding 5 - [P2] Pantallas de analisis siguen con grids fijos sin breakpoint local

**Archivo principal observado**: `apps/web/src/features/schema-inspector/components/SchemaExplorer.tsx:12`

**Archivos relacionados**:
- `apps/web/src/features/auto-docs/components/DocsGenerator.tsx`
- `apps/web/src/features/dashboards/components/OverviewDashboard.tsx`
- `apps/web/src/features/issues/components/IssueDetail.tsx`
- `apps/web/src/features/dependency-analyzer/components/DependencyGraph.tsx`
- `apps/web/src/features/release-manager/components/ReleasePipeline.tsx`
- `apps/web/src/features/code-factory/components/CodeFactoryWorkspace.tsx`
- `apps/web/src/features/admin/components/TenantManagement.tsx`
- `apps/web/src/features/admin/components/LLMProviders.tsx`
- `apps/web/src/features/admin/components/SSOConfig.tsx`

**Problema**: Aun existen composiciones con columnas rigidas como `280px 1fr`, `320px 1fr` y `1fr 1fr` sin breakpoint local claro. Aunque algunas pantallas tengan wrappers, estos estilos inline pueden comprimir contenido o generar scroll incomodo en mobile.

**Impacto**: La migracion visual queda incompleta y varias pantallas de trabajo pueden sentirse rotas o dificiles de usar en pantallas medianas y pequenas.

**Mejor solucion**:
- Reemplazar grids rigidos por clases responsive compartidas, por ejemplo `app-responsive-two-column`, `app-grid` o variantes del template.
- Para paneles laterales, usar layout que pase a una columna en mobile y limite anchos con `minmax()`/`min()`.
- Extraer estilos de layout repetidos a `app-template.css`.

**Verificacion sugerida**:
- Ejecutar pruebas visuales en anchos de 1440, 1024, 768 y 390 px.
- Confirmar que no haya contenido comprimido, scroll horizontal accidental ni paneles inutilizables.
- Buscar `gridTemplateColumns: '280px 1fr'`, `gridTemplateColumns: '320px 1fr'` y `gridTemplateColumns: '1fr 1fr'` para cerrar la deuda.

## Orden Recomendado de Correccion

1. Corregir el interceptor `401` para evitar logout global por errores no fatales.
2. Eliminar el placeholder visible de Connections y renderizar historial real o empty state.
3. Quitar URL hardcodeada de Explorer y conectar el launch URL a datos reales de conexion/backend.
4. Migrar Explorer al template comun.
5. Barrer pantallas con grids fijos y convertirlas a layouts responsive compartidos.

## Estado

**Estado actual**: Pendiente de correccion.

**Criterio de cierre**: Los hallazgos deben quedar corregidos y validados con typecheck/build y una revision visual en desktop/mobile.
