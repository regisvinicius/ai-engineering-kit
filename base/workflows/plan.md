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
- If a brief exists, align the plan to the required versus optional classification

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
- identify the required item or items it covers
- include the relevant validation or test step

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
- confirm every required requirement is covered or explicitly marked as blocked

---

## Output


Produce and write to `current-plan.md` (using `plans/CURRENT_PLAN_TEMPLATE.md` as structure):

- a numbered step-by-step implementation plan
- affected files or directories
- potential risks or edge cases
- the validation approach for each major step

Agents must not start implementation until the user has reviewed and approved `current-plan.md`, unless the task is trivial or the user explicitly skips.

