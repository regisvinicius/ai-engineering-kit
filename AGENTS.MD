# AI Engineering Guidelines

This repository is designed to work with AI coding agents such as Codex, Claude Code, and Cursor.

Agents should follow the workflows and project conventions defined in this repository.

For an overview of the development process, refer to `PLAYBOOK.md`.

---

# Development Workflow

When implementing work, agents should follow this sequence:

1. `workflows/init.md` – understand the repository context
2. `workflows/design.md` – define the technical approach
3. `workflows/plan.md` – create an implementation plan
4. `workflows/implement.md` – implement the feature
5. `workflows/test.md` – validate behavior
6. `workflows/review.md` – evaluate code quality
7. `workflows/polish.md` – improve clarity and maintainability

Agents should not skip steps unless explicitly instructed.

---

# Task Workflow

Work should be tracked using `/tasks`.

Task lifecycle:

backlog → in-progress → done

Process:

1. Create a task in `/tasks/backlog` using `/tasks/TASK_TEMPLATE.md`
2. Move the task to `/tasks/in-progress` when implementation begins
3. Implement the task following the development workflow
4. Move the task to `/tasks/done` after implementation and review are complete

Tasks should represent small, well-defined units of work.

---

# Project Structure

Key directories in this repository:

/tasks  
Contains task files organized by status.

Example:

tasks/backlog  
tasks/in-progress  
tasks/done  
tasks/TASK_TEMPLATE.md

/specs  
Contains feature specifications and design requirements.

Example:

specs/authentication.md

/workflows  
Contains development workflows that define how tasks should be executed.

Example:

workflows/init.md  
workflows/design.md  
workflows/plan.md  
workflows/implement.md  
workflows/test.md  
workflows/review.md  
workflows/polish.md  

/prompts  
Reusable prompts that orchestrate workflows.

Example:

prompts/analyze-repo.md  
prompts/implement-task.md  
prompts/refactor.md  

/src  
Application source code.

---

# General Principles

Prefer simple and maintainable solutions.

Follow the architecture defined in `docs/architecture.md` if present.

Reuse existing modules or patterns when possible.

Avoid introducing unnecessary dependencies.

Prefer small, focused functions and modular design.

---

# Stack Awareness

The technology stack used in a project is determined by the template used when creating the project.

Example stacks:

- Node.js
- .NET
- Python
- React

Agents should follow stack-specific guidelines if they exist in the repository.

---

# Agent Behavior

Agents should:

- explore the repository before making changes
- understand the architecture and existing patterns
- implement changes incrementally
- avoid large refactors unless required
- prefer minimal and safe modifications

If a feature specification exists, it should be treated as the source of truth.

---

# Creating New Features

Typical process:

1. Create a task in `/tasks/backlog`
2. Create or update a specification in `/specs`
3. Run the development workflow
4. Implement the feature
5. Validate with tests
6. Review and polish the implementation
7. Move the task to `/tasks/done`

Agents should always create a plan using `workflows/plan.md` before implementing a feature.