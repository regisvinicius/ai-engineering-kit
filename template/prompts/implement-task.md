# Implement Task

Implement a task from `/tasks`.

Steps:

1. Read the task definition
2. Read `README.md` first
3. Follow `workflows/init.md` to understand the repository
4. If a source brief exists, follow `workflows/extract-requirements.md`
5. Use `workflows/design.md` to define the solution
6. Create a plan using `workflows/plan.md`
7. Implement the solution using `workflows/implement.md`
8. Validate the implementation with `workflows/test.md`
9. Evaluate quality using `workflows/review.md`
10. Run `workflows/compliance-check.md` and produce the **Delivery Summary**
11. Improve the implementation using `workflows/polish.md`

Ensure:

- the task requirements are satisfied
- every non-optional requirement is implemented and validated or explicitly blocked
- the solution follows project architecture
- the implementation is clean and maintainable

Output:

- **Delivery Summary** (use `plans/DELIVERY_SUMMARY_TEMPLATE.md`) – Requirements vs Delivery, Acceptance criteria, Artifacts
- summary of changes
- files modified or created
- tests executed and results
