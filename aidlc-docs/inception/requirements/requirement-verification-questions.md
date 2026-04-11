# Requirements Verification Questions — APEX Dev Manager

Please answer the following questions to help complete the enterprise specification.
The PRD v5.1 has been analyzed. These questions address **gaps and ambiguities** identified.

---

## Question 1
The PRD defines 19 modules (M0-M18) but does NOT include an **OCI Observability Center** (your module F: performance, sessions, errors, traces, logs, DB health, ORDS health, alerts). How should this be handled?

A) Add a new module M19 — OCI Observability Center as a standalone module with full specification
B) Expand M17 (Product Intelligence Dashboard) to absorb observability features alongside productivity metrics
C) Distribute observability features across existing modules (M1 health checks, M15 cost monitoring, M17 dashboards)
D) The OCI Observability Center is a top priority — make it M6b or renumber to fit in the Fase 2 roadmap
X) Other (please describe after [Answer]: tag below)

[Answer]:

--b-

## Question 2
Your prompt mentions an **AI Support Copilot** (module I: incident analysis, root cause analysis, correction suggestions, change-incident correlation). The PRD does not have a dedicated support/incident module. How should this be addressed?

A) Add a new module M20 — AI Support Copilot with incident management, RCA, and correlation engine
B) Extend M4 AI Studio to include support/incident analysis capabilities alongside code assistance
C) Build it as part of M17 Product Intelligence Dashboard with an "Incidents" panel
D) Defer to Fase 3 as part of the Operations Phase expansion
X) Other (please describe after [Answer]: tag below)

[Answer]:

--c-

## Question 3
The PRD specifies **PostgreSQL** as the control plane database and Oracle DB only for client APEX instances. Should APEX Dev Manager itself be built as an Oracle APEX application or remain as a React + Node.js SPA?

A) React + Node.js + PostgreSQL as specified in the PRD (current architecture)
B) Oracle APEX application running on Oracle DB (dogfooding the target platform)
C) Hybrid: React frontend with Oracle DB backend instead of PostgreSQL
D) React frontend with both Oracle DB (for APEX metadata) and PostgreSQL (for control plane)
X) Other (please describe after [Answer]: tag below)

[Answer]:

-a--

## Question 4
For the **Security Extension** enforcement: Should all 15 SECURITY baseline rules (OWASP-mapped) be enforced as blocking constraints throughout the AI-DLC workflow?

A) Yes — enforce all SECURITY rules as blocking constraints (recommended for production-grade applications)
B) No — skip all SECURITY rules (suitable for PoCs, prototypes, and experimental projects)
X) Other (please describe after [Answer]: tag below)

[Answer]:

--a-

## Question 5
The PRD mentions **MCP Oracle APEX** for metadata reading. What is the current status of the MCP Oracle APEX server? This impacts the architecture design.

A) MCP Oracle APEX server already exists and is functional — design around it as primary integration
B) MCP Oracle APEX server is under development by I&T — design with MCP as primary but include ORDS/JDBC fallback
C) MCP Oracle APEX server does not exist yet — design with ORDS REST APIs as primary and plan MCP as future enhancement
D) Use a combination: ORDS for write operations, direct SQL queries via node-oracledb for metadata reads
X) Other (please describe after [Answer]: tag below)

[wer]:

-a-

## Question 6
The PRD defines **6 base roles** (admin, developer, tech_lead, release_manager, knowledge_editor, marketplace_publisher). **Decision: 3 additional roles added** (qa_analyst, devops_engineer, auditor) for a total of **9 roles**.

A) Keep the 6 roles as-is — the additional personas map to existing roles (e.g., DevOps = release_manager)
B) Add 2-3 new roles: qa_analyst, devops_engineer, and auditor
C) Add a flexible custom_role capability with granular permission assignment
D) Keep 6 base roles but add a super_admin role for I&T internal operations across all tenants
X) Other (please describe after [Answer]: tag below)

[Answer]:

--b-

## Question 7
For the **Backup/DR Strategy**, the PRD specifies RTO < 4 hours and RPO < 1 hour. What is the target OCI region topology?

A) Single OCI region (e.g., Bogota or Sao Paulo) with availability domain redundancy
B) Two OCI regions (primary + standby) with automated failover for DR
C) Single region initially (Fase 1-2), expand to multi-region in Fase 3 for SaaS clients
D) Client-dependent: each tenant can choose their OCI region
X) Other (please describe after [Answer]: tag below)

[Answer]:

--b-

## Question 8
The PRD does not specify a **Deployment Strategy** for the platform itself. How should APEX Dev Manager be deployed on OCI?

A) OCI Container Instances (serverless containers, simpler ops, lower cost for initial scale)
B) OKE — Oracle Kubernetes Engine (full Kubernetes, better for scaling to SaaS)
C) OCI Container Instances for Fase 1-2, migrate to OKE in Fase 3 for SaaS
D) OCI Compute VMs with Docker Compose (simplest, lowest cost)
X) Other (please describe after [Answer]: tag below)

[Answer]:

--b-

## Question 9
For the **Dashboard Principal** (your section 8), the PRD has M17 Product Intelligence Dashboard but it doesn't include all the indicators you listed (ecosystem health, active incidents, deployment failures, budget consumption, technical debt, AI alerts). Should the executive dashboard be:

A) A dedicated landing page (Home/Command Center) separate from M17, aggregating data from all modules
B) M17 expanded to be the single executive dashboard with all panels from your requirements
C) Two dashboards: Operational Command Center (real-time) + Executive Dashboard (M17, periodic reports)
D) Role-based dashboards: each role sees different panels on the same dashboard framework
X) Other (please describe after [Answer]: tag below)

[Answer]:

-c--

## Question 10
The PRD uses **Claude API (Anthropic)** exclusively for AI. Your prompt mentions "AI-native with specialized copilots." Should the architecture support:

A) Claude API exclusively — all AI capabilities powered by Claude models only
B) Claude API as primary with ability to plug in other LLM providers (OpenAI, OCI AI) for specific tasks
C) Claude API for code/reasoning tasks, OCI AI Services (Vision, Language) for document processing and classification
D) Multi-model architecture: Claude for code generation, a lighter model for classification/routing, OCI AI for document OCR
X) Other (please describe after [Answer]: tag below)

[Answer]:

--b-

## Question 11
For **multi-tenancy data isolation**, the PRD specifies PostgreSQL RLS (Row-Level Security). For SaaS scale in Fase 3, should the architecture plan for:

A) Shared database with RLS (as specified) — sufficient for 50+ tenants
B) Schema-per-tenant in a shared PostgreSQL instance
C) Database-per-tenant for maximum isolation (higher cost, better security posture for government clients)
D) Shared database with RLS for Fase 1-2, option to upgrade to database-per-tenant for Enterprise plan clients
X) Other (please describe after [Answer]: tag below)

[Answer]:

--a-

## Question 12
The PRD mentions **Oracle APEX 22.x/23.x/24.x** compatibility. Oracle APEX 24.x introduced significant changes (Workflow, new REST APIs). Should the specification:

A) Target APEX 23.x as the minimum supported version (simpler implementation)
B) Support APEX 22.x+ with feature flags for version-specific capabilities
C) Support APEX 22.x+ with a compatibility layer that detects version and adapts API calls
D) Target APEX 24.x as minimum and help clients upgrade as part of onboarding
X) Other (please describe after [Answer]: tag below)

[Answer]:

-b--

## Question 13
The PRD does not detail a **Logging Strategy** for the platform itself. What logging infrastructure should be specified?

A) OCI Logging Service exclusively (native integration, lower complexity)
B) Structured logging to stdout/stderr, collected by OCI Logging Agent into OCI Logging
C) ELK stack (Elasticsearch, Logstash, Kibana) on OCI for advanced search and dashboards
D) OCI Logging for infrastructure + application-level structured JSON logs stored in PostgreSQL for business audit
X) Other (please describe after [Answer]: tag below)

[Answer]:

--a-

## Question 14
For the **FinOps Model**, the PRD covers Claude API cost tracking (M15). Your prompt also mentions OCI cost tracking per environment, per app, per module, forecasting, and optimization. Should the FinOps module:

A) Track Claude API costs only (as in PRD M15) — OCI costs tracked externally via OCI Cost Analysis
B) Integrate with OCI Cost Analysis API to pull and attribute OCI costs per tenant/environment/app alongside Claude API costs
C) Full FinOps platform: OCI cost attribution + Claude API costs + forecasting + optimization recommendations + budget alerts
D) Option B for Fase 2, expand to Option C in Fase 3
X) Other (please describe after [Answer]: tag below)

[Answer]:

-a--

## Question 15
The specification requires **User Stories with Given/When/Then** for all epics. The PRD has acceptance criteria for some modules but not formal user stories. Given the 19 modules and ~160+ functional requirements, what is the expected story granularity?

A) One user story per functional requirement (RF-XX → US-XX) — approximately 160+ stories
B) Grouped user stories per module feature area (e.g., "Connection Management CRUD" = 1 story covering RF-01 to RF-08) — approximately 40-60 stories
C) Epic-level stories only (1-3 stories per module) with acceptance criteria mapping to RFs — approximately 30-50 stories
D) Full story map: epics, features, and user stories with complete traceability matrix — full decomposition
X) Other (please describe after [Answer]: tag below)

[Answer]:

-b--

## Question 16
What is the target **team size and composition** for building APEX Dev Manager? This impacts unit decomposition and parallelization strategy.

A) Small team (2-3 full-stack developers) — sequential development, minimal parallelization
B) Medium team (4-6 developers with specialization) — moderate parallelization by module group
C) Large team (7-10+ developers) — high parallelization, dedicated frontend/backend/AI/infra streams
D) AI-assisted development (1-2 developers + Claude Code) — AI handles code generation, humans review and integrate
X) Other (please describe after [Answer]: tag below)

[Answer]:

--a-

## Question 17
The PRD mentions the platform is for **Colombian public sector** (municipalities, tax departments). Are there specific Colombian compliance requirements that must be built into the specification?

A) No specific compliance — standard enterprise security is sufficient
B) Yes — Colombian data residency laws (Ley 1581 de 2012 - Habeas Data) must be enforced
C) Yes — Colombian data laws + sector-specific regulations (Contaduria General de la Nacion, CGN standards)
D) Yes — all of the above + SOC 2 Type II certification planned for SaaS phase
X) Other (please describe after [Answer]: tag below)

[Answer]:

--a-

## Question 18
For the **Anti-hallucination Strategy** (deliverable #33), should the specification include:

A) Basic guardrails: M10 Safety Engine output validation + structured prompts with schema grounding
B) Comprehensive strategy: output validation + confidence scoring + automated fact-checking against GENESYS schema + human review gates
C) Full anti-hallucination framework: all of B + regression testing of AI outputs + drift detection + automated prompt testing suite
D) Defer detailed anti-hallucination design to Construction phase — keep high-level strategy in requirements
X) Other (please describe after [Answer]: tag below)

[Answer]:

-c--
