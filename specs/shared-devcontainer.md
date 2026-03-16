# Shared Devcontainer

## Goal

Add a shared development container so generated projects can run inside a consistent containerized environment.

## Context

The generator currently scaffolds runnable projects for Node, .NET, React, and Angular, but it still assumes the required SDKs are available on the local machine. A shared devcontainer can centralize those dependencies and give every generated project the same setup experience.

## Requirements

- Add `.devcontainer/devcontainer.json` to the base scaffold
- Use a shared container configuration that supports both Node and .NET toolchains
- Add a bootstrap script that installs or restores dependencies based on the generated project type
- Keep the setup generic enough to work for Node, React, Angular, and .NET projects
- Update generated-project docs to mention the devcontainer and its purpose

## Acceptance Criteria

- Generated projects include a `.devcontainer` directory from the base scaffold
- The devcontainer installs Node and .NET using official devcontainer tooling
- The bootstrap script runs `npm install` for Node-based projects and `dotnet restore` for .NET projects
- The project documentation mentions that development can happen inside the shared devcontainer
