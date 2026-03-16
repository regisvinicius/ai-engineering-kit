# Split Standard And Container Generators

## Goal

Support two clear scaffold modes for generated projects: standard and container-ready.

## Context

The generator now includes a shared devcontainer, but users also need a plain project scaffold that does not include container files. The scripts and documentation should make that distinction explicit while still using the same stack templates and setup behavior underneath.

## Requirements

- Keep one shared implementation flow for project generation
- Expose a standard script that omits `.devcontainer`
- Expose a container script that includes `.devcontainer`
- Ensure both scripts use the local repository templates instead of cloning a remote repository
- Update package scripts for standard and container project creation
- Update `AGENTS.md` and `PLAYBOOK.md` to explain when `.devcontainer` is present

## Acceptance Criteria

- `scripts/create-ai-project.sh` generates a project without `.devcontainer`
- `scripts/create-ai-container-project.sh` generates a project with `.devcontainer`
- Both scripts copy base files, stack files, run stack setup, and initialize git
- The documentation accurately reflects the two generation modes
