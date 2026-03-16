# Requirement Extraction Workflow

## Purpose

Extract, classify, and organize requirements before implementation starts.

This workflow is especially useful when a user story, complex task brief, or bug report is the source of truth.

---

## Triggers

Use this workflow when:

- a brief or complex task statement is provided
- a user story contains many requirements
- a bug report includes expected behavior and validation details
- missing scope coverage would be costly

---

## Workflow

### 1. Read The Source Of Truth

- read `README.md` first
- read the repository context files
- read the task or brief carefully
- treat the brief as the source of truth unless the user explicitly says otherwise

---

### 2. Extract Explicit Requirements

List every explicit requirement from the brief.

Examples:

- endpoints to implement
- commands to support
- validation rules
- concurrency requirements
- persistence constraints
- architecture constraints
- reporting expectations

Do not collapse multiple requirements into one vague bullet.

---

### 3. Extract Important Constraints

Capture important constraints and guardrails such as:

- required architecture patterns
- in-memory only rules
- thread-safety or concurrency constraints
- stack-specific expectations
- required testing scope
- completion criteria

---

### 4. Classify The Requirements

Separate items into:

- required
- optional bonus

If the brief is ambiguous, make the ambiguity explicit instead of guessing silently.

---

### 5. Build A Coverage Checklist

For each required requirement, map:

- code changes
- tests
- validation method

This checklist should make it obvious how each item will be satisfied.

---

## Output

Produce:

- a repository/context summary
- an extracted required requirements list
- an extracted optional bonus list
- a coverage checklist mapping required items to code changes, tests, and validation
