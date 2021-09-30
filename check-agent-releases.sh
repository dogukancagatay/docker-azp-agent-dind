#!/usr/bin/env bash

REPO="microsoft/azure-pipelines-agent"

## List releases (not prereleases)
curl \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$REPO/releases?per_page=100" | jq '.[] | select(.prerelease==false) | .name'
