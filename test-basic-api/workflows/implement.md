# Implementation Workflow

## Purpose

Implement features or tasks according to the defined plan and project architecture.

This workflow focuses on writing clean, maintainable code that satisfies the task requirements.

---

## Triggers

Use this workflow when:

- implementing a task from `/tasks`
- developing a new feature
- executing an implementation plan
- adding new functionality

---

## Workflow

### 1. Preparation

Before writing code:

- read the task description in `/tasks`
- review the design and plan if available
- review the extracted requirements and coverage checklist when a brief exists
- identify the files or modules to modify
- understand relevant parts of the codebase

---

### 2. Implementation

Implement the required functionality.

Guidelines:

- follow the project architecture
- reuse existing components when possible
- keep functions small and focused
- prefer clear and readable code
- keep transport or controller layers thin when business rules deserve their own service or orchestration layer
- use explicit models for important requests, responses, state, and domain concepts when it improves clarity

Focus on:

- correctness
- maintainability
- minimal complexity
- requirement coverage

---

### 3. Integration

Ensure the new code integrates correctly with the existing system.

Check:

- imports and dependencies
- configuration updates
- compatibility with existing modules

---

### 4. Verification

Validate that the implementation satisfies the requirements.

Verify:

- expected behavior
- edge cases
- error handling
- that each required requirement is either covered or explicitly blocked

---

### 5. Build and Validation

If applicable:

- ensure the project builds successfully
- run available tests
- verify no critical errors or warnings

---

## Guidelines

Prefer:

- small, focused functions
- clear naming conventions
- modular design

Avoid:

- unnecessary dependencies
- overly complex logic
- large refactors unless required by the task
- declaring completion before all non-optional requirements are accounted for

---

## Output

The implementation should result in:

- working functionality
- clean and readable code
- alignment with project conventions
