#!/bin/bash
#
# Re-compiles all Github Actions and verifies that there is no diff,
# because that would indicate that the PR author forgot to run `npm run gh-actions-build`
# and commit the re-bundled the javascript sources.

declare -r GREEN='\033[0;32m'
declare -r RED='\033[0;31m'
declare -r NC='\033[0m'

if [[ $(git diff --exit-code) -eq 0 ]]; then
    echo -e "${GREEN}Github Actions are up to date!${NC}"
    exit 0
else
    echo -e "${RED}Error: Diff found when Github Actions were rebuilt. Did you forget to run ${NC}\`npm run gh-actions-build\`${RED}?${NC}"
    exit 1
fi