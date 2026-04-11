---
name: start-unit
description: Start a construction unit (U1-U13) — validates dependencies, shows context, creates epic branch
user-invocable: true
allowed-tools: Bash(git *) Bash(python3 scripts/*) Read Glob Grep
argument-hint: "<UNIT_ID> (e.g., U1, U5, U13)"
---

# Start Unit

Begin work on a construction unit for APEX Dev Manager.

## Unit Registry

| Unit | Name | Modules | Linear Epics | Dependencies | Weeks |
|------|------|---------|-------------|-------------|-------|
| U1 | Foundation Infrastructure | Infra | NUE-33 | None | 1-3 |
| U2 | Auth & Core Backend | M0, M1-BE | NUE-34, NUE-35 | U1 |4-5 |
| U3 | Connection UI & Explorer | M1-UI, M2 | NUE-35, NUE-36 | U2 | 6-7 |
| U4 | Code Editor | M3 | NUE-37 | U3 | 8-9 |
| U5 | AI Engine | M4, M10-stub | NUE-38, NUE-44 | U4 | 10-11 |
| U6 | PRD Suite | M8, M5 | NUE-39, NUE-40 | U5 | 12-13 |
| U7 | Change & Schema | M6, M7 | NUE-41, NUE-42 | U4 | 14-15 |
| U8 | Release & Safety | M9, M10-full | NUE-43, NUE-44 | U7 | 16-19 |
| U9 | Analysis & Docs | M11, M12 | NUE-45, NUE-46 | U7 | 20-21 |
| U10 | Testing & Knowledge | M13, M14 | NUE-47, NUE-48 | U5 | 22-23 |
| U11 | Intelligence & Observability | M15, M17 | NUE-49, NUE-51 | U3 | 24-25 |
| U12 | Factory & Marketplace | M16, M18 | NUE-50, NUE-52 | U6 | 26-27 |
| U13 | SaaS Readiness | All (hardening) | NUE-53 | ALL | 28-29 |

## Dependency Map

```
U1 → U2 → U3 → U4 → U5 → U6 → U12
                  │         └→ U10
                  ├→ U4 → U7 → U8
                  │         └→ U9
                  ├→ U11
                  └→ U13 (needs ALL)
```

## Steps

1. **Parse the unit ID** from `$ARGUMENTS` (e.g., `U5`, `u5`, `5` → `U5`).

2. **Validate dependencies**:
   - Look up the unit in the registry above
   - Check if dependency units are complete by querying Linear:
     ```bash
     python3 scripts/linear_client.py get <DEPENDENCY_EPIC_ID>
     ```
   - If a dependency epic is NOT in "Done" state:
     - **WARN** the user: "Unit U5 depends on U4 (NUE-37). U4 is currently in [state]. Proceed anyway?"
     - If user says no, stop.
   - If dependencies are met, confirm and proceed.

3. **Show unit context**:
   - Read the functional design:
     ```
     aidlc-docs/construction/<unit-folder>/functional-design/functional-design.md
     ```
   - Read the code generation plan:
     ```
     aidlc-docs/construction/<unit-folder>/code/code-generation-plan.md
     ```
   - Display: unit name, modules, key deliverables, entry/exit criteria, components involved.

4. **Create unit branch**:
   ```bash
   git checkout main
   git pull origin main
   git checkout -b unit/<unit-id>-<unit-slug>
   ```
   Example: `unit/u5-ai-engine`

5. **Move all related epics to In Progress** in Linear:
   ```bash
   python3 scripts/linear_client.py move <EPIC_ID> "In Progress"
   ```

6. **Report to user**:
   ```
   ════════════════════════════════════════
     Unit U5: AI Engine — STARTED
   ════════════════════════════════════════

   Branch: unit/u5-ai-engine
   Modules: M4 (AI Studio), M10-stub (AI Governance)
   Epics: NUE-38, NUE-44 → In Progress

   Dependencies: U4 (Code Editor) ✅ Done

   Key Deliverables:
   - [ ] Claude API client with tenant-level rate limiting
   - [ ] Context-aware code generation
   - [ ] Prompt template management
   - [ ] AI Governance stub (audit logging)

   Next: Read the code generation plan and start implementing.
   Use /start-issue NUE-XX for individual tasks within this unit.
   ════════════════════════════════════════
   ```

## Unit Folder Mapping

| Unit | Folder |
|------|--------|
| U1 | `u1-foundation` |
| U2 | `u2-auth-core` |
| U3 | `u3-explorer-ui` |
| U4 | `u4-editor` |
| U5 | `u5-ai-engine` |
| U6 | `u6-prd-suite` |
| U7 | `u7-change-schema` |
| U8 | `u8-release-safety` |
| U9 | `u9-analysis-docs` |
| U10 | `u10-testing-knowledge` |
| U11 | `u11-intelligence` |
| U12 | `u12-factory-market` |
| U13 | `u13-saas-readiness` |

## Rules

- ALWAYS validate dependencies before starting a unit.
- ALWAYS show the functional design summary before coding begins.
- Each unit gets its own long-lived branch (`unit/uX-name`).
- Individual issues within the unit use feature branches off the unit branch.
- When the unit is complete, create a PR from the unit branch to main.
- The user can override dependency warnings but they must explicitly confirm.
