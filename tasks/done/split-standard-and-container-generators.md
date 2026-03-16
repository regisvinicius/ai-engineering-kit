# Task

title: Split standard and container project generators

## Goal

Ensure the repository can generate projects in two explicit modes: a standard scaffold without devcontainer files and a container-ready scaffold with the shared `.devcontainer`.

## Context

The repository now has a shared devcontainer scaffold, but the standard generator still follows an older flow and does not clearly represent a separate non-container mode. The creation scripts and documentation need to match the intended behavior so users can choose either output reliably.

## Requirements

- Refactor the project creation scripts to share a single generation flow
- Make the standard generator omit `.devcontainer`
- Make the container generator include `.devcontainer`
- Update package scripts to expose both creation modes clearly
- Update `AGENTS.md` and `PLAYBOOK.md` to reflect the two modes

## Acceptance Criteria

- Standard generated projects do not include `.devcontainer`
- Container generated projects do include `.devcontainer`
- Both modes use the same local template source and stack setup flow
- The documentation explains the difference between the two generation modes
