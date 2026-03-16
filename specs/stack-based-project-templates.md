# Stack-Based Project Templates

## Goal

Enable the project generator to scaffold new AI-ready repositories with different technology stacks such as Node.js and .NET.

## Context

The repository already contains shared AI workflow assets plus an early `create-ai-project.sh` script, but it does not yet provide a complete stack-template system. Adding stack-specific templates and setup scripts will let teams create new projects that start with the shared AI workflow plus the correct application boilerplate.

## Requirements

- Create stack template directories for `node` and `dotnet`
- Add a minimal Fastify + TypeScript backend template for the Node stack
- Add a minimal ASP.NET Web API template for the .NET stack
- Add stack setup scripts for dependency restore/install
- Refactor `scripts/create-ai-project.sh` to copy base assets, copy the selected stack template, run the stack setup script, and initialize git
- Ensure generated projects include `AGENTS.md`, `PLAYBOOK.md`, `tasks/`, `specs/`, `workflows/`, and `prompts/`
- Support the usage flow `pnpm run create <stack> <project-name>`

## Acceptance Criteria

- The repository contains `stacks/node/template`, `stacks/node/setup.sh`, `stacks/dotnet/template`, and `stacks/dotnet/setup.sh`
- The Node template contains a Fastify server with a `GET /health` endpoint on port `3000`
- The .NET template contains an ASP.NET Web API with a `GET /health` endpoint
- The generator scaffolds the shared AI workflow files plus the selected stack files
- Running `pnpm run create node payments-api` or `pnpm run create dotnet billing-api` invokes the generator entrypoint successfully
