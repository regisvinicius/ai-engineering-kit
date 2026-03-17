# Review Fix Workflow

## Purpose

Address issues found in a code review. Takes a review report as input and applies fixes in priority order.

Use this workflow after `workflows/review.md` when the review identifies issues to fix.

---

## Triggers

Use this workflow when:

- a review report lists Critical, Important, Minor, or Suggestion items
- a PR or review feedback requires code changes
- the user provides a review report (e.g. from another PR or tool)

---

## Input

- A review report with issues classified by severity (Critical, Important, Minor, Suggestions)
- Or a pointer to the review output (e.g. `plans/review-report.md` or inline feedback)

---

## Workflow

### 1. Parse the Review Report

Read the review report and extract:

- **Triage Matrix** – count and list items per severity
- **Issues to fix** – each item with location (file:line), description, and recommended fix
- **Risk assessment** – any mitigation steps noted

---

### 2. Prioritize Fixes

Fix in this order:

| Priority | Severity | Action |
|----------|----------|--------|
| 1 | Critical | Must fix before merge. Block all other work. |
| 2 | Important | Fix in this pass. Affects correctness or robustness. |
| 3 | Minor | Fix when practical. Bugs, clarity, small improvements. |
| 4 | Suggestions | Optional. Apply if quick; defer or skip if not. |

---

### 3. Create a Fix Plan

For each issue:

- **Location** – file and line (or region)
- **Fix** – concrete code change or approach
- **Validation** – how to verify the fix (test, manual check)

Write the plan to `plans/review-fix-plan.md` or include it in the current plan.

**Pause** and ask the user to approve the fix plan for Important and Critical items, unless the changes are trivial.

---

### 4. Implement Fixes

Apply fixes in priority order:

1. Critical – fix first
2. Important – fix next
3. Minor – fix as batch when possible
4. Suggestions – optional, user can approve or defer

Prefer small, focused commits per severity or per logical change.

---

### 5. Validate

After each fix or batch:

- Run tests: `dotnet test`, `pnpm test`, or equivalent
- Re-check the specific scenario or file that was flagged
- For Important items (e.g. busy-loop, unserviceable requests): add or run a targeted test

---

### 6. Re-run Review (Optional)

For Important or Critical fixes:

- Re-run `workflows/review.md` on the changed files
- Confirm the original issues are resolved and no new issues were introduced

---

## Output

- All Critical and Important issues addressed (or explicitly deferred with user approval)
- Minor and Suggestion items addressed as agreed
- Tests passing
- Optional: updated review report or fix summary

---

## Example Fix Mapping

From a typical review report:

| Severity | Issue | Fix approach |
|----------|-------|--------------|
| Important | Unserviceable request busy-loop | Detect when no elevator can serve; reject request or fail with clear error; limit retries |
| Minor | O(n) deduplication | Replace `Contains` with `HashSet<int>` if scale warrants |
| Minor | allFloors range | Use `Range(min, max - min + 1)` for correct floor coverage |
| Minor | Payload binding | Add `[FromBody]` or equivalent to POST route parameters |
| Suggestion | API docs | Add XML docs or OpenAPI descriptions |
| Suggestion | Timeout for stuck elevators | Add watchdog or timeout logic per PDF |
| Suggestion | Integration tests | Add HTTP endpoint tests |
