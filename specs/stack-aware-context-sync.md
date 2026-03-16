# Stack-Aware Context Sync

## Goal

Generate less generic project guidance and keep it refreshable as the project evolves.

## Context

Base prompts, specs, and tasks are useful, but they do not capture the specifics of the chosen stack or the current state of the generated project after dependencies and frameworks change. A stack-aware sync workflow can provide a better starting point and remain useful over time.

## Requirements

- Add stack-specific context assets under `stacks/<stack>/context`
- Copy stack context metadata into generated projects
- Add a shared `scripts/sync-project-context.sh` to generated projects
- Generate `docs/project-context.md`, `docs/dependencies.md`, `docs/stack-guide.md`, and `prompts/current-project.md`
- Add a reusable prompt that tells agents how to refresh context after the project evolves
- Detect the current stack and common frameworks/dependencies from project files
- Run the sync automatically during project generation and after devcontainer bootstrap
- Allow the sync command to be rerun manually later

## Acceptance Criteria

- Generated projects include stack-specific guidance for the selected stack
- Generated projects include generated context files in `docs/` and `prompts/`
- Generated projects include a prompt that helps agents refresh context after major project changes
- Running the sync command refreshes those files based on the current project state
- The flow works across standard and container-ready generated projects
