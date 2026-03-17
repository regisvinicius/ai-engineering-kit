# AI Engineering Kit – Developer Guide

## 1. Overview

**AI Engineering Kit** is an **AI engineering template generator**. It scaffolds runnable, AI-friendly applications for use with coding agents such as **Codex**, **Cursor**, and **Claude**.

What it provides:

- **Stack-specific templates** – Node.js, .NET, React, Angular
- **Shared AI workflow files** – `AGENTS.md`, `PLAYBOOK.md`, workflows, prompts
- **Task and spec scaffolding** – backlog → in-progress → done
- **Optional `.devcontainer`** – container-ready development environments
- **Context sync** – scripts to refresh README and stack-specific docs

Generated projects are ready for both humans and AI agents to implement features using a consistent process.

---

## 2. Folder Structure

| Path | Purpose |
|------|---------|
| **template/** | Shared scaffold copied into every generated project (tasks, specs, workflows, prompts, plans, scripts, `.devcontainer`) |
| **stacks/** | Technology-specific templates. Each stack (node, react, dotnet, angular) has a `template/` subfolder, `setup.sh`, and `context/` assets |
| **scripts/** | Project generator entrypoints: `create-ai-project.sh`, `create-ai-container-project.sh`, `create-ai-project-from-template.sh` |
| **AGENTS.md** | Rules for AI agents: plan-before-implement, workflow sequence, task lifecycle, project structure |
| **PLAYBOOK.md** | High-level workflow and development process overview |
| **workflows/** | Step-by-step markdown processes (init, design, plan, implement, test, review, polish, etc.) |
| **prompts/** | Reusable commands/skills for AI agents (implement-task, implement-from-brief, refresh-context, analyze-repo) |
| **tasks/** | Units of work: `backlog/`, `in-progress/`, `done/`, plus `TASK_TEMPLATE.md` |
| **specs/** | Feature specifications and design requirements |
| **plans/** | Plan templates (`CURRENT_PLAN_TEMPLATE.md`, delivery/requirements report templates) |
| **docs/** | Project guidance (this guide, stack-specific docs generated on sync) |

---

## 3. How to Create a Project

### Commands

Generic (any stack):

```bash
pnpm run create <stack> <project-name>
pnpm run create:container <stack> <project-name>
```

Stack shortcuts:

```bash
pnpm run create:node my-api
pnpm run create:node:container my-api

pnpm run create:react my-app
pnpm run create:react:container my-app

pnpm run create:dotnet billing-api
pnpm run create:angular admin-ui
```

**Examples:**

```bash
pnpm run create node my-api
pnpm run create react my-app
```

### What Happens Internally

1. **Validate** – Ensure `<stack>` exists under `stacks/` and `<project-name>` does not exist in `~/development/` (or `$AI_PROJECTS_BASE_DIR`).
2. **Copy shared template** – `AGENTS.md`, `PLAYBOOK.md`, and everything from `template/` into the target directory.
3. **Devcontainer** – For `create` (standard): remove `.devcontainer`. For `create:container`: keep it.
4. **Copy stack template** – Overlay `stacks/<stack>/template/` onto the project.
5. **Stack context** – Copy `stacks/<stack>/context/` into `.ai-kit/context/stack`.
6. **Stack markdown** – Copy stack docs into `docs/stack/`.
7. **Setup** – Run `stacks/<stack>/setup.sh` if present (e.g. npm install).
8. **Context sync** – Run `scripts/sync-project-context.sh` to generate README, `docs/project-context.md`, `docs/dependencies.md`, `docs/stack-guide.md`, `prompts/current-project.md`.
9. **Git init** – Initialize a new git repository.

The result is a runnable project with AI workflow files ready for agents.

---

## 4. Development Workflow

Generated projects follow this sequence:

1. **init** – Understand the repository and context
2. **extract-requirements** – When a source brief exists, extract and classify requirements
3. **design** – Define the technical approach
4. **plan** – Create an implementation plan (write to `plans/current-plan.md`)
5. **implement** – Build the feature
6. **test** – Validate behavior
7. **review** – Evaluate code quality
8. **compliance-check** – Confirm coverage against the brief when applicable
9. **polish** – Improve clarity and maintainability

Each step maps to a file in `workflows/`:

- `workflows/init.md`
- `workflows/extract-requirements.md`
- `workflows/design.md`
- `workflows/plan.md`
- `workflows/implement.md`
- `workflows/test.md`
- `workflows/review.md`
- `workflows/compliance-check.md`
- `workflows/polish.md`

**How agents should follow it:** Read `workflows/execute-work-item.md` for the practical end-to-end flow. That workflow wires tasks, specs, plans, and implementation into one repeatable routine.

---

## 5. When to Use What

### workflows/

Use when you want **step-by-step execution** of a single phase.

| Use case | Workflow |
|----------|----------|
| Start a new user story or bug | `execute-work-item.md` |
| Understand the repo | `init.md` |
| Design a solution | `design.md` |
| Create a plan and pause for approval | `plan.md` |
| Implement | `implement.md` |
| Validate behavior | `test.md` |
| Evaluate quality | `review.md` |
| Check requirements coverage | `compliance-check.md` |
| Final cleanup | `polish.md` |

**Example:** An agent follows `workflows/plan.md` to produce `plans/current-plan.md` before writing code.

### prompts/

Use when you want to **trigger a full flow** or orchestrate multiple workflows.

| Use case | Prompt |
|----------|--------|
| Implement a single task from backlog | `implement-task.md` |
| Implement a complex brief with requirement extraction | `implement-from-brief.md` |
| Refresh context after big changes | `refresh-context.md` |
| Analyze the repo | `analyze-repo.md` |
| Refactor | `refactor.md` |
| Debug | `debug.md` |

**Example:** "Follow `prompts/implement-task.md` for `tasks/backlog/001-auth.md`" – the agent runs the full workflow for that task.

### tasks/

Use when you want to **define units of work** and track progress.

- **backlog/** – Ready to be worked on
- **in-progress/** – Currently being implemented
- **done/** – Completed
- **TASK_TEMPLATE.md** – Template for new tasks

Tasks should be small and well-defined. Lifecycle: `backlog` → `in-progress` → `done`.

**Example:** Create `tasks/backlog/001-add-user-crud.md` using `TASK_TEMPLATE.md`, then move it to `in-progress` when implementation starts.

---

## 6. Using with AI Agents

### With Codex

Point Codex at the generated project. Ensure it reads:

- `AGENTS.md`
- `PLAYBOOK.md`
- `prompts/current-project.md`

For a specific task:

> Follow `prompts/implement-task.md` for `tasks/backlog/001-auth.md`

For a complex brief:

> Follow `prompts/implement-from-brief.md` with [your brief attached]

### With Cursor

Cursor can use `.cursor/rules` to load rules from this kit. Generated projects may include equivalent rules.

To work on a task:

> Follow `prompts/implement-task.md` for `tasks/backlog/001-auth.md`

Or to run the day-to-day flow:

> Follow `workflows/execute-work-item.md`. I want to implement [user story / bug description].

Agents should always create a plan via `workflows/plan.md`, write it to `plans/current-plan.md`, and **pause for your approval** before implementing (unless the change is trivial or you say to skip).

---

## 7. Best Practices

| Practice | Why |
|----------|-----|
| **Keep tasks small** | Easier to implement, review, and validate |
| **Always plan before implementing** | Reduces rework and keeps changes aligned with intent |
| **Avoid large refactors** | Prefer incremental, safe changes |
| **Follow project conventions** | Use the stack’s architecture and patterns |
| **Run `sync-project-context.sh` after changes** | Keeps README and context docs up to date |
| **Read context files before changes** | `docs/project-context.md`, `docs/dependencies.md`, `docs/stack-guide.md` |
| **Treat specs as source of truth** | When a spec exists, implement against it |
| **Do not skip review and polish** | Both are required before marking work done |

---

## Quick Reference

**Create project:**
```bash
pnpm run create node my-api
pnpm run create react my-app
```

**Refresh generated context (in a generated project):**
```bash
bash scripts/sync-project-context.sh
```

**Task lifecycle:** `backlog` → `in-progress` → `done`

**Workflow sequence:** init → extract-requirements (when needed) → design → plan → implement → test → review → compliance-check (when needed) → polish
