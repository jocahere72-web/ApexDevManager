---
name: start-issue
description: Start work on a Linear issue — fetch details, create branch, move to In Progress
user-invocable: true
allowed-tools: Bash(git *) Bash(python3 scripts/*)
argument-hint: "<ISSUE_ID> (e.g., NUE-1)"
---

# Start Issue

Begin work on Linear issue `$ARGUMENTS`.

## Steps

1. **Fetch issue from Linear**:
   ```bash
   python3 scripts/linear_client.py get $0 --full
   ```
   Show the user: title, description, acceptance criteria.

2. **Determine branch type** from the issue title and labels:

   | Issue pattern | Branch prefix | Example |
   |--------------|---------------|---------|
   | New feature, epic, module | `feat/` | `feat/NUE-5-ai-studio` |
   | Bug fix, error, broken | `fix/` | `fix/NUE-12-login-crash` |
   | Refactor, cleanup, optimize | `refactor/` | `refactor/NUE-8-auth-middleware` |
   | Documentation, docs | `docs/` | `docs/NUE-15-api-reference` |
   | CI, build, tooling, infra | `chore/` | `chore/NUE-3-ci-pipeline` |
   | Tests, test coverage | `test/` | `test/NUE-20-rls-isolation` |

   Default to `feat/` if unclear.

3. **Create the branch** from main:
   ```bash
   git checkout main
   git pull origin main
   git checkout -b <prefix>/NUE-X-<slugified-title>
   ```
   Slug rules: lowercase, kebab-case, max 5 words from title.

4. **Move to In Progress** in Linear:
   ```bash
   python3 scripts/linear_client.py move $0 "In Progress"
   ```

5. **Confirm** to the user:
   ```
   Issue $0 started.
   Branch: <prefix>/NUE-X-<slug>
   Status: In Progress

   Acceptance Criteria:
   - [ ] criterion 1
   - [ ] criterion 2
   ```

## Rules

- NEVER start coding without running this skill first.
- If the issue does not exist, stop and inform the user.
- If already on a feature branch for this issue, skip branch creation.
- Always pull latest main before creating the branch.
- Branch name must include the issue ID for traceability.
