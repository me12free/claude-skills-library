---
name: frontend-build
description: >
  Builds the frontend using all prior design documents: brief, IA, tokens, and task list.
  Trigger after /brief-to-tasks is complete, or when the user says "build it", "start building",
  or wants to generate the actual UI. Never runs without a brief. Produces intentional,
  production-grade code — not generic AI output.
---

# Frontend Build — Intentional UI from Design Docs

You are building a UI that already has its design decisions made. You are executing, not deciding. Every visual choice must reference the design brief and tokens. If something is not specified, choose the option most consistent with the aesthetic philosophy — and note the decision.

---

## Step 1 — Load All Context

Read in this order:
1. `.design/<feature-name>/DESIGN_BRIEF.md`
2. `.design/<feature-name>/INFORMATION_ARCHITECTURE.md`
3. `tokens.css` (or existing token system)
4. `.design/<feature-name>/TASKS.md`

If any are missing: stop and tell the user which document is missing and how to generate it.

---

## Step 2 — Codebase Compatibility Check

Before writing any code confirm: framework, CSS approach, routing, existing component library.
Build using patterns already in the codebase — do not introduce new patterns unless required.

---

## Step 3 — Non-Negotiable Build Constraints

**Tokens:** Never hardcode a colour, font size, spacing value, shadow, or duration. Every value from CSS custom properties in `tokens.css`.

**Mobile-First:** Build every layout at 375px first. Scale up with `min-width` queries only. Touch targets minimum 44×44px.

**Dark Mode:** Every component works in both modes. Use semantic colour tokens only — never primitives, never `color: black` or `background: white`.

**Accessibility:** Every interactive element keyboard-reachable. Every image has `alt`. Every input has a visible label. Focus rings always visible — never `outline: none` without replacement. Contrast: 4.5:1 body, 3:1 large text.

**No Generic Output:** No default browser button styles unmodified. No lorem ipsum. Let the aesthetic philosophy drive composition.

---

## Step 4 — Aesthetic Philosophy Application

Apply the philosophy from the brief consistently. Key rules per philosophy:

- **Dieter Rams:** Remove decorative elements without function. Weight/size for hierarchy, not colour.
- **Swiss:** Hard grid. Dramatic heading/body size contrast. No rounded corners on structural elements.
- **Japanese (Ma):** Padding is content. Animate only on user-initiated action. Space separates, not lines.
- **Brutalist:** Show the structure. Borders visible. Interaction feedback immediate.
- **Scandinavian:** Warmth through rounded corners and warm neutrals. Let elements breathe.
- **Art Deco:** Symmetry wherever possible. Serif display at large scale. Borders as decorative frames.
- **Neo-Memphis:** Colour used aggressively. Elements can overlap. Hover states exaggerated.
- **Editorial:** Typography is the layout. Minimal chrome. Content speaks.

---

## Step 5 — Build Sequence

Work through `TASKS.md` layer by layer. After each task: mark `[x]`, note design decisions inline as `// Design decision: [what] because [why based on brief]`.

---

## Step 6 — Quality Check Before Done

- [ ] All CSS values token-referenced — no hardcoded colours, sizes, or durations
- [ ] Mobile layout works at 375px
- [ ] Dark mode works without white/black hardcoding
- [ ] Keyboard navigation works through all interactive elements
- [ ] Empty, loading, and error states implemented for every data area
- [ ] No placeholder text in final output
- [ ] Aesthetic philosophy consistently expressed across all components

---

## After Build

Report: what was built, any design decisions made during build not in the brief.
Tell the user: "Run `/design-review` to critique the output against the brief."
