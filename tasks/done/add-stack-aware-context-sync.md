# Task

title: Add stack-aware context sync for generated projects

## Goal

Make generated projects start with stack-specific context and provide a reusable command that refreshes project guidance as the codebase evolves.

## Context

The current generated markdown assets are curated, but still generic. Projects should start with context that reflects the selected stack and be able to refresh that context later as new frameworks, dependencies, and architectural patterns are introduced.

## Requirements

- Add stack-specific context assets under each stack
- Add a shared sync command to generated projects
- Generate project context, dependency summaries, and an AI-facing prompt from the current codebase
- Add a prompt that helps agents refresh context after the project evolves
- Make the generator run the sync once after scaffold creation
- Keep the sync command reusable after the project grows

## Acceptance Criteria

- Generated projects include stack-aware context instead of only generic guidance
- Generated projects include a command to refresh context after dependencies or frameworks change
- Generated projects include a prompt for refreshing context before new implementation work
- The sync command updates generated docs and prompts based on the current project files
- The behavior works for Node, React, Angular, and .NET projects
