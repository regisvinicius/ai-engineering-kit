# Default Brief Handling

## Goal

Ensure generated projects behave correctly when the user provides only the work context, without needing a long meta-prompt.

## Context

The scaffold already includes prompts and workflows for brief-driven work, but the default documentation and generated context should make this behavior automatic and explicit. Users should be able to provide only a bug, story, or complex task brief and trust the project instructions to guide the agent through task creation, spec creation, planning, implementation, testing, and compliance review.

## Requirements

- Make brief-driven behavior the default expectation in generated project guidance
- Update agent-facing documentation to say that stories, bugs, and complex tasks should trigger the full workflow automatically
- Update generated context files so they explicitly say users do not need to provide a long meta-prompt

## Acceptance Criteria

- Generated project guidance makes brief-driven workflow the default
- Users can provide just the work context and the scaffold instructions cover the rest
- AGENTS, PLAYBOOK, and generated context files communicate this clearly
