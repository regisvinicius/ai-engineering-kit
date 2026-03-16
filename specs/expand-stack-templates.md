# Expand Stack Templates

## Goal

Make the AI engineering template generator produce runnable projects for Node, .NET, React, and Angular with minimal but realistic application structure.

## Context

The repository already provides shared AI workflow files and a stack-aware generator, but the available templates are still limited. Node and .NET need stronger starter structures, and React plus Angular should be available as first-class stacks so the generator can support both backend and frontend projects.

## Requirements

- Keep stack templates under `stacks/<stack>/template` with a sibling `setup.sh`
- Improve the Node template with modular Fastify + TypeScript structure and `dev`, `build`, `start`, `lint` scripts
- Improve the .NET template with an `Api/` folder containing `Program.cs`, `Controllers/`, `Services/`, and `Models/`
- Add a React template using Vite + React + TypeScript with `dev`, `build`, and `preview` scripts
- Add an Angular template with a minimal runnable structure and `start` and `build` scripts
- Keep `create-ai-project.sh` responsible for copying base files, copying the selected stack template, running `setup.sh`, and initializing git
- Update root package scripts with `create:node`, `create:dotnet`, `create:react`, and `create:angular`
- Ensure generated projects still include the shared AI framework files from the base scaffold

## Acceptance Criteria

- `stacks/node`, `stacks/dotnet`, `stacks/react`, and `stacks/angular` each contain `template/` and `setup.sh`
- The Node template exposes `GET /health` and follows the requested modular structure
- The .NET template exposes `GET /health` and runs with `dotnet run`
- The React template renders `React App Ready`
- The Angular template starts with `npm install` and `npm start`
- The generator can scaffold all four stack variants through dedicated package scripts
