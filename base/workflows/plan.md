# Planning Workflow

## Purpose

Create a clear implementation plan before writing any code.

The goal of this workflow is to break down the task into small, verifiable steps that can be executed sequentially.

---

## Triggers

Use this workflow when:

- starting a new task
- implementing a feature
- performing a refactor
- addressing complex changes

---

## Workflow

### 1. Understand the Task

- Read the task description in `/tasks`
- Identify the goal and expected outcome
- Review requirements and acceptance criteria

---

### 2. Identify Affected Areas

Determine which parts of the codebase will be impacted.

Look for:

- relevant modules
- related components
- existing implementations
- configuration files

---

### 3. Break Down the Work

Create a sequence of small implementation steps.

Each step should:

- be focused on a single change
- reference specific files when possible
- be easy to verify

Example:

1. create server entry point
2. implement health endpoint
3. add logging middleware
4. update configuration

---

### 4. Validate the Plan

Before implementation:

- ensure the plan satisfies the task requirements
- confirm the steps follow the project architecture
- avoid unnecessary complexity

---

## Output

Provide:

- a numbered step-by-step implementation plan
- affected files or directories
- potential risks or edge cases