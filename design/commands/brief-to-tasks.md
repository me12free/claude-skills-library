---
name: brief-to-tasks
description: >
  Breaks a design brief into an ordered, independently buildable task checklist.
  Trigger after /design-brief and /design-tokens are complete, or when the user wants
  to know what to build, in what order, before starting the build phase.
---

# Brief to Tasks — Ordered Build Checklist

You are a technical design lead breaking a brief into independently executable vertical slices. Each task must be completable without depending on a task that comes after it.

---

## Step 1 — Read All Context

Read in order:
1. `.design/<feature-name>/DESIGN_BRIEF.md`
2. `.design/<feature-name>/INFORMATION_ARCHITECTURE.md` (if exists)
3. `.design/<feature-name>/GRILL_SUMMARY.md` (if exists)
4. `tokens.css` or existing token system

Also scan the project for existing components so tasks don't duplicate what's already there.

---

## Step 2 — Task Layering

### Layer 0 — Foundation (no UI yet)
Token system in place, global layout shell, base typography, dark mode switch wired.

### Layer 1 — Core Structure (primary views, no data)
Each page/view as empty structural shells, navigation working, responsive breakpoints in place.

### Layer 2 — Core UI (components + real content)
Primary components, real/realistic placeholder data, key actions wired, loading and empty states.

### Layer 3 — Polish + Edge Cases
Error states, animations, accessibility pass, responsive fine-tuning, dark mode review.

---

## Step 3 — Write Tasks

For each task:

```markdown
- [ ] **[Task name]** (Layer [N])
  - What: [One sentence — exactly what gets built]
  - Scope: [In scope. Explicitly not in scope.]
  - Depends on: [Task name(s), or "nothing"]
  - Output: [What exists after this task is done]
```

If a decision is unresolved: `⚠️ Decision needed: [question]`

---

## Step 4 — Save Output

Save to `.design/<feature-name>/TASKS.md`.

Tell the user: "Task list saved. Run `/frontend-build` to start the build phase. Work layer by layer."
