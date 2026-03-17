# Testing Workflow

## Purpose

Validate that the implementation works and that each required requirement has evidence behind it.

This workflow focuses on behavior, failure cases, and requirement coverage.

---

## Triggers

Use this workflow when:

- validating a completed implementation
- testing a bug fix
- checking a complex task solution
- confirming that required behavior is covered before review

---

## Workflow

### 1. Build The Validation Matrix

Start from the required requirements checklist.

For each required item, identify:

- automated tests
- manual validation steps
- runtime or build checks

---

### 2. Test Core Behavior

Verify the primary success paths first.

Examples:

- main endpoints
- core service flows
- expected state transitions
- happy-path commands

---

### 3. Test Invalid And Edge Cases

Cover:

- invalid requests
- missing resources
- unexpected states
- input validation failures
- error handling behavior

---

### 4. Test Concurrency-Sensitive Behavior

When the implementation uses shared in-memory state or orchestration logic, add focused tests for:

- concurrent requests
- race-prone updates
- ordering-sensitive flows
- thread-safe access patterns

---

### 5. Run Commands And Record Results

Run the most relevant validation commands.

Record:

- test commands
- pass or fail results
- important warnings
- anything that could not be validated

---

## Output

Produce:

- tests executed
- validation results
- uncovered areas
- remaining risks or blockers
