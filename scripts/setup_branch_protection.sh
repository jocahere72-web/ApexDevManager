#!/usr/bin/env bash
#
# setup_branch_protection.sh — Configure branch protection rules on main.
#
# Requires: GitHub Pro (paid) or public repository.
#
# What it configures:
#   - Require PR before merging
#   - Require at least 1 approval
#   - Dismiss stale reviews on new pushes
#   - Require CI checks to pass (Tests, Secret Scanning)
#   - Require branch to be up-to-date before merging
#
# Usage:
#   bash scripts/setup_branch_protection.sh
#

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner' 2>/dev/null || echo "")

if [ -z "$REPO" ]; then
    echo -e "${RED}Could not detect repo. Run from within the git repository.${NC}"
    exit 1
fi

echo "Configuring branch protection for $REPO (main)..."
echo ""

gh api "repos/$REPO/branches/main/protection" \
    -X PUT \
    --input - <<'EOF'
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["Tests", "Lint & Format", "Type Check", "Secret Scanning"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 1,
    "dismiss_stale_reviews": true
  },
  "restrictions": null
}
EOF

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}Branch protection configured successfully!${NC}"
    echo ""
    echo "Rules applied to main:"
    echo "  ✓ Require PR before merging"
    echo "  ✓ Require 1 approval"
    echo "  ✓ Dismiss stale reviews on new pushes"
    echo "  ✓ Require CI checks: Tests, Lint, TypeCheck, Gitleaks"
    echo "  ✓ Require branch up-to-date before merge"
else
    echo ""
    echo -e "${RED}Failed to configure branch protection.${NC}"
    echo -e "${YELLOW}This requires GitHub Pro or a public repository.${NC}"
    exit 1
fi
