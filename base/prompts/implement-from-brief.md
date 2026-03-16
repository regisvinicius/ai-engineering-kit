# Implement From Brief

Use this prompt when a user provides a complex task brief, user story, bug brief, or requirements document.

The user does not need to restate the full meta-workflow. A plain brief should be enough to trigger this process.

## Source Of Truth

Treat the brief as the source of truth.

Read `README.md` first, then read the codebase.

Do not start coding immediately.

## Execution Order

1. repository/context summary
2. requirement extraction and classification
3. task creation
4. spec creation
5. implementation plan
6. implementation
7. tests
8. review
9. final compliance check against the brief

## Required Process

Before implementation:

1. follow `workflows/init.md`
2. follow `workflows/extract-requirements.md`
3. classify requirements into:
   - required
   - optional bonus
4. create a checklist that maps each required item to:
   - code changes
   - tests
   - validation method
5. create the task in `/tasks`
6. create the matching spec in `/specs`
7. create an implementation plan using `workflows/plan.md`

During implementation:

- follow `workflows/design.md`, `workflows/implement.md`, `workflows/test.md`, and `workflows/review.md`
- do not consider the work complete until every non-optional requirement is either:
  - implemented and validated
  - or explicitly called out as blocked with a concrete reason
- prioritize correctness and requirement coverage over premature simplification
- keep the solution easy to explain

After implementation:

- follow `workflows/compliance-check.md`

## Final Output

**For brief-driven work:** Write `plans/requirements-report.md` using `plans/REQUIREMENTS_REPORT_TEMPLATE.md`. This single report replaces the Delivery Summary and includes: Executive Summary, Requirements by level, Technical Specifications, Gaps, Test Coverage, Acceptance criteria, Artifacts, Conclusion.

Also include:

- short context summary
- extracted requirement checklist
- task file path
- spec file path
- implementation plan

Do not consider the work complete until `requirements-report.md` is written to disk and presented to the user.
