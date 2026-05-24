---
name: design-flow
description: >
  Orchestrates the full design process in sequence: grill-me → design-brief →
  information-architecture → design-tokens → brief-to-tasks → frontend-build → design-review.
  Trigger when the user says "design flow", "start the design process", "run the full flow",
  or wants to go from idea to working UI in a structured way.
---

# Design Flow - Full Orchestrator

You are running the complete AI design process. Do not skip phases. Do not ask if you should skip a phase - confirm between each step and let the user decide.

## Setup

1. Ask: "What are we designing? Give me one sentence."
2. Ask: "Do you want to run the full 7-step flow, or start from a specific phase?"
   - Full flow → proceed in order below
   - Specific phase → jump to that skill and run it

Determine the feature name from the one-sentence answer. All docs go to `.design/<feature-name>/`.

If `.design/<feature-name>/` already exists, detect which phases are complete and offer to resume from where it left off.

---

## Phase Sequence

Run each phase in order. After each phase completes, output:

```
✓ Phase [N] complete - [phase name]
  Output: .design/<feature-name>/[FILENAME].md
  
Ready for Phase [N+1]: [phase name]?
[Yes / Skip / Stop here]
```

Wait for confirmation before proceeding.

### Phase 1 - Grill Me
Run the `/grill-me` skill. Output: `GRILL_SUMMARY.md`

### Phase 2 - Design Brief
Run the `/design-brief` skill. Output: `DESIGN_BRIEF.md`

### Phase 3 - Information Architecture
Run the `/information-architecture` skill. Output: `INFORMATION_ARCHITECTURE.md`

### Phase 4 - Design Tokens
Check if a token file already exists in the codebase (`tokens.css`, `variables.css`, `theme.css`, Tailwind config, CSS custom properties in a global stylesheet). If yes: note it in the brief as "existing token system detected" and skip this phase. If no: run `/design-tokens`. Output: `tokens.css`

### Phase 5 - Brief to Tasks
Run the `/brief-to-tasks` skill. Output: `TASKS.md`

### Phase 6 - Frontend Build
Run the `/frontend-build` skill. Uses: `DESIGN_BRIEF.md`, `INFORMATION_ARCHITECTURE.md`, `tokens.css`, `TASKS.md`.

### Phase 7 - Design Review
Run the `/design-review` skill. Ask: "Do you have screenshots to paste, or should I review the code directly?"
- Screenshots pasted → analyse each one against the brief
- No screenshots → review the generated code for design consistency
Output: `DESIGN_REVIEW.md`

---

## Rules

- Never start building (Phase 6) without a completed brief (Phase 2)
- Never skip grilling if the feature is new and undocumented
- If the user skips Phase 3 (IA), note it in the brief and proceed - single-page features may not need it
- If the user skips Phase 4 (tokens), ensure Phase 6 uses CSS custom properties anyway - never hardcode values
- After Phase 7, offer: "Apply the review fixes now?" If yes, apply them inline before ending the session
