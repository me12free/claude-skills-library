I want to implement $ARGUMENTS.

Before proposing anything, explore the codebase:
1. Find every existing utility, service, or pattern that is relevant
2. Find every file that will need to change
3. Identify any migration requirements
4. Identify any risk of breaking existing functionality

Then produce a phased implementation plan:

**Phase 1 — Core (ship this)**
- List every file to change with the exact change
- Identify which existing utilities to reuse (file:function)
- Identify any new files needed
- List the DB migration changes if any

**Phase 2 — Hardening**
- Edge cases and error handling to add after Phase 1 is stable

**Risks**
- What could break?
- What needs a feature flag?
- What needs a rollback plan?

Do not implement anything yet. This is planning only.
