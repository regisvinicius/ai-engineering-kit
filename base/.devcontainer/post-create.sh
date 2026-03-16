#!/usr/bin/env bash

set -euo pipefail

bootstrap_performed=0

if [ -f "package.json" ]; then
  echo "Installing npm dependencies inside the devcontainer..."
  npm install
  bootstrap_performed=1
fi

csproj_file="$(find . -maxdepth 1 -name "*.csproj" -print -quit)"

if [ -n "$csproj_file" ]; then
  echo "Restoring .NET dependencies inside the devcontainer..."
  dotnet restore "$csproj_file"
  bootstrap_performed=1
fi

if [ "$bootstrap_performed" -eq 0 ]; then
  echo "No supported project manifest found. Skipping devcontainer bootstrap."
fi

if [ -f "scripts/sync-project-context.sh" ]; then
  echo "Refreshing generated project context..."
  bash scripts/sync-project-context.sh
fi
