# Delivery Summary / Definition of Done

Use this format when closing a task. Always produce this report so the user can see what was done against the requirements.

---

## Task

- **Title:** [task title]
- **Task file:** `tasks/done/[task-name].md` (or `tasks/in-progress/` if still open)
- **Spec file:** `specs/[spec-name].md` (if applicable)

---

## Requirements vs Delivery

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| 1 | [requirement text] | done / blocked / missing | [file:line or test name] |
| 2 | [requirement text] | done / blocked / missing | [file:line or test name] |
| ... | | | |

- **done** = implemented and validated (code + test or manual check)
- **blocked** = cannot complete; state reason and what was attempted
- **missing** = not implemented; must be addressed or explicitly deferred

---

## Acceptance Criteria

| Criterion | Met? | How |
|-----------|------|-----|
| [criterion 1] | yes / no | [brief validation note] |
| [criterion 2] | yes / no | [brief validation note] |
| ... | | |

---

## Artifacts

- **Files created:** [list]
- **Files changed:** [list]
- **Tests run:** [command and result, e.g. `pnpm test` → 12 passed]

---

## Optional Items (Bonus)

| Item | Status |
|------|--------|
| [optional item] | completed / partial / not done |
| ... | |

---

## Tradeoffs, Blockers, Notes

- [Any design tradeoffs, technical debt, known limitations, or blocked items]
