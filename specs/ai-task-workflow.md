# AI Task Workflow

## Goal

Add a repository-level task workflow that lets AI agents track work from intake to completion.

## Context

The repository already defines how agents should design, implement, and review features, but it does not yet provide a standard place to track task state. A shared task structure makes it easier to coordinate work and understand what is queued, active, or finished.

## Requirements

- Create a `/tasks` directory
- Create `/tasks/backlog`
- Create `/tasks/in-progress`
- Create `/tasks/done`
- Add `/tasks/TASK_TEMPLATE.md`
- Update `AGENTS.md` to explain the task workflow `backlog -> in-progress -> done`

## Acceptance Criteria

- The repository contains the three task-state directories under `/tasks`
- The repository contains `/tasks/TASK_TEMPLATE.md` with the required fields
- `AGENTS.md` explains how tasks move from backlog to in-progress to done
