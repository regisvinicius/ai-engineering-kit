# Task

title: Expand stack templates for runnable app scaffolds

## Goal

Improve the existing Node and .NET stack templates and add React and Angular so the generator can produce runnable projects for backend and frontend teams.

## Context

The repository already supports stack-based project creation, but the templates are still minimal and only cover Node and .NET. This task expands the available stacks and raises each template to a more realistic starting point while keeping the shared AI workflow scaffold intact.

## Requirements

- Improve the Node template to use a modular Fastify + TypeScript structure
- Improve the .NET template to use a cleaner ASP.NET Web API structure
- Add React and Angular stack templates
- Add setup scripts for all stacks
- Update the generator and package scripts to create all stack variants
- Ensure generated projects remain runnable with the requested commands

## Acceptance Criteria

- The repository contains stack folders for `node`, `dotnet`, `react`, and `angular`
- Each stack contains `template/` and `setup.sh`
- The generated Node, .NET, React, and Angular projects include the expected file structure
- The generator supports `pnpm run create:node`, `create:dotnet`, `create:react`, and `create:angular`
