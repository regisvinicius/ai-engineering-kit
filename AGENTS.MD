# AI Engineering Guidelines

This repository is designed to work with AI coding agents such as Codex, Claude Code, and Cursor.

Agents should follow the workflows and project conventions defined in this repository.

---

## Development Workflow

When implementing features, follow this order:

1. Read the feature specification in `/specs`
2. Perform design using `/workflows/design.md`
3. Implement the feature following `/workflows/implement.md`
4. Review the implementation using `/workflows/review.md`

Do not skip steps.

---

## Project Structure

/specs  
Contains feature specifications.

Example:
specs/authentication.md

/workflows  
Contains development workflows that define how tasks should be executed.

Example:
workflows/design.md  
workflows/implement.md  
workflows/review.md

/src  
Application source code.

---

## General Rules

Prefer simple and maintainable solutions.

Follow the architecture defined in `docs/architecture.md` if present.

Avoid introducing unnecessary dependencies.

Write clear and readable code.

Prefer small functions and modular design.

---

## Stack

The stack used in this project is defined by the template used when creating the project.

Example stacks:
- Node.js
- .NET
- Python

Follow stack-specific guidelines if they exist in the repository.

---

## Agent Behavior

Agents should:

- read the repository structure before implementing features
- respect existing architecture
- avoid large refactors unless explicitly requested
- prefer incremental changes

If a feature specification exists, it should be treated as the source of truth.

---

## When Creating New Features

Steps:

1. create a spec in `/specs`
2. design the solution
3. implement the feature
4. review and polish the code