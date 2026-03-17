# Refresh Project Context

Use this prompt when the project has grown since it was generated and the guidance files may be stale.

## Goal

Refresh the project context before planning or implementing changes.

## Steps

1. Read `README.md`, `prompts/current-project.md`, `docs/project-context.md`, and `docs/dependencies.md`
2. Inspect the current repository structure and recent stack changes
3. Run `bash scripts/sync-project-context.sh`
4. Re-read the generated context files and use them as the current source of truth for commands, dependencies, and architecture hints

## Typical Triggers

- new frameworks or SDKs were added
- package or NuGet dependencies changed
- top-level folders or runtime entrypoints changed
- Docker, infrastructure, or deployment files were introduced
