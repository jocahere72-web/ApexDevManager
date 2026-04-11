# Unit-to-Story Mapping -- APEX Dev Manager

## Document Information

| Field | Value |
|-------|-------|
| **Project** | APEX Dev Manager |
| **Version** | 1.0 |
| **Date** | 2026-04-10 |
| **Status** | AI-DLC Generated -- For Review |
| **Total Stories** | 57 |
| **Total Units** | 13 |

---

## 1. Complete Story-to-Unit Mapping

| Story ID | Story Title | Unit | Module | Priority |
|----------|-------------|------|--------|----------|
| US-001 | Platform Tenant Provisioning | U1 | Cross-cutting | MUST |
| US-002 | Environment Baseline Configuration | U1 | Cross-cutting | MUST |
| US-003 | Single Sign-On Authentication | U2 | M0 | MUST |
| US-004 | Role-Based Access Enforcement | U2 | M0 | MUST |
| US-005 | Session Activity Audit Trail | U2 | M0 | SHOULD |
| US-006 | APEX Instance Connection Setup | U2 (BE) / U3 (UI) | M1 | MUST |
| US-007 | Connection Health Monitoring | U2 (BE) / U3 (UI) | M1 | SHOULD |
| US-008 | Application Tree Navigation | U3 | M2 | MUST |
| US-009 | Application Component Comparison | U3 | M2 | SHOULD |
| US-010 | PL/SQL Code Editing with Syntax Support | U4 | M3 | MUST |
| US-011 | Code Review and Annotation | U4 | M3 | SHOULD |
| US-012 | AI-Assisted Code Generation | U5 | M4 | MUST |
| US-013 | AI Chat Contextual Assistance | U5 | M4 | MUST |
| US-014 | Product Requirements Document Creation | U6 | M8 | MUST |
| US-015 | AI-Assisted Requirements Generation | U6 | M8 | SHOULD |
| US-016 | Automated APEX Page Scaffolding from PRD | U6 | M5 | MUST |
| US-017 | Page Generation Preview and Customization | U6 | M5 | SHOULD |
| US-018 | Change Set Creation and Tracking | U7 | M6 | MUST |
| US-019 | Change Impact Visualization | U7 | M6 | SHOULD |
| US-020 | Database Schema Browsing and Search | U7 | M7 | MUST |
| US-021 | Visual Entity-Relationship Diagram | U7 | M7 | COULD |
| US-022 | Release Pipeline Configuration | U8 | M9 | MUST |
| US-023 | Deployment Execution and Rollback | U8 | M9 | MUST |
| US-024 | Deployment Audit and History | U8 | M9 | SHOULD |
| US-025 | AI Usage Policy Configuration | U5 (stub) / U8 (full) | M10 | MUST |
| US-026 | AI Interaction Audit and Compliance Report | U8 | M10 | MUST |
| US-027 | Object Dependency Graph | U9 | M11 | MUST |
| US-028 | Change Impact Assessment | U9 | M11 | MUST |
| US-029 | Automated Code Documentation Generation | U9 | M12 | MUST |
| US-030 | Application-Level Documentation | U9 | M12 | SHOULD |
| US-031 | Unit Test Generation for PL/SQL | U10 | M13 | MUST |
| US-032 | Test Execution Dashboard | U10 | M13 | SHOULD |
| US-033 | Test Case Management | U10 | M13 | SHOULD |
| US-034 | Knowledge Base Content Curation | U10 | M14 | MUST |
| US-035 | Knowledge Base Analytics | U10 | M14 | COULD |
| US-036 | Platform Usage Analytics | U11 | M15 | MUST |
| US-037 | Cost Allocation by Team and Project | U11 | M15 | SHOULD |
| US-038 | End-to-End Application Generation from PRD | U12 | M16 | MUST |
| US-039 | Code Generation Template Customization | U12 | M16 | SHOULD |
| US-040 | Application Performance Dashboard | U11 | M17 | MUST |
| US-041 | Incident Management and Tracking | U11 | M17 | SHOULD |
| US-042 | Application Health Observability | U11 | M17 | COULD |
| US-043 | Accelerator Package Browsing and Installation | U12 | M18 | MUST |
| US-044 | Accelerator Package Publishing | U12 | M18 | MUST |
| US-045 | Multi-Tenant Data Isolation | U13 | Cross-cutting | MUST |
| US-046 | Subscription and Licensing Management | U13 | Cross-cutting | MUST |
| US-047 | Platform-Wide Search | U3 | M2 | SHOULD |
| US-048 | Notification Center | U13 | M0 | SHOULD |
| US-049 | Bulk Export and Backup | U8 | M9 | MUST |
| US-050 | Real-Time Collaboration Indicators | U4 | M3 | COULD |
| US-051 | Schema Change Script Generation | U7 | M7 | SHOULD |
| US-052 | AI Model Selection and Configuration | U5 | M4 | MUST |
| US-053 | Dependency Scanner for Security Vulnerabilities | U9 | M11 | SHOULD |
| US-054 | Auto Documentation for APEX Pages | U9 | M12 | COULD |
| US-055 | Test Data Generation | U10 | M13 | SHOULD |
| US-056 | Knowledge Article Approval Workflow | U10 | M14 | SHOULD |
| US-057 | Custom Dashboard Builder | U11 | M17 | COULD |

---

## 2. Stories per Unit Summary

| Unit | Name | Stories | MUST | SHOULD | COULD | Total |
|------|------|---------|------|--------|-------|-------|
| U1 | Foundation Infrastructure | US-001, US-002 | 2 | 0 | 0 | 2 |
| U2 | Auth and Core Backend | US-003, US-004, US-005, US-006 (BE), US-007 (BE) | 3 | 2 | 0 | 5 |
| U3 | Connection UI and Explorer | US-006 (UI), US-007 (UI), US-008, US-009, US-047 | 2 | 3 | 0 | 5 |
| U4 | Code Editor Studio | US-010, US-011, US-050 | 1 | 1 | 1 | 3 |
| U5 | AI Engine | US-012, US-013, US-025 (stub), US-052 | 4 | 0 | 0 | 4 |
| U6 | PRD Suite | US-014, US-015, US-016, US-017 | 2 | 2 | 0 | 4 |
| U7 | Change Tracking and Schema | US-018, US-019, US-020, US-021, US-051 | 2 | 2 | 1 | 5 |
| U8 | Release Pipeline and AI Safety | US-022, US-023, US-024, US-025 (full), US-026, US-049 | 5 | 1 | 0 | 6 |
| U9 | Analysis and Documentation | US-027, US-028, US-029, US-030, US-053, US-054 | 3 | 2 | 1 | 6 |
| U10 | Testing and Knowledge | US-031, US-032, US-033, US-034, US-035, US-055, US-056 | 2 | 3 | 1 | 7* |
| U11 | Intelligence and Observability | US-036, US-037, US-040, US-041, US-042, US-057 | 2 | 2 | 2 | 6 |
| U12 | Code Factory and Marketplace | US-038, US-039, US-043, US-044 | 3 | 1 | 0 | 4 |
| U13 | SaaS Readiness | US-045, US-046, US-048 | 2 | 1 | 0 | 3 |
| **Total** | | | **33** | **20** | **6** | **57*** |

*Note: US-006 and US-007 span two units (backend in U2, UI in U3). US-025 spans two units (stub in U5, full in U8). Each is counted once in the total but appears in both unit rows.

---

## 3. Module-to-Unit Coverage

| Module | Name | Primary Unit | Stories |
|--------|------|-------------|---------|
| -- | Cross-cutting (Infrastructure) | U1 | US-001, US-002 |
| M0 | Authentication & Session Management | U2 | US-003, US-004, US-005, US-048 |
| M1 | Connection Manager | U2 (BE) / U3 (UI) | US-006, US-007 |
| M2 | Application Explorer | U3 | US-008, US-009, US-047 |
| M3 | Code Editor Studio | U4 | US-010, US-011, US-050 |
| M4 | AI Studio | U5 | US-012, US-013, US-052 |
| M5 | PRD-to-Page Generator | U6 | US-016, US-017 |
| M6 | Change Manager | U7 | US-018, US-019 |
| M7 | Schema Inspector | U7 | US-020, US-021, US-051 |
| M8 | PRD Builder | U6 | US-014, US-015 |
| M9 | Release & Deployment Manager | U8 | US-022, US-023, US-024, US-049 |
| M10 | AI Governance & Safety Engine | U5 (stub) / U8 (full) | US-025, US-026 |
| M11 | Dependency & Impact Analyzer | U9 | US-027, US-028, US-053 |
| M12 | Auto Documentation Studio | U9 | US-029, US-030, US-054 |
| M13 | Test Automation Studio | U10 | US-031, US-032, US-033, US-055 |
| M14 | GENESYS Knowledge Engine | U10 | US-034, US-035, US-056 |
| M15 | Usage & Cost Intelligence | U11 | US-036, US-037 |
| M16 | Full Code Generation Factory | U12 | US-038, US-039 |
| M17 | Product Intelligence Dashboard | U11 | US-040, US-041, US-042, US-057 |
| M18 | Accelerators Marketplace | U12 | US-043, US-044 |
| -- | Cross-cutting (SaaS) | U13 | US-045, US-046, US-048 |

---

## 4. Priority Distribution by Phase

### Fase 0 (U1)

| Priority | Count | Stories |
|----------|-------|---------|
| MUST | 2 | US-001, US-002 |
| **Total** | **2** | |

### Fase 1 (U2-U5)

| Priority | Count | Stories |
|----------|-------|---------|
| MUST | 10 | US-003, US-004, US-006, US-008, US-010, US-012, US-013, US-025 (stub), US-052 |
| SHOULD | 5 | US-005, US-007, US-009, US-011, US-047 |
| COULD | 1 | US-050 |
| **Total** | **17** | |

### Fase 2 (U6-U10)

| Priority | Count | Stories |
|----------|-------|---------|
| MUST | 14 | US-014, US-016, US-018, US-020, US-022, US-023, US-025 (full), US-026, US-027, US-028, US-029, US-031, US-034, US-049 |
| SHOULD | 10 | US-015, US-017, US-019, US-024, US-030, US-032, US-033, US-051, US-053, US-055, US-056 |
| COULD | 3 | US-021, US-035, US-054 |
| **Total** | **28** | |

### Fase 3 (U11-U13)

| Priority | Count | Stories |
|----------|-------|---------|
| MUST | 7 | US-036, US-038, US-040, US-043, US-044, US-045, US-046 |
| SHOULD | 3 | US-037, US-041, US-048 |
| COULD | 2 | US-042, US-057 |
| **Total** | **13** | |

---

## 5. Verification

### 5.1 Story Count Verification

- Total unique stories: 57 (US-001 through US-057)
- Stories assigned to at least one unit: 57
- Stories assigned to no unit: 0
- Stories spanning multiple units: 3 (US-006, US-007, US-025) -- split by BE/UI or stub/full

### 5.2 Priority Totals

| Priority | Count | Percentage |
|----------|-------|-----------|
| MUST | 33 | 57.9% |
| SHOULD | 18 | 31.6% |
| COULD | 6 | 10.5% |
| **Total** | **57** | **100%** |

### 5.3 Sprint Load Distribution

| Sprint | Unit | Story Count | MUST Count | Complexity Assessment |
|--------|------|-------------|-----------|----------------------|
| Fase 0 | U1 | 2 | 2 | High (infrastructure provisioning) |
| S1 | U2 | 5 | 3 | High (auth + RBAC + RLS foundation) |
| S2 | U3 | 5 | 2 | High (MCP integration + tree component) |
| S3 | U4 | 3 | 1 | Medium (Monaco Editor integration) |
| S4 | U5 | 4 | 4 | High (AI integration + governance stub) |
| S5 | U6 | 4 | 2 | Medium (PRD templates + page generation) |
| S6 | U7 | 5 | 2 | High (change tracking + schema browser) |
| S7 | U8 | 6 | 5 | High (deployment pipeline + M10 full) |
| S8 | U9 | 6 | 3 | Medium (analysis + documentation) |
| S9 | U10 | 7 | 2 | Medium (test gen + knowledge engine) |
| S10 | U11 | 6 | 2 | Medium (dashboards + observability) |
| S11 | U12 | 4 | 3 | High (end-to-end code gen + marketplace) |
| S12 | U13 | 3 | 2 | High (cross-cutting SaaS hardening) |
