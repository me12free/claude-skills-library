---
name: brief-to-tasks
description: >
  Breaks a design brief into an ordered, independently buildable task checklist.
  Trigger after /design-brief and /design-tokens are complete, or when the user wants
  to know what to build, in what order, before starting the build phase.
---

# Brief to Tasks - Ordered Build Checklist

You are a technical design lead breaking a brief into independently executable vertical slices. Each task must be completable without depending on a task that comes after it.

---

## Step 1 - Read All Context

Read in order:
1. `.design/<feature-name>/DESIGN_BRIEF.md`
2. `.design/<feature-name>/INFORMATION_ARCHITECTURE.md` (if exists)
3. `.design/<feature-name>/GRILL_SUMMARY.md` (if exists)
4. `tokens.css` or existing token system (to know what foundation exists)

Also scan the project for existing components so tasks don't duplicate what's already there.

---

## Step 2 - Task Layering

Organise tasks into four layers. Every task in a layer must be complete before the next layer begins.

### Layer 0 - Foundation (do first, no UI yet)
- Token system in place (if not already)
- Global layout shell (app wrapper, nav shell, routing setup)
- Base typography applied globally
- Dark mode switch wired (if required by brief)

### Layer 1 - Core Structure (primary views, no data yet)
- Each page/view from the IA, built as empty structural shells
- Navigation between pages working
- Responsive breakpoints in place for each view

### Layer 2 - Core UI (components + real content)
- Primary components per page (tables, cards, forms, lists)
- Real or realistic placeholder data in place
- Key actions wired (clicks, form submissions, dialogs)
- Loading and empty states for every data-dependent element

### Layer 3 - Polish + Edge Cases
- Error states
- Animations and transitions
- Accessibility pass (keyboard nav, ARIA, colour contrast check)
- Responsive fine-tuning
- Dark mode review pass

---

## Step 3 - Write Tasks

For each task:

```markdown
- [ ] **[Task name]** (Layer [N])
  - What: [One sentence describing exactly what gets built]
  - Scope: [What is in scope. What is explicitly not.]
  - Depends on: [Task name(s), or "nothing"]
  - Output: [What exists after this task is done]
```

Tasks must be specific enough that the build agent does not need to make design decisions. If a decision is unresolved, flag it: `⚠️ Decision needed: [question]`

---

## Step 4 - Save Output

Save to `.design/<feature-name>/TASKS.md`:

```markdown
# Build Tasks - <Feature Name>

**Brief:** .design/<feature-name>/DESIGN_BRIEF.md  
**Total tasks:** [N]  
**Status:** [ ] Not started / [x] Complete / [~] In progress

---

## Layer 0 - Foundation

- [ ] **Token system** (Layer 0)
  - What: Import tokens.css globally
  - Scope: No visual UI changes - foundation only
  - Depends on: nothing
  - Output: All CSS custom properties available throughout the app

[continue...]

---

## Layer 1 - Core Structure

[tasks...]

---

## Layer 2 - Core UI

[tasks...]

---

## Layer 3 - Polish

[tasks...]

---

## Decisions Needed Before Build

⚠️ [List any unresolved decisions from the brief that the build agent cannot make alone]
```

Tell the user: "Task list saved. Run `/frontend-build` to start the build phase. Work layer by layer - complete all Layer 0 tasks before moving to Layer 1."
