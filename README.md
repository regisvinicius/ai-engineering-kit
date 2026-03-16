# AI Engineering Kit

AI Engineering Kit is a project generator for AI-friendly application scaffolds.

It creates runnable projects with:

- a selected stack template
- shared AI workflow files such as `AGENTS.md` and `PLAYBOOK.md`
- task, spec, prompt, and workflow folders
- optional `.devcontainer` support
- generated project context files refreshed by `scripts/sync-project-context.sh`

## Supported Stacks

- Node.js + Fastify + TypeScript
- ASP.NET Core Web API
- React + Vite + TypeScript
- Angular

## What Generated Projects Include

Every generated project includes:

- `AGENTS.md`
- `PLAYBOOK.md`
- `tasks/`
- `specs/`
- `workflows/`
- `prompts/`
- `docs/`
- `scripts/sync-project-context.sh`

The stack template adds the application code for the selected runtime or framework.

## Generation Modes

Two generation modes are supported:

- standard: generates the project without `.devcontainer`
- container-ready: generates the project with `.devcontainer`

The shared devcontainer supports both Node-based projects and .NET projects.

## Usage

Generic commands:

```bash
pnpm run create <stack> <project-name>
pnpm run create:container <stack> <project-name>
```

Stack shortcuts:

```bash
pnpm run create:node payments-api
pnpm run create:node:container payments-api

pnpm run create:dotnet billing-api
pnpm run create:dotnet:container billing-api

pnpm run create:react dashboard
pnpm run create:react:container dashboard

pnpm run create:angular admin-ui
pnpm run create:angular:container admin-ui
```

## Generated Project Workflow

Generated projects follow the AI workflow described in `AGENTS.md` and `PLAYBOOK.md`.

Task flow:

```text
backlog -> in-progress -> done
```

Development flow:

```text
init -> design -> plan -> implement -> test -> review -> polish
```

## Context Sync

Generated projects include a managed context sync command:

```bash
bash scripts/sync-project-context.sh
```

This refreshes:

- `README.md`
- `docs/project-context.md`
- `docs/dependencies.md`
- `docs/stack-guide.md`
- `prompts/current-project.md`

Use it after adding frameworks, changing dependencies, introducing infrastructure files, or reorganizing the project.

## Repository Structure

- `base/` contains the shared scaffold copied into generated projects
- `stacks/` contains stack templates, setup scripts, and stack-aware context assets
- `scripts/` contains the generator entrypoints
- `specs/` and `tasks/` track work on this generator itself

## Goal

The goal of this repository is to give each new project a solid technical starting point and an AI-friendly workflow that stays useful as the codebase grows.
