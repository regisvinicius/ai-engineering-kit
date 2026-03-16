# Task

title: Add root and generated README management

## Goal

Explain the generator at the repository root and ensure generated projects receive a stack-aware README that can be refreshed later.

## Context

The repository now supports multiple stacks, shared AI workflow files, and a context sync command, but it still lacks a root README and a managed README for generated projects. The generated README should help both humans and AI agents understand the project and should stay aligned with the current stack and project shape.

## Requirements

- Add a root `README.md` for this repository
- Generate a stack-aware `README.md` for created projects
- Make `scripts/sync-project-context.sh` update the generated README
- Keep the generated README aligned with the AI workflow, task workflow, and stack-specific commands

## Acceptance Criteria

- This repository has a root `README.md`
- Every generated project has a useful stack-aware `README.md`
- Re-running `bash scripts/sync-project-context.sh` refreshes the generated project `README.md`
- The generated README reflects the selected stack and current project context
