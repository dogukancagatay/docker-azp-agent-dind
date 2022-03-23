#!/usr/bin/env bash

_GIT_REPOSITORY_NAME="${REPO:-microsoft/azure-pipelines-agent}"
_NUM_RELEASES="${NUM_RELEASES:-100}"

## List releases (not prereleases)
curl -fsSN \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$_REPO/releases?per_page=$_NUM_RELEASES" |
  jq -r '.[] | select(.prerelease==false) | .name ' |
  cut -d 'v' -f2
# | jq  --raw-input . | jq --slurp .
