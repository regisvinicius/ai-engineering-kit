# Task

title: Add AI task workflow

## Goal

Introduce a lightweight task-management workflow that gives AI agents a clear place to pick up, advance, and complete work.

## Context

The repository originally documented specs and workflows but did not define how tasks should move through the lifecycle of a feature. Adding `/tasks` plus a standard template closes that gap and makes the repository easier to use as a repeatable starter kit.

## Requirements

- Create the `/tasks` directory
- Add `backlog`, `in-progress`, and `done` subdirectories
- Add `tasks/TASK_TEMPLATE.md` with the standard task fields
- Update `AGENTS.MD` to explain the workflow `backlog -> in-progress -> done`

## Acceptance Criteria

- The repository contains the task-state directories under `/tasks`
- The repository contains `tasks/TASK_TEMPLATE.md`
- `AGENTS.MD` documents how tasks move from backlog to in-progress to done
