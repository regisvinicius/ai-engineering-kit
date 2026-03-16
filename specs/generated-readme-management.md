# Generated README Management

## Goal

Document the generator itself and make generated projects include a stack-aware README that can be refreshed as the project evolves.

## Context

The repository currently lacks a root README that explains the purpose of the generator and how to use it. Generated projects also inherit little to no README guidance, or in the Node case, a static README that does not reflect later changes in the project. The README should become part of the managed context refreshed by `scripts/sync-project-context.sh`.

## Requirements

- Add a `README.md` at the repository root describing the generator, stacks, workflows, and usage
- Generate a `README.md` in created projects for every supported stack
- Make the generated README less generic by including stack-specific details, commands, structure, and AI workflow guidance
- Make `scripts/sync-project-context.sh` refresh the generated project README
- Keep the README generation compatible with standard and container-ready project generation

## Acceptance Criteria

- The repository root has a clear `README.md` for users of the generator
- Generated Node, .NET, React, and Angular projects include a `README.md`
- Running `bash scripts/sync-project-context.sh` updates the generated project `README.md`
- The generated README reflects the selected stack and the current project guidance rather than a static generic template
