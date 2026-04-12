# Revision UI - Migracion pantalla por pantalla

## Estado actual

| Pantalla            | Estado          | Evidencia                                                                                                                 | Siguiente accion                                              |
| ------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| Login               | Migrada         | Usa `app-login-*`, `app-input`, `app-button`, `app-alert` y layout responsive.                                            | Verificar visual con Playwright.                              |
| Dashboard root      | Parcial         | Usa template base, pero conserva tarjetas internas propias.                                                               | Revisar metric cards y empty state.                           |
| Clients             | Parcial alto    | Header, busqueda, modal, empty state y cards usan template; aun quedan estilos inline menores en metadatos.               | Normalizar metadatos y contacto con clases helper.            |
| Issues              | Parcial         | Header, filtros, modal, tabla y cards migrados parcialmente; `IssueDetail` y kanban conservan estilos inline funcionales. | Terminar `IssueDetail`, `IssuePipeline` y columnas kanban.    |
| Connections list    | Migrada parcial | Lista usa `AppPage`, `AppCard`, inputs y tabla template.                                                                  | Revisar detalle/formulario y modal delete.                    |
| Explorer            | Parcial         | Usa `AppPage` y workspace shell, pero el arbol interno sigue con estilos/componentes propios y stubs funcionales.         | Migrar tree nodes, detail panel y estados vacios.             |
| Editor              | Parcial alto    | Toolbar y editor shell usan template.                                                                                     | Revisar componentes internos de editor/diff/changelog.        |
| AI Studio           | Parcial         | Workspace shell migrado, paneles internos siguen con estilos propios.                                                     | Migrar chat, conversaciones, quick actions y usage dashboard. |
| PRD Builder         | Parcial         | Lista y modal principal migrados; workspace PRD interno conserva mucho estilo inline.                                     | Migrar `PRDWorkspace` y session list.                         |
| PRD to Page         | Parcial         | Wrapper migrado, `PageGenerator` conserva layout propio.                                                                  | Migrar PageGenerator completo.                                |
| Change Manager      | Parcial bajo    | Wrapper migrado, list/detail conservan encabezados, tablas y cards propias.                                               | Migrar `ChangeSetList` y `ChangeSetDetail`.                   |
| Schema Inspector    | Parcial         | Wrapper y grid responsive aplicados, explorer interno conserva sidebar/header propio.                                     | Migrar sidebar, detail panel y states.                        |
| Release Manager     | Parcial bajo    | Wrapper migrado, list/pipeline conservan cards y headers viejos.                                                          | Migrar `ReleaseList` y `ReleasePipeline`.                     |
| AI Governance       | Parcial bajo    | Wrapper migrado, dashboard interno conserva h1/h2 y cards propias.                                                        | Migrar dashboard completo.                                    |
| Dependency Analyzer | Parcial         | Wrapper y responsive stats aplicados, sidebar interno conserva titulo/layout propio.                                      | Migrar graph/sidebar.                                         |
| Auto Docs           | Parcial bajo    | Wrapper migrado, generator mantiene `320px 1fr` y sidebar vieja.                                                          | Migrar `DocsGenerator`.                                       |
| Test Studio         | Parcial bajo    | Wrapper migrado, manager mantiene header/cards propios.                                                                   | Migrar `TestSuiteManager`.                                    |
| Knowledge Engine    | Parcial bajo    | Wrapper migrado, search component mantiene layout propio.                                                                 | Migrar search, tabs y learning side panel.                    |
| Usage Intelligence  | Parcial bajo    | Wrapper migrado, dashboard interno mantiene header/cards propios.                                                         | Migrar metric cards, export buttons y suggestions.            |
| Dashboards          | Parcial         | Wrapper/tabs migrados y un grid responsive aplicado, componentes internos siguen propios.                                 | Migrar OverviewDashboard e IncidentManager.                   |
| Code Factory        | Parcial         | Wrapper migrado y un grid responsive aplicado, workspace interno sigue propio.                                            | Migrar job list/output cards.                                 |
| Marketplace         | Parcial bajo    | Wrapper migrado, grid interno conserva header/cards/modal propios.                                                        | Migrar `MarketplaceGrid`.                                     |
| Admin               | Parcial         | Tabs y wrapper migrados, Tenant/SSO internos conservan mucho estilo propio.                                               | Migrar TenantManagement y SSOConfig.                          |

## Orden recomendado

1. Cerrar `Clients` e `Issues`.
2. Cerrar `Connections`, porque es flujo core junto con clientes/issues.
3. Cerrar pantallas workspace: `Explorer`, `AI Studio`, `Editor`, `PRD Builder`, `PRD to Page`.
4. Cerrar ALM/operacion: `Change Manager`, `Release Manager`, `Dashboards`, `Usage`.
5. Cerrar soporte: `Admin`, `Marketplace`, `Knowledge`, `Test Studio`, `Auto Docs`, `Dependency Analyzer`, `Schema Inspector`, `AI Governance`, `Code Factory`.
