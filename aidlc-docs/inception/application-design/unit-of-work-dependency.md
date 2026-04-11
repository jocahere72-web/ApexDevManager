# Unit Dependency Matrix -- APEX Dev Manager

## Document Information

| Field | Value |
|-------|-------|
| **Project** | APEX Dev Manager |
| **Version** | 1.0 |
| **Date** | 2026-04-10 |
| **Status** | AI-DLC Generated -- For Review |
| **Total Units** | 13 (U1-U13) |

---

## 1. Dependency Matrix

### 1.1 Full Dependency Table

| Unit | Name | Depends On | Blocks | Sprint |
|------|------|-----------|--------|--------|
| U1 | Foundation Infrastructure | None | U2 | Fase 0 |
| U2 | Auth and Core Backend | U1 | U3, U11, U13 | S1 |
| U3 | Connection UI and Explorer | U2 | U4, U6, U7, U11 | S2 |
| U4 | Code Editor Studio | U3 | U5, U7, U9 | S3 |
| U5 | AI Engine | U4 | U6, U8, U10, U12 | S4 |
| U6 | PRD Suite | U5, U3 | U12 | S5 |
| U7 | Change Tracking and Schema | U4, U3 | U8, U9 | S6 |
| U8 | Release Pipeline and AI Safety | U7, U5 | U12 | S7 |
| U9 | Analysis and Documentation | U7, U4 | U10 | S8 |
| U10 | Testing and Knowledge | U5, U9 | (none critical) | S9 |
| U11 | Intelligence and Observability | U2, U1 | (none critical) | S10 |
| U12 | Code Factory and Marketplace | U6, U5, U8 | (none critical) | S11 |
| U13 | SaaS Readiness | All (U1-U12) | None | S12 |

### 1.2 Dependency Adjacency Matrix

```
         U1  U2  U3  U4  U5  U6  U7  U8  U9  U10 U11 U12 U13
U1  (-)   .   .   .   .   .   .   .   .   .   .   .   .
U2   D   (-)  .   .   .   .   .   .   .   .   .   .   .
U3   .    D  (-)  .   .   .   .   .   .   .   .   .   .
U4   .    .   D  (-)  .   .   .   .   .   .   .   .   .
U5   .    .   .   D  (-)  .   .   .   .   .   .   .   .
U6   .    .   D   .   D  (-)  .   .   .   .   .   .   .
U7   .    .   D   D   .   .  (-)  .   .   .   .   .   .
U8   .    .   .   .   D   .   D  (-)  .   .   .   .   .
U9   .    .   .   D   .   .   D   .  (-)  .   .   .   .
U10  .    .   .   .   D   .   .   .   D  (-)  .   .   .
U11  D    D   .   .   .   .   .   .   .   .  (-)  .   .
U12  .    .   .   .   D   D   .   D   .   .   .  (-)  .
U13  D    D   D   D   D   D   D   D   D   D   D   D  (-)

Legend: D = depends on (row depends on column), . = no dependency
```

---

## 2. Critical Path Analysis

### 2.1 Primary Critical Path

The longest chain of sequential dependencies determines the minimum project duration.

```
U1 (3w) --> U2 (2w) --> U3 (2w) --> U4 (2w) --> U5 (2w) --> U7 (2w) --> U8 (2w) --> U12 (2w) --> U13 (3w)
                                                    |
                                                    +--> U6 (2w) --> U12 (2w)
```

**Critical path duration**: U1(3) + U2(2) + U3(2) + U4(2) + U5(2) + U7(2) + U8(2) + U12(2) + U13(3) = **20 weeks** minimum

Note: The scheduled duration is 29 weeks because the team executes units serially (2-3 developers working on one unit at a time). The critical path represents the theoretical minimum if unlimited parallel capacity were available.

### 2.2 Critical Path Visualization

```
Week:  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
       |--U1---|  |--U2--|  |--U3--|  |--U4--|  |--U5--|  |--U6--|  |--U7--|  |--U8--|
       [CRIT]     [CRIT]    [CRIT]    [CRIT]    [CRIT]              [CRIT]    [CRIT]
                                                                                       |--U9--|
                                                                                       |--U10-|
                                                         |--U11--|
                                                                              |--U12--|  |--U13---|
                                                                              [CRIT]     [CRIT]
```

### 2.3 Secondary Paths

| Path | Chain | Total Duration |
|------|-------|---------------|
| **Path A (Critical)** | U1 > U2 > U3 > U4 > U5 > U7 > U8 > U12 > U13 | 20 weeks |
| **Path B** | U1 > U2 > U3 > U4 > U5 > U6 > U12 > U13 | 18 weeks |
| **Path C** | U1 > U2 > U3 > U4 > U7 > U9 > U10 > U13 | 18 weeks |
| **Path D** | U1 > U2 > U3 > U4 > U5 > U10 > U13 | 16 weeks |
| **Path E** | U1 > U2 > U11 > U13 | 10 weeks |

### 2.4 Float Analysis

Units NOT on the critical path have scheduling flexibility (float):

| Unit | Earliest Start | Latest Start | Float |
|------|---------------|-------------|-------|
| U6 (PRD Suite) | After U5 (Week 12) | Week 22 (before U12) | 10 weeks |
| U9 (Analysis & Docs) | After U7 (Week 16) | Week 18 (before U10) | 2 weeks |
| U10 (Testing & Knowledge) | After U9 (Week 18) | Week 24 (before U13) | 4 weeks |
| U11 (Intelligence) | After U2 (Week 6) | Week 24 (before U13) | 18 weeks |

---

## 3. Build Order

### 3.1 Strict Sequential Order (Current Plan -- 2-3 Developers)

This is the planned execution order for the team of 2-3 developers working on one unit at a time:

```
Order  Unit  Name                          Phase   Weeks     Gate
-----  ----  ----------------------------  ------  --------  ----
  1    U1    Foundation Infrastructure      Fase 0  W01-W03   --|
                                                               | Fase 0 Gate
  2    U2    Auth and Core Backend          S1      W04-W05   --|
  3    U3    Connection UI and Explorer     S2      W06-W07     |
  4    U4    Code Editor Studio             S3      W08-W09     |
  5    U5    AI Engine                      S4      W10-W11   --|  Fase 1 Gate
  6    U6    PRD Suite                      S5      W12-W13   --|
  7    U7    Change Tracking and Schema     S6      W14-W15     |
  8    U8    Release Pipeline and AI Safety S7      W16-W17     |
  9    U9    Analysis and Documentation     S8      W18-W19     |
 10    U10   Testing and Knowledge          S9      W20-W21   --|  Fase 2 Gate
 11    U11   Intelligence and Observability S10     W22-W23   --|
 12    U12   Code Factory and Marketplace   S11     W24-W25     |
 13    U13   SaaS Readiness                 S12     W26-W29   --|  Fase 3 Gate
```

### 3.2 Minimum Viable Build Order

If the team needs to deliver the absolute minimum viable product sooner, this is the essential chain:

```
U1 --> U2 --> U3 --> U4 --> U5
```

This produces a Core MVP (Fase 1 Gate) with auth, connections, explorer, editor, and AI assistance in 11 weeks.

---

## 4. Parallel Opportunities

### 4.1 Parallelization with 2 Teams (4-6 Developers)

If the team grows to 4-6 developers (2 teams of 2-3), these units can run in parallel:

```
Week:  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23

Team A: |--U1--|  |--U2--|  |--U3--|  |--U4--|  |--U5--|  |--U7--|  |--U8--|  |--U12-|  |--U13--|
Team B:                                                   |--U6--|  |--U9--|  |--U10-|  |--U11-|
```

**Parallel pairs (safe to execute simultaneously):**

| Sprint | Team A | Team B | Why Safe |
|--------|--------|--------|----------|
| S5 (W12-13) | U7 (Change & Schema) | U6 (PRD Suite) | Both depend on U5 but not on each other |
| S6 (W14-15) | U8 (Release & Safety) | U9 (Analysis & Docs) | U8 depends on U7; U9 depends on U7. No inter-dependency |
| S7 (W16-17) | U12 (Factory & Market) | U10 (Testing & Knowledge) | U12 needs U6+U8; U10 needs U9. No inter-dependency |
| S8 (W18-19) | U13 (SaaS Readiness) | U11 (Intelligence) | U11 has minimal deps (U1+U2 only); can run alongside U13 start |

**Result**: Reduces total duration from 29 weeks to approximately 23 weeks (20% reduction).

### 4.2 Parallelization with 3 Teams (6-9 Developers)

With three teams, further compression is possible:

```
Week:  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21

Team A: |--U1--|  |--U2--|  |--U3--|  |--U4--|  |--U5--|  |--U8--|  |--U12-|  |--U13--|
Team B:                                                   |--U7--|  |--U9--|  |--U10-|
Team C:                              |----U11----|        |--U6--|  |---------|
```

**Result**: Reduces total duration to approximately 21 weeks (28% reduction).

### 4.3 Parallelization Constraints

These units CANNOT run in parallel due to hard dependencies:

| Constraint | Reason |
|-----------|--------|
| U2 must finish before U3 starts | U3 UI consumes U2 backend APIs |
| U3 must finish before U4 starts | U4 editor integrates with U3 explorer |
| U4 must finish before U5 starts | U5 AI inserts code into U4 editor |
| U5 must finish before U8 starts | U8 upgrades M10 stub from U5 to full |
| U7 must finish before U8 starts | U8 deployment uses U7 change sets |
| All units must finish before U13 | U13 is cross-cutting SaaS hardening |

### 4.4 Independent Units (Flexible Scheduling)

These units have the most scheduling flexibility due to minimal downstream dependencies:

| Unit | Earliest Possible Start | Can Overlap With |
|------|------------------------|-----------------|
| U11 (Intelligence) | After U2 (Week 6) | Any unit from U3 onward |
| U9 (Analysis & Docs) | After U7 (Week 16) | U8, U10, U11 |
| U10 (Testing & Knowledge) | After U9 (Week 18) | U11, U12 |

---

## 5. Dependency Justification

### 5.1 Why Each Dependency Exists

| Dependency | Technical Justification |
|-----------|------------------------|
| U2 depends on U1 | Auth service needs PostgreSQL (users/roles tables), Redis (sessions), OKE (deployment target) |
| U3 depends on U2 | Connection UI needs auth middleware; Explorer needs authenticated ORDS connections |
| U4 depends on U3 | Editor opens components from Explorer tree; needs MCP connection for metadata |
| U5 depends on U4 | AI generates code that is inserted into the Editor; needs editor as rendering target |
| U6 depends on U5+U3 | PRD-to-Page uses AI for requirements generation; Explorer provides page context |
| U7 depends on U4+U3 | Change Manager tracks changes made in Editor; Schema Inspector uses connections |
| U8 depends on U7+U5 | Release Manager deploys change sets from M6; M10 full upgrades M10 stub from U5 |
| U9 depends on U7+U4 | Dependency Analyzer uses M7 schema data; Doc generator uses M3 editor context |
| U10 depends on U5+U9 | Test generator uses M4 AI; needs M11 dependency data for coverage analysis |
| U11 depends on U2+U1 | Cost tracking needs user/tenant data from M0; observability needs OCI infra |
| U12 depends on U6+U5+U8 | Code Factory uses PRD from M8, AI from M4, and deployment from M9 |
| U13 depends on All | SaaS readiness is cross-cutting; requires all modules operational for integration testing |

### 5.2 Soft vs Hard Dependencies

| Type | Dependencies | Implication |
|------|-------------|------------|
| **Hard** (blocking) | U1>U2, U2>U3, U3>U4, U4>U5, U7>U8, All>U13 | Cannot start without predecessor completion |
| **Soft** (can stub) | U5>U6, U5>U10, U4>U9, U2>U11 | Could start with stubs/mocks if team grows |

---

## 6. Risk to Critical Path

### 6.1 High-Risk Units on Critical Path

| Unit | Risk | Impact on Schedule | Mitigation |
|------|------|-------------------|------------|
| U1 | OKE provisioning delays | Delays entire project by same duration | Pre-request OCI limits; test Terraform in sandbox |
| U3 | MCP protocol instability | Blocks U4, U5, and all downstream | Build ORDS fallback; document MCP gaps in Week 1 |
| U5 | Claude API rate limits | Blocks U6, U8, U10, U12 | Tenant-level rate limiting; budget alerts |
| U8 | ORDS deployment reliability | Blocks U12 | Retry with backoff; per-object error handling |

### 6.2 Schedule Buffer Recommendation

| Phase | Planned | Buffer | Total |
|-------|---------|--------|-------|
| Fase 0 | 3 weeks | 0 weeks (absorbed internally) | 3 weeks |
| Fase 1 | 8 weeks | 1 week (MCP/AI risk) | 9 weeks |
| Fase 2 | 10 weeks | 1 week (deployment complexity) | 11 weeks |
| Fase 3 | 8 weeks | Already includes 2-week hardening buffer | 8 weeks |
| **Total** | **29 weeks** | **2 weeks** | **31 weeks** |
