# Brief-Driven Requirement Coverage

## Goal

Make generated projects handle complex-task prompts and user stories with stronger requirement extraction, coverage tracking, testing, and final compliance review.

## Context

The current prompts and workflows are useful for general feature work, but they do not force a requirement-by-requirement implementation process. In complex tasks, this can lead to missing functionality, weak validation, or incomplete final reporting. The scaffold should better support briefs as the source of truth and guide agents through extraction, classification, planning, implementation, testing, review, and compliance checks.

## Requirements

- Add a workflow for extracting and classifying requirements from a brief
- Add a workflow for final compliance checking against the source brief
- Add a prompt for implementing work from a brief or complex task
- Update existing prompts and workflows to require task/spec creation, validation mapping, and final compliance reporting
- Fix the current testing workflow so it actually describes testing instead of review
- Provide templates or examples that help users capture required vs optional requirements and validation coverage

## Acceptance Criteria

- Generated projects include a prompt that supports brief-driven implementation
- Generated projects include workflows for requirement extraction and compliance review
- The testing workflow focuses on execution and validation rather than code review
- The execution flow makes it harder to finish work without accounting for every non-optional requirement
