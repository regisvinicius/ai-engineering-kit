# Execute Work Item Workflow

## Purpose

Provide a practical step-by-step flow for working on a new user story, bug fix, or small enhancement.

This workflow connects the task lifecycle, specification process, AI context files, and implementation workflows into one repeatable routine.

---

## Triggers

Use this workflow when:

- starting a new user story
- fixing a bug
- implementing a small feature request
- resuming work on an existing task after the project has changed

---

## Standard Flow

### 1. Refresh Context

Before planning or coding:

- read `README.md`
- read `AGENTS.md` and `PLAYBOOK.md`
- read `prompts/current-project.md`
- read `docs/project-context.md`
- read `docs/dependencies.md`

If the project has changed since the last task:

- run `bash scripts/sync-project-context.sh`
- re-read the generated context files

Use `prompts/refresh-context.md` when the project has evolved and the generated guidance may be stale.

---

### 2. Formalize The Work

Create a task in `tasks/backlog` using `tasks/TASK_TEMPLATE.md`.

Then create or update a specification in `specs/`.

Recommended rule:

- user story: focus on business goal, requirements, and acceptance criteria
- bug: focus on symptoms, reproduction steps, expected behavior, root cause assumptions, and validation
- complex or brief-driven work: run `workflows/extract-requirements.md` first and keep a required versus optional checklist

---

### 3. Move The Task Into Execution

When work is ready to start:

- move the task from `tasks/backlog` to `tasks/in-progress`

Only move to `in-progress` when the work is active.

---

### 4. Run The Core Workflows

Execute the standard project workflows in order:

1. `workflows/init.md`
2. `workflows/extract-requirements.md` when a source brief exists
3. `workflows/design.md`
4. `workflows/plan.md`
5. `workflows/implement.md`
6. `workflows/test.md`
7. `workflows/review.md`
8. `workflows/compliance-check.md` when a source brief exists
9. `workflows/polish.md`

Do not skip steps unless the task is truly trivial.

---

### 5. Implement In Small Steps

During implementation:

- prefer small, verifiable changes
- keep code aligned with `docs/architecture.md` if present
- reuse existing modules and patterns
- update specs or task notes if scope changes

If you add or change:

- frameworks
- SDK packages
- Docker or infrastructure files
- runtime commands
- top-level folders

run:

```bash
bash scripts/sync-project-context.sh
```

This refreshes:

- `README.md`
- `docs/project-context.md`
- `docs/dependencies.md`
- `docs/stack-guide.md`
- `prompts/current-project.md`

---

### 6. Validate The Outcome

Before finishing:

- run the relevant tests
- verify the acceptance criteria
- check edge cases and error handling
- confirm the feature or bug fix works in the expected entrypoints

---

### 7. Close The Work

When implementation, validation, review, and polish are complete:

- move the task from `tasks/in-progress` to `tasks/done`

The task should only be marked done when the behavior is working and the documentation/context is current.

---

## Quick Variants

### User Story

Recommended path:

1. sync context
2. create task
3. create spec
4. extract and classify requirements when needed
5. move task to `in-progress`
6. design and plan
7. implement
8. validate and review compliance
9. move task to `done`

### Bug Fix

Recommended path:

1. sync context
2. create task
3. document reproduction and expected behavior in a spec
4. extract required behavior and regression coverage
5. move task to `in-progress`
6. identify root cause
7. implement minimal safe fix
8. validate the bug and regression cases
9. move task to `done`

### Complex Or Brief-Driven Story

Recommended path:

1. sync context
2. summarize repository context
3. extract and classify requirements from the brief
4. create the task
5. create the spec
6. build the implementation plan
7. implement
8. test
9. review
10. run final compliance check
11. move task to `done`

---

## Practical Reference

For a concrete example, see:

- `tasks/backlog/example-node-user-crud.md`
- `specs/example-node-user-crud.md`
