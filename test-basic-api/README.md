# test-basic-api

Generated from AI Engineering Kit as a minimal ASP.NET Core Web API (no database).

_This README is managed by `scripts/sync-project-context.sh`. Re-run that command after changing frameworks, dependencies, or major project structure._

## Quick Start

1. Install dependencies if needed: `dotnet restore`
2. Start the project with `dotnet run --project Api.csproj`.
3. Review `docs/project-context.md` and `prompts/current-project.md` before implementing changes.
4. Re-run `bash scripts/sync-project-context.sh` after changing dependencies, frameworks, or top-level structure.

## Development Environment

- This project was generated without `.devcontainer`, so commands run directly on your local environment.
- If you later add or restore `.devcontainer`, re-run `bash scripts/sync-project-context.sh` to refresh the project context.

## Stack Snapshot

- Stack: `.NET Basic API`
- Application type: ASP.NET Core Web API (minimal)
- Primary language: `C#`

## Runtime Notes

- Runs with dotnet run and exposes GET /health
- Add endpoints and services as needed

## Commands

- Sync context: `bash scripts/sync-project-context.sh`
- Build: `dotnet build Api.csproj`
- Start/Run: `dotnet run --project Api.csproj`

## Current Tooling

- `.NET`
- `ASP.NET Core Web API`
- `C#`

## Project Structure

- `Api.csproj`
- `Program.cs`
- `appsettings.json`
- `docs`
- `prompts`
- `specs`
- `tasks`
- `workflows`

## AI Workflow

- Read `AGENTS.md` and `PLAYBOOK.md` for the repository workflow and conventions.
- Use `workflows/execute-work-item.md` as the practical checklist for new user stories, bugs, and enhancements.
- Use `prompts/implement-from-brief.md` when the user provides a complex task brief or requirement-heavy story.
- When the user provides only the work context, create the task, spec, plan, and validation flow automatically instead of waiting for a long meta-prompt.
- Follow the workflow files in `workflows/`, including requirement extraction and compliance review when a source brief exists.
- Use `prompts/current-project.md` as the current AI-facing summary of the project.
- Use `prompts/refresh-context.md` when the repository has evolved and the generated guidance may be stale.
- Treat `docs/project-context.md`, `docs/dependencies.md`, and `docs/stack-guide.md` as managed context files.

## Task Workflow

- Create new work in `tasks/backlog` using `tasks/TASK_TEMPLATE.md`.
- Move a task to `tasks/in-progress` when implementation starts.
- Move the task to `tasks/done` after validation and review are complete.
- Use `tasks/backlog/example-task.md` as a reference for formatting and scope.
- Use `tasks/backlog/example-node-user-crud.md` with `specs/example-node-user-crud.md` as a practical feature example.

## Helpful Files

- `docs/project-context.md` for the latest stack-aware project summary
- `docs/dependencies.md` for runtime and development dependency snapshots
- `docs/stack-guide.md` for stack-specific architecture guidance
- `workflows/execute-work-item.md` for the practical flow to execute a new story or bug
- `workflows/extract-requirements.md` for requirement extraction and classification
- `workflows/compliance-check.md` for final brief compliance review
- `specs/example-node-user-crud.md` for a concrete Node feature example
- `tasks/backlog/example-node-user-crud.md` for the matching example task
- `prompts/implement-from-brief.md` for complex or brief-driven execution
- `prompts/current-project.md` for AI-ready implementation context
- `prompts/refresh-context.md` for the context refresh workflow
