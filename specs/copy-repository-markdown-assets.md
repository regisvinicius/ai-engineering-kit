# Copy Curated Markdown Assets

## Goal

Include curated markdown prompts, specs, tasks, and stack documentation in generated projects.

## Context

Generated projects should include useful markdown assets for day-to-day work, but they should not inherit the internal implementation history of this generator repository. The right balance is to ship curated base prompts, specs, tasks, and stack documentation.

## Requirements

- Keep the generated markdown assets curated through the base scaffold
- Keep standard and container-ready project generation behavior identical except for `.devcontainer`
- Ensure selected stack markdown files are copied for the generated project
- Add approved example markdown assets where useful
- Update `AGENTS.md` and `PLAYBOOK.md` to describe the generated markdown content

## Acceptance Criteria

- Generated projects include curated markdown files in `prompts/`, `specs/`, and `tasks/`
- Generated projects include markdown documentation from the selected stack
- Both generator scripts produce the same markdown assets in their outputs
