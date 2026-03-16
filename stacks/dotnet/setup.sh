#!/usr/bin/env bash

set -euo pipefail

if [ "${AI_KIT_SKIP_SETUP:-0}" = "1" ]; then
  echo "Skipping dotnet restore because AI_KIT_SKIP_SETUP=1"
  exit 0
fi

dotnet restore
