# Task

title: Add Python stack template

## Goal

Expand the kit so it can generate AI engineering projects for Python teams, not only repositories that follow the existing Node-oriented structure.

## Context

The repository already includes shared workflows, base templates, and a stack-specific architecture file under `/stacks/node`. Adding a Python stack would make the kit useful for a broader set of teams without changing the core workflow.

## Requirements

- Create a new stack area for Python-specific guidance
- Document the recommended project structure and architecture for Python projects
- Update project generation logic to support selecting the Python stack
- Keep the shared workflow files reusable across stacks

## Acceptance Criteria

- A Python stack template exists alongside the current stack-specific assets
- The generated project can be initialized with Python-specific guidance
- The shared agent workflow remains consistent across Node and Python projects
