# Polish Workflow

## Purpose

Improve the quality, clarity, and maintainability of the implementation before considering the task complete.

This step focuses on refining the code after the initial implementation.

---

## Triggers

Use this workflow:

- after implementing a task
- before submitting code for review
- before marking a task as completed

---

## Workflow

### 1. DRY Review

Ensure the code avoids unnecessary duplication.

Look for:

- duplicated logic
- repeated patterns
- opportunities to extract reusable functions or utilities

---

### 2. KISS Review

Simplify the implementation.

Check for:

- overly complex logic
- unnecessary abstractions
- deep nesting
- confusing control flow

Prefer simple and readable solutions.

---

### 3. SOLID Principles

Evaluate whether the code respects core design principles.

Focus on:

- single responsibility
- clear separation of concerns
- loosely coupled components
- modular design

---

### 4. Code Clarity

Improve readability.

Check for:

- meaningful variable and function names
- clear structure
- logical grouping of code
- removal of dead or unused code

---

### 5. Consistency

Ensure the implementation follows existing project conventions.

Check for:

- naming conventions
- file organization
- architectural patterns used in the repository

---

### 6. Final Validation

Before completing the task:

- verify the code compiles or runs successfully
- ensure the implementation satisfies the task requirements
- confirm no obvious issues remain

---

## Output

The result should be:

- clear and maintainable code
- consistent with project patterns
- easier for other developers to understand