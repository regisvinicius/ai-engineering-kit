# AI Engineering Guidelines

This repository is designed to work with AI coding agents such as Codex, Claude Code, and Cursor.

Agents should follow the workflows and project conventions defined in this repository.

For an overview of the development process, refer to `PLAYBOOK.md`.

---

# Development Workflow

When implementing work, agents should follow this sequence:

1. `workflows/init.md` – understand the repository context
2. `workflows/extract-requirements.md` – extract and classify requirements when a source brief exists
3. `workflows/design.md` – define the technical approach
4. `workflows/plan.md` – create an implementation plan
5. `workflows/implement.md` – implement the feature
6. `workflows/test.md` – validate behavior
7. `workflows/review.md` – evaluate code quality
8. `workflows/compliance-check.md` – confirm coverage against the brief when applicable
9. `workflows/polish.md` – improve clarity and maintainability

Agents should not skip steps unless explicitly instructed.

For the practical end-to-end flow of executing a new user story or bug, read `workflows/execute-work-item.md`.

When a user provides a new story, bug, feature request, or complex task brief, agents should treat that context as enough to start the workflow. Users should not need to restate the full meta-process manually.

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
workflows/extract-requirements.md  
workflows/execute-work-item.md  
workflows/design.md  
workflows/plan.md  
workflows/implement.md  
workflows/test.md  
workflows/review.md  
workflows/compliance-check.md  
workflows/polish.md  

/prompts  
Reusable prompts that orchestrate workflows.

Example:

prompts/analyze-repo.md  
prompts/implement-from-brief.md  
prompts/implement-task.md  
prompts/refresh-context.md  
prompts/refactor.md  

/.devcontainer
Optional shared container configuration included in container-ready generated projects.

/scripts
Project scripts, including `scripts/sync-project-context.sh` for refreshing generated context files.

/docs
Generated and maintained project guidance such as `docs/project-context.md`, `docs/dependencies.md`, and `docs/stack-guide.md`.

/README.md
Project overview and onboarding guide. In generated projects, this file is refreshed by `scripts/sync-project-context.sh`.

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

Projects can be generated in two modes:

- standard projects without `.devcontainer`
- container-ready projects with a shared `.devcontainer`

When `.devcontainer` is present, work can happen in a containerized environment with the required SDKs preinstalled.

Generated projects include curated markdown assets from the base `prompts/`, `specs/`, and `tasks/` scaffold, plus documentation for the selected stack. They should not inherit the full internal history of this generator repository.

Generated projects also include stack-aware context files. Agents should read these before making feature changes:

- `README.md`
- `prompts/current-project.md`
- `docs/project-context.md`
- `docs/dependencies.md`
- `docs/stack-guide.md`

After adding frameworks, changing dependencies, or reorganizing the application, run `bash scripts/sync-project-context.sh` to refresh the generated `README.md`, context files, and prompts.

When the repository has evolved significantly since generation, agents can use `prompts/refresh-context.md` to refresh the context before planning implementation work.

When a user provides a complex task brief or requirement-heavy story, agents should use `prompts/implement-from-brief.md` and finish with explicit requirement-by-requirement compliance reporting.

---

# Agent Behavior

Agents should:

- explore the repository before making changes
- understand the architecture and existing patterns
- implement changes incrementally
- avoid large refactors unless required
- prefer minimal and safe modifications
- automatically create the task, spec, and implementation plan when the user provides only the work context
- automatically run requirement extraction and compliance review when a source brief exists

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
