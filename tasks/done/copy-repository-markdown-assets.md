# Task

title: Copy curated markdown assets into generated projects

## Goal

Ensure generated projects include curated markdown assets for prompts, specs, tasks, and stack documentation.

## Context

Generated projects need useful markdown assets, but they should not receive the generator repository's internal work history. The scaffold should ship curated prompts, specs, tasks, and stack documentation instead.

## Requirements

- Keep markdown assets curated through the base scaffold
- Keep the standard and container generator modes aligned
- Ensure selected stack markdown files are copied into the generated project
- Add approved example markdown assets where useful
- Update the project documentation to reflect the generated markdown assets

## Acceptance Criteria

- Generated projects include curated markdown files under `prompts/`, `specs/`, and `tasks/`
- Generated projects include selected stack markdown files
- Standard and container-ready modes produce the same markdown assets apart from `.devcontainer`
