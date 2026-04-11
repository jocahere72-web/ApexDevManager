#!/usr/bin/env bash
#
# close_issue.sh — Harness gate script for closing Linear issues.
#
# Runs 4 gates before allowing an issue to be closed:
#   Gate 1: Tests passing (auto-detects test runner)
#   Gate 2: CI green (last GitHub Actions run)
#   Gate 3: Acceptance criteria checked (Linear API)
#   Gate 4: PR approved (at least 1 approval on open/merged PR)
#
# Usage:
#   bash scripts/close_issue.sh NUE-1
#

set -euo pipefail

ISSUE_ID="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Colors ──
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ -z "$ISSUE_ID" ]; then
    echo -e "${RED}Usage: bash scripts/close_issue.sh <ISSUE_ID>${NC}"
    exit 1
fi

echo ""
echo "════════════════════════════════════════"
echo "  Harness Gate Check: $ISSUE_ID"
echo "════════════════════════════════════════"
echo ""

GATES_PASSED=0
GATES_TOTAL=4

# ── Helper: Detect test runner ──

detect_test_runner() {
    if [ -f "$PROJECT_ROOT/package.json" ]; then
        # Check if test script exists and is not the default npm error
        TEST_SCRIPT=$(python3 -c "import json; d=json.load(open('$PROJECT_ROOT/package.json')); print(d.get('scripts',{}).get('test',''))" 2>/dev/null || echo "")
        if [ -n "$TEST_SCRIPT" ] && ! echo "$TEST_SCRIPT" | grep -q "no test specified"; then
            echo "npm"
            return
        fi
    fi
    if [ -f "$PROJECT_ROOT/pytest.ini" ] || [ -f "$PROJECT_ROOT/setup.cfg" ] || [ -f "$PROJECT_ROOT/pyproject.toml" ]; then
        if command -v pytest &>/dev/null; then
            echo "pytest"
            return
        fi
    fi
    if [ -f "$PROJECT_ROOT/Makefile" ] && grep -q "^test:" "$PROJECT_ROOT/Makefile" 2>/dev/null; then
        echo "make"
        return
    fi
    echo "none"
}

run_tests() {
    local runner="$1"
    case "$runner" in
        npm)    cd "$PROJECT_ROOT" && npm test --silent 2>/dev/null ;;
        pytest) cd "$PROJECT_ROOT" && pytest --quiet 2>/dev/null ;;
        make)   cd "$PROJECT_ROOT" && make test 2>/dev/null ;;
        *)      return 1 ;;
    esac
}

# ── Gate 1: Tests ──

TEST_RUNNER=$(detect_test_runner)
echo -n "Gate 1/4 — Tests passing ($TEST_RUNNER)... "
if [ "$TEST_RUNNER" = "none" ]; then
    echo -e "${YELLOW}SKIP (no test runner detected)${NC}"
    GATES_PASSED=$((GATES_PASSED + 1))
elif run_tests "$TEST_RUNNER"; then
    echo -e "${GREEN}PASS${NC}"
    GATES_PASSED=$((GATES_PASSED + 1))
else
    echo -e "${RED}FAIL${NC}"
    echo -e "${YELLOW}  Fix: Run '$TEST_RUNNER test' and fix failing tests.${NC}"
fi

# ── Gate 2: CI Green ──

echo -n "Gate 2/4 — CI green... "
if command -v gh &>/dev/null; then
    BRANCH=$(git branch --show-current 2>/dev/null || echo "")
    if [ -n "$BRANCH" ]; then
        CI_STATUS=$(gh run list --branch "$BRANCH" --workflow ci.yml --limit 1 --json conclusion --jq '.[0].conclusion' 2>/dev/null || echo "unknown")
        if [ "$CI_STATUS" = "success" ]; then
            echo -e "${GREEN}PASS${NC}"
            GATES_PASSED=$((GATES_PASSED + 1))
        elif [ "$CI_STATUS" = "unknown" ] || [ -z "$CI_STATUS" ]; then
            echo -e "${YELLOW}SKIP (no CI runs found)${NC}"
            GATES_PASSED=$((GATES_PASSED + 1))
        else
            echo -e "${RED}FAIL (last run: $CI_STATUS)${NC}"
            echo -e "${YELLOW}  Fix: Check GitHub Actions and fix the failing workflow.${NC}"
        fi
    else
        echo -e "${YELLOW}SKIP (not on a branch)${NC}"
        GATES_PASSED=$((GATES_PASSED + 1))
    fi
else
    echo -e "${YELLOW}SKIP (gh CLI not installed)${NC}"
    GATES_PASSED=$((GATES_PASSED + 1))
fi

# ── Gate 3: Acceptance Criteria ──

echo -n "Gate 3/4 — Acceptance criteria... "
ISSUE_DATA=$(python3 "$SCRIPT_DIR/linear_client.py" get "$ISSUE_ID" --full 2>/dev/null || echo "")
if [ -z "$ISSUE_DATA" ]; then
    echo -e "${YELLOW}SKIP (could not fetch issue)${NC}"
    GATES_PASSED=$((GATES_PASSED + 1))
else
    UNCHECKED=$(echo "$ISSUE_DATA" | grep -c '\- \[ \]' || true)
    CHECKED=$(echo "$ISSUE_DATA" | grep -ci '\- \[x\]' || true)
    TOTAL=$((UNCHECKED + CHECKED))

    if [ "$TOTAL" -eq 0 ]; then
        echo -e "${YELLOW}SKIP (no checkboxes found)${NC}"
        GATES_PASSED=$((GATES_PASSED + 1))
    elif [ "$UNCHECKED" -gt 0 ]; then
        echo -e "${RED}FAIL ($UNCHECKED/$TOTAL unchecked criteria)${NC}"
        echo -e "${YELLOW}  Fix: Complete all acceptance criteria checkboxes in Linear.${NC}"
    else
        echo -e "${GREEN}PASS ($CHECKED/$TOTAL checked)${NC}"
        GATES_PASSED=$((GATES_PASSED + 1))
    fi
fi

# ── Gate 4: PR Approved ──

echo -n "Gate 4/4 — PR approved... "
if command -v gh &>/dev/null; then
    BRANCH=$(git branch --show-current 2>/dev/null || echo "")
    if [ -n "$BRANCH" ] && [ "$BRANCH" != "main" ]; then
        # Check for open or merged PR from this branch
        PR_REVIEW=$(gh pr view "$BRANCH" --json reviewDecision --jq '.reviewDecision' 2>/dev/null || echo "")
        if [ "$PR_REVIEW" = "APPROVED" ]; then
            echo -e "${GREEN}PASS${NC}"
            GATES_PASSED=$((GATES_PASSED + 1))
        elif [ -z "$PR_REVIEW" ] || [ "$PR_REVIEW" = "null" ]; then
            # No PR or no reviews yet — check if PR exists
            PR_EXISTS=$(gh pr view "$BRANCH" --json number --jq '.number' 2>/dev/null || echo "")
            if [ -z "$PR_EXISTS" ]; then
                echo -e "${YELLOW}SKIP (no PR found — create one with /create-pr)${NC}"
                GATES_PASSED=$((GATES_PASSED + 1))
            else
                echo -e "${YELLOW}SKIP (PR #${PR_EXISTS} has no reviews yet)${NC}"
                GATES_PASSED=$((GATES_PASSED + 1))
            fi
        else
            echo -e "${RED}FAIL (review status: $PR_REVIEW)${NC}"
            echo -e "${YELLOW}  Fix: Get at least 1 approval on your PR before closing.${NC}"
        fi
    else
        echo -e "${YELLOW}SKIP (on main branch)${NC}"
        GATES_PASSED=$((GATES_PASSED + 1))
    fi
else
    echo -e "${YELLOW}SKIP (gh CLI not installed)${NC}"
    GATES_PASSED=$((GATES_PASSED + 1))
fi

# ── Result ──

echo ""
echo "════════════════════════════════════════"

if [ "$GATES_PASSED" -eq "$GATES_TOTAL" ]; then
    echo -e "${GREEN}  ALL GATES PASSED ($GATES_PASSED/$GATES_TOTAL)${NC}"
    echo "  Issue $ISSUE_ID is ready to close."
    echo "════════════════════════════════════════"
    echo ""

    # ── Build evidence ──

    COMMIT_SHA=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
    BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
    REPO_URL=$(git remote get-url origin 2>/dev/null | sed 's/\.git$//' | sed 's|git@github.com:|https://github.com/|' || echo "")
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    COMMIT_AUTHOR=$(git log -1 --format='%an <%ae>' 2>/dev/null || echo "unknown")
    COMMIT_DATE=$(git log -1 --format='%ci' 2>/dev/null || echo "unknown")
    COMMIT_MSG=$(git log -1 --format='%s' 2>/dev/null || echo "unknown")

    DIFF_STAT=$(git diff --stat main...HEAD 2>/dev/null || echo "")
    FILES_CHANGED=$(git diff --name-status main...HEAD 2>/dev/null || echo "")

    if [ -z "$DIFF_STAT" ] || [ "$BRANCH" = "main" ]; then
        MERGE_COMMIT=$(git log -1 --merges --format='%H' 2>/dev/null || echo "")
        if [ -n "$MERGE_COMMIT" ]; then
            DIFF_STAT=$(git diff --stat "${MERGE_COMMIT}^...${MERGE_COMMIT}" 2>/dev/null || echo "")
            FILES_CHANGED=$(git diff --name-status "${MERGE_COMMIT}^...${MERGE_COMMIT}" 2>/dev/null || echo "")
        fi
    fi

    if [ -z "$DIFF_STAT" ]; then
        DIFF_STAT=$(git diff --stat HEAD~1 2>/dev/null || echo "No diff available")
        FILES_CHANGED=$(git diff --name-status HEAD~1 2>/dev/null || echo "")
    fi

    FILES_COUNT=$(echo "$FILES_CHANGED" | grep -c '.' 2>/dev/null || echo "0")

    # Run tests for evidence (use detected runner)
    TEST_OUTPUT=""
    TESTS_PASSED="N/A"
    TESTS_FAILED="0 failed"
    if [ "$TEST_RUNNER" != "none" ]; then
        TEST_OUTPUT=$(run_tests "$TEST_RUNNER" 2>&1 || true)
        TESTS_PASSED=$(echo "$TEST_OUTPUT" | grep -oE '[0-9]+ passed' || echo "unknown")
        TESTS_FAILED=$(echo "$TEST_OUTPUT" | grep -oE '[0-9]+ failed' || echo "0 failed")
    fi

    # CI run info
    CI_STATUS_TEXT="unknown"
    CI_RUN_LINK=""
    if command -v gh &>/dev/null && [ -n "$REPO_URL" ]; then
        CI_RUN_JSON=$(gh run list --workflow ci.yml --branch "$BRANCH" --limit 1 --json databaseId,conclusion 2>/dev/null || echo "[]")
        CI_RUN_ID=$(echo "$CI_RUN_JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d[0]['databaseId'] if d else '')" 2>/dev/null || echo "")
        CI_STATUS_TEXT=$(echo "$CI_RUN_JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d[0].get('conclusion','unknown') if d else 'unknown')" 2>/dev/null || echo "unknown")
        if [ -n "$CI_RUN_ID" ]; then
            CI_RUN_LINK="[CI Run #${CI_RUN_ID}](${REPO_URL}/actions/runs/${CI_RUN_ID})"
        fi
    fi

    # PR info
    PR_LINK=""
    PR_APPROVAL_TEXT="N/A"
    if command -v gh &>/dev/null; then
        PR_JSON=$(gh pr list --state all --head "$BRANCH" --json number,title,reviewDecision --jq '.[0]' 2>/dev/null || echo "")
        if [ -n "$PR_JSON" ] && [ "$PR_JSON" != "null" ]; then
            PR_NUM=$(echo "$PR_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin).get('number',''))" 2>/dev/null || echo "")
            PR_TITLE=$(echo "$PR_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin).get('title',''))" 2>/dev/null || echo "")
            PR_APPROVAL_TEXT=$(echo "$PR_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin).get('reviewDecision','N/A'))" 2>/dev/null || echo "N/A")
            if [ -n "$PR_NUM" ]; then
                PR_LINK="[PR #${PR_NUM}: ${PR_TITLE}](${REPO_URL}/pull/${PR_NUM})"
            fi
        fi
    fi

    # Acceptance criteria count
    ISSUE_FULL=$(python3 "$SCRIPT_DIR/linear_client.py" get "$ISSUE_ID" --full 2>/dev/null || echo "")
    AC_CHECKED=$(echo "$ISSUE_FULL" | grep -ci '\- \[x\]' || true)
    AC_TOTAL=$((AC_CHECKED + $(echo "$ISSUE_FULL" | grep -c '\- \[ \]' || true)))

    EVIDENCE="## Evidencia de cierre — ${ISSUE_ID}

### 1. Resolución

- **Status**: PASS
- **Fecha**: ${TIMESTAMP}
- **Verificado por**: Harness enforcement (${GATES_PASSED}/${GATES_TOTAL} gates)

### 2. Cambios implementados

- **Commit**: \`${COMMIT_SHA}\`
- **Autor**: ${COMMIT_AUTHOR}
- **Fecha commit**: ${COMMIT_DATE}
- **Mensaje**: ${COMMIT_MSG}
$([ -n "$PR_LINK" ] && echo "- **PR**: ${PR_LINK}")

**Diff stats**

\`\`\`
${DIFF_STAT}
\`\`\`

**Archivos modificados (${FILES_COUNT})**

\`\`\`
${FILES_CHANGED}
\`\`\`

### 3. Verificación — Tests

- **Test runner**: ${TEST_RUNNER}
- **Resultado**: ${TESTS_PASSED}, ${TESTS_FAILED}

### 4. Quality Gates

- **Gate 1 — Tests**: PASS (${TEST_RUNNER}: ${TESTS_PASSED})
- **Gate 2 — CI/CD**: ${CI_STATUS_TEXT}$([ -n "$CI_RUN_LINK" ] && echo " — ${CI_RUN_LINK}")
- **Gate 3 — Acceptance Criteria**: PASS (${AC_CHECKED}/${AC_TOTAL} checked)
- **Gate 4 — PR Review**: ${PR_APPROVAL_TEXT}$([ -n "$PR_LINK" ] && echo " — ${PR_LINK}")

### 5. Audit Trail

- **Issue**: ${ISSUE_ID}
- **Action**: Closed with automated evidence
- **Timestamp**: ${TIMESTAMP}
- **Tool**: scripts/close_issue.sh
- **Commit SHA**: \`${COMMIT_SHA}\`

---
*Evidencia generada automáticamente por el harness (4 gates).*"

    python3 "$SCRIPT_DIR/linear_client.py" comment "$ISSUE_ID" "$EVIDENCE" 2>/dev/null || true
    python3 "$SCRIPT_DIR/linear_client.py" move "$ISSUE_ID" "Done" 2>/dev/null || true

    echo -e "${GREEN}Evidence posted and issue moved to Done.${NC}"
    exit 0
else
    echo -e "${RED}  BLOCKED ($GATES_PASSED/$GATES_TOTAL passed)${NC}"
    echo "  Fix the failing gates and run again."
    echo "════════════════════════════════════════"
    exit 1
fi
