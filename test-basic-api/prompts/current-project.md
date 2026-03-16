# Current Project Prompt

Use this file before planning or implementing changes in this project.

## Project Snapshot

- Stack: `.NET Basic API`
- Application type: ASP.NET Core Web API (minimal)
- Primary language: `C#`

## Working Guidance

- Read `README.md` for the current project overview and workflow summary.
- If the user provides only a story, bug, feature request, or complex task brief, treat that as enough context to begin the workflow.
- Read `docs/project-context.md` for the current commands, key paths, and detected tooling.
- Read `docs/dependencies.md` before adding new packages or frameworks.
- Read `docs/stack-guide.md` for stack-specific architectural guidance when it exists.
- Re-run `bash scripts/sync-project-context.sh` after changing dependencies, frameworks, infrastructure, or major folder structure.
- If the generated docs disagree with the repository, refresh context before planning implementation work.
- Automatically create the task, spec, and plan when the user gives work context but those artifacts do not exist yet.

## Stack-Specific Guidance

- Minimal API with no database
- Use minimal APIs or add Controllers as needed
- Configure additional services in Program.cs

## Current Commands

- Sync context: `bash scripts/sync-project-context.sh`
- Build: `dotnet build Api.csproj`
- Start/Run: `dotnet run --project Api.csproj`

## Current Frameworks And Tools

- `.NET`
- `ASP.NET Core Web API`
- `C#`
