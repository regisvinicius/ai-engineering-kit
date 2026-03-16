# Engineering Playbook

This repository follows an AI-assisted development workflow designed for both human developers and coding agents.

The goal is to maintain a clear and consistent process for implementing features and improving the codebase.

---

# Project Structure

Key directories in this repository:

/.devcontainer  
Optional shared development container configuration included in container-ready generated projects.

/tasks  
Contains tasks that define work to be implemented.

tasks/backlog  
Tasks that are ready to be worked on.

tasks/in-progress  
Tasks currently being implemented.

tasks/done  
Completed tasks.

/specs  
Feature specifications and design requirements.

/workflows  
Guidelines that define how development steps should be executed.

`workflows/execute-work-item.md` is the practical checklist for starting and completing a new user story or bug.

/scripts  
Project scripts such as `scripts/sync-project-context.sh`.

/docs  
Generated and maintained project guidance, including stack-aware context files.

/README.md  
Project overview and onboarding guide. In generated projects, this file is refreshed by `scripts/sync-project-context.sh`.

/src  
Application source code.

---

# Development Environment

Projects can be generated in two modes:

- standard projects without `.devcontainer`
- container-ready projects with `.devcontainer`

When `.devcontainer` is present, use it to run the project inside a containerized environment instead of relying on host-installed SDKs.

The shared container supports:

- Node-based stacks such as Node, React, and Angular
- .NET-based stacks such as ASP.NET Web API

Generated projects inherit curated markdown assets from the base `prompts/`, `specs/`, and `tasks/` scaffold, plus documentation for the selected stack. They should not inherit the full internal history of this generator repository.

Generated projects also include stack-aware context files that should be read before major changes:

- `README.md`
- `prompts/current-project.md`
- `docs/project-context.md`
- `docs/dependencies.md`
- `docs/stack-guide.md`

After adding frameworks, dependencies, or major architectural changes, run `bash scripts/sync-project-context.sh` to refresh the generated `README.md` and context files.

When the repository has evolved enough that the generated guidance may be stale, use `prompts/refresh-context.md` and rerun the sync command before planning implementation work.

---

# Development Workflow

Work should follow this sequence:

1. init  
2. design  
3. plan  
4. implement  
5. test  
6. review  
7. polish

Each step has a corresponding workflow document in `/workflows`.

For the practical end-to-end execution flow of a story or bug, start with `workflows/execute-work-item.md`.

---

# Working with Tasks

Tasks represent units of work.

Typical lifecycle:

backlog → in-progress → done

When implementing a task:

1. read the task description
2. analyze the repository context
3. design a solution
4. create an implementation plan
5. implement the feature
6. validate with tests
7. review and polish the implementation

---

# Implementation Principles

Follow these principles during development:

- prefer simple and maintainable solutions
- reuse existing components when possible
- maintain consistency with project architecture
- avoid unnecessary complexity

---

# Code Quality

Before marking work as complete:

- ensure the implementation satisfies the task requirements
- verify integration with the existing system
- ensure the code is readable and maintainable

---

# Notes for AI Agents

Agents should:

- understand the repository before modifying code
- follow the workflows defined in `/workflows`
- implement tasks incrementally
- avoid large refactors unless required
