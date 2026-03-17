# Compliance Check Workflow

## Purpose

Verify final delivery against the source brief or task before declaring the work complete.

This workflow makes missing requirements visible and prevents premature completion.

---

## Triggers

Use this workflow when:

- finishing a user story from a brief
- completing a complex task or take-home task
- closing a bug fix with explicit expected behavior
- preparing a final delivery summary

---

## Workflow

### 1. Re-Read The Source Of Truth

- re-read the task
- re-read the spec
- re-read the source brief or user story

Do not rely on memory alone.

---

### 2. Review Each Required Requirement

For each non-optional requirement, mark it as one of:

- implemented and validated
- blocked
- missing

If blocked, include:

- the concrete reason
- what was attempted
- what is still needed

---

### 3. Verify Evidence

For each required item, confirm the evidence:

- code location
- test coverage
- manual validation
- build or runtime confirmation

Avoid marking a requirement complete without evidence.

---

### 4. Review Optional Bonus Items

Mark optional items as:

- completed
- partially completed
- not implemented

Optional items should never be confused with required coverage.

---

### 5. Summarize Tradeoffs And Risks

Call out:

- design tradeoffs
- technical debt intentionally left
- blocked items
- missing optional items
- known limitations

---

## Output

Produce exactly one report:

**Simple tasks** (no external brief/spec as source of truth):

- Write to `plans/delivery-summary.md` using `plans/DELIVERY_SUMMARY_TEMPLATE.md`
- Contents: task & spec refs, requirements vs delivery, acceptance criteria, artifacts, optional items, tradeoffs
- Present to the user

**Brief-driven or complex work** (PDF, spec, or explicit requirements doc as source of truth):

- Write to `plans/requirements-report.md` using `plans/REQUIREMENTS_REPORT_TEMPLATE.md`
- This single report replaces the Delivery Summary; it includes all sections (Executive Summary, Requirements by level, Bonus, Technical Specifications, Gaps, Test Coverage, Acceptance criteria, Artifacts, Conclusion)
- Present to the user

Do not close the task until the report is written to disk and all required items are either done or explicitly blocked.
