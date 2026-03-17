# Design Workflow

## Purpose

Define the technical approach before implementation starts.

The design should explain how the solution will satisfy the requirements while staying easy to understand and maintain.

---

## Triggers

Use this workflow when:

- starting a new feature
- implementing a requirement-heavy user story
- fixing a bug that touches important logic
- designing an interview-style or complex-task solution

---

## Workflow

### 1. Confirm The Target Behavior

- review the task, spec, and extracted requirements
- verify what is required versus optional
- identify the most important correctness risks

---

### 2. Identify Domain Concepts

Define the core concepts that should be modeled explicitly.

Examples:

- requests and responses
- entities and state objects
- commands and events
- schedulers, orchestrators, or services

Prefer explicit models when the problem has meaningful state or business rules.

---

### 3. Define Boundaries

Decide where logic should live.

Prefer:

- thin controllers or transport handlers
- service or orchestration layers for business rules
- small modules with clear responsibilities

Keep persistence optional unless the brief requires it.

---

### 4. Consider Validation And Concurrency

Design for:

- invalid inputs
- state transitions
- ordering or scheduling rules
- thread safety or concurrent access when shared in-memory state is involved

---

### 5. Capture Risks And Tradeoffs

Document:

- design tradeoffs
- simplifying assumptions
- anything intentionally deferred to optional or later work

---

## Output

Produce:

- technical approach summary
- affected modules and new files
- data or domain model notes
- key risks, constraints, and tradeoffs
