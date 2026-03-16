# Task

title: Add a shared devcontainer for generated projects

## Goal

Allow generated projects to run inside a shared development container instead of depending on local machine toolchains.

## Context

The template generator now supports Node, .NET, React, and Angular stacks. A shared devcontainer will give generated projects a consistent runtime with both Node and .NET available, which makes it easier to onboard and work across stacks.

## Requirements

- Add a shared `.devcontainer` to the base scaffold copied into generated projects
- Ensure the container supports Node-based stacks and .NET stacks
- Automatically bootstrap project dependencies inside the container
- Update generated-project documentation to mention the devcontainer

## Acceptance Criteria

- Generated projects include `.devcontainer/devcontainer.json`
- The devcontainer provides both Node and .NET tooling
- Opening a generated project in the devcontainer runs the appropriate bootstrap commands
- Generated project docs mention the shared devcontainer workflow
