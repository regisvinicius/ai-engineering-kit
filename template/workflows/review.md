# Review Workflow

## Purpose

Evaluate the quality and correctness of an implementation before considering the task complete.

The review should identify issues, verify compliance with project conventions, and suggest improvements.

---

## Triggers

Use this workflow when:

- reviewing completed work
- preparing a pull request
- performing a quality check after implementation

---

## Workflow

### 1. Triage Matrix

Classify findings based on severity.

Categories:

- Critical issues — must be fixed before approval
- Important issues — should be fixed if possible
- Minor issues — small improvements
- Suggestions — optional improvements

---

### 2. Code Analysis

Review the implementation and verify:

- correctness of the solution
- logical consistency
- proper integration with the existing system
- alignment with the task, spec, and source brief

Look for:

- potential bugs
- incomplete implementations
- incorrect assumptions

---

### 3. Code Quality

Evaluate overall code quality.

Check for:

- code duplication
- unnecessary complexity
- unclear naming
- large or overly complex functions
- missing error handling

---

### 4. Pattern Compliance

Ensure the code follows project conventions.

Verify:

- consistency with existing patterns
- adherence to architectural structure
- proper file organization

---

### 5. Risk Assessment

Identify potential risks such as:

- edge cases not handled
- fragile logic
- dependency issues
- performance concerns
- required items that appear only partially implemented

---

### 6. Requirement Coverage Review

Check each non-optional requirement and confirm whether it is:

- implemented and validated
- blocked with a concrete explanation
- missing

---

### 7. Feedback

Provide clear and actionable feedback.

Include:

- issues to fix
- suggested improvements
- positive observations when applicable

---

## When Issues Are Found

If the review identifies Critical, Important, Minor, or Suggestion items to fix:

1. Write the review report to `plans/review-report.md` (see `plans/REVIEW_REPORT_TEMPLATE.md` for structure)
2. Run `workflows/review-fix.md` to address the issues in priority order

---

## Output

Produce a prioritized list of issues, recommended improvements, approval or required changes, and notes on requirement coverage gaps if any remain.

**When producing a written report:** Use the structure in `plans/REVIEW_REPORT_TEMPLATE.md` and write to `plans/review-report.md`.

**When issues are found:** Run `workflows/review-fix.md` to address them. The user can provide the review report (or its path) and say "fix the review issues" or "run review-fix".
