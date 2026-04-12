---
name: close-issue
description: Close a Linear issue with evidence — runs 4 gates (tests, CI, acceptance criteria, PR review) before closing
user-invocable: true
allowed-tools: Bash(git *) Bash(gh *) Bash(npm test*) Bash(python3 scripts/*) Bash(bash scripts/*)
argument-hint: "<ISSUE_ID> (e.g., NUE-1)"
---

# Close Issue

Close Linear issue `$ARGUMENTS` with mechanical verification.

## Steps

1. **Run the harness gate script**:
   ```bash
   bash scripts/close_issue.sh $0
   ```
   This runs 4 gates:
   - **Gate 1**: Tests passing? (auto-detects: npm, pytest, make)
   - **Gate 2**: CI green? (`gh run list`)
   - **Gate 3**: Acceptance criteria all checked? (Linear API)
   - **Gate 4**: PR approved? (at least 1 review approval)

2. **If ALL gates pass**:
   The script automatically:
   - Posts evidence comment to the Linear issue (with all 4 gate results)
   - Moves issue to "Done"
   - Report: `Issue $0 closed with evidence.`

3. **If ANY gate fails**:
   - Report which gate failed and why
   - Do NOT close the issue
   - Suggest what the user needs to fix

## Rules

- NEVER close an issue if a gate fails.
- NEVER use workarounds to bypass gates.
- NEVER close issues manually in Linear — always use this skill.
- The user must fix the root cause, then run `/close-issue` again.
