# Task

title: Improve project generator script

## Goal

Make the project bootstrap script create repositories that already include the current AI workflow conventions.

## Context

The repository contains `scripts/create-ai-project.sh` plus shared base workflow files. Now that task tracking has been added, new generated projects should start with `/specs`, `/tasks`, and workflow guidance already in place instead of requiring manual setup after generation.

## Requirements

- Update `scripts/create-ai-project.sh` to scaffold the `tasks` directory structure
- Ensure generated projects include the task template and workflow documents
- Validate required inputs before scaffolding begins
- Keep the script simple and easy to maintain

## Acceptance Criteria

- Running the generator creates `tasks/backlog`, `tasks/in-progress`, and `tasks/done`
- The generated project includes `tasks/TASK_TEMPLATE.md`
- The script fails with a clear message when required inputs are missing
