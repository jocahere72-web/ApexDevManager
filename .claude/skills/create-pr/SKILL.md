---
name: create-pr
description: Create a GitHub PR with template, Linear issue link, diff summary, and checklist
user-invocable: true
allowed-tools: Bash(git *) Bash(gh *) Bash(python3 scripts/*)
argument-hint: "[ISSUE_ID] (e.g., NUE-5) — auto-detected from branch if omitted"
---

# Create Pull Request

Create a well-structured GitHub PR linking back to the Linear issue.

## Steps

1. **Detect issue ID** from branch name or argument:
   ```bash
   git branch --show-current
   ```
   Extract `NUE-XX` from branch name (e.g., `feat/NUE-5-ai-studio` → `NUE-5`).
   If `$ARGUMENTS` is provided, use that instead.

2. **Fetch issue context from Linear**:
   ```bash
   python3 scripts/linear_client.py get <ISSUE_ID> --full
   ```

3. **Analyze changes**:
   ```bash
   git log main..HEAD --oneline
   git diff --stat main...HEAD
   ```

4. **Build PR title**:
   Format: `<type>(<module>): <short description> [NUE-XX]`

   Types: `feat`, `fix`, `refactor`, `docs`, `chore`, `test`

   Examples:
   - `feat(ai-studio): implement Claude chat with context [NUE-38]`
   - `fix(auth): resolve token refresh race condition [NUE-34]`

5. **Build PR body** using this template:

   ```markdown
   ## Summary

   Brief description of what this PR does and why.

   ## Linear Issue

   **[NUE-XX: Issue Title](https://linear.app/team/issue/NUE-XX)**

   ## Changes

   - Bullet list of key changes
   - Grouped by area (backend, frontend, infra)

   ## Acceptance Criteria

   (Copy from Linear issue)
   - [ ] criterion 1
   - [ ] criterion 2

   ## Testing

   - [ ] Unit tests pass
   - [ ] Integration tests pass (if applicable)
   - [ ] Manual testing completed

   ## Checklist

   - [ ] Code follows project conventions
   - [ ] No secrets or credentials in code
   - [ ] Commit messages reference `Refs NUE-XX`
   - [ ] RLS policies verified (if DB changes)
   - [ ] API documentation updated (if endpoints changed)

   ---
   🤖 Generated with [Claude Code](https://claude.com/claude-code)
   ```

6. **Push and create PR**:
   ```bash
   git push -u origin <branch-name>
   gh pr create --title "<title>" --body "<body>"
   ```

7. **Report to user**: Show PR URL and summary.

## Rules

- NEVER create a PR without commits (empty diff).
- ALWAYS include the Linear issue ID in the PR title.
- ALWAYS push the branch before creating the PR.
- If there are uncommitted changes, warn the user first.
- If a PR already exists for the branch, show its URL instead of creating a duplicate.
- Copy acceptance criteria from Linear into the PR body.
- Base branch is always `main` unless the user specifies otherwise.
