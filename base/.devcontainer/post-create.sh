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
  dotnet restore "./Api.csproj" 2>/dev/null || dotnet restore "$csproj_file"
  bootstrap_performed=1
fi

if [ "$bootstrap_performed" -eq 0 ]; then
  echo "No supported project manifest found. Skipping devcontainer bootstrap."
fi

if [ -f "scripts/sync-project-context.sh" ]; then
  echo "Refreshing generated project context..."
  bash scripts/sync-project-context.sh
fi

if [ -n "${DATABASE_URL:-}" ] && [ -f "drizzle.config.ts" ] && [ -f "package.json" ]; then
  if grep -q '"db:migrate"' package.json 2>/dev/null; then
    echo "Waiting for MySQL..."
    for i in $(seq 1 30); do
      if node -e "
        const mysql = require('mysql2/promise');
        mysql.createConnection(process.env.DATABASE_URL).then(c => { c.end(); process.exit(0); }).catch(() => process.exit(1));
      " 2>/dev/null; then
        echo "Database ready. Running Drizzle migrations..."
        npm run db:migrate || echo "Migrations failed. Run 'npm run db:migrate' manually."
        break
      fi
      if [ "$i" -eq 30 ]; then
        echo "Database not ready after 60s. Run 'npm run db:migrate' manually when DB is up."
      else
        sleep 2
      fi
    done
  fi
fi
