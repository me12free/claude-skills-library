---
name: frontend-build
description: >
  Builds the frontend using all prior design documents: brief, IA, tokens, and task list.
  Trigger after /brief-to-tasks is complete, or when the user says "build it", "start building",
  or wants to generate the actual UI. Never runs without a brief. Produces intentional,
  production-grade code - not generic AI output.
---

# Frontend Build - Intentional UI from Design Docs

You are building a UI that already has its design decisions made. You are executing, not deciding. Every visual choice must reference the design brief and tokens. If something is not specified, choose the option most consistent with the aesthetic philosophy - and note the decision.

---

## Step 1 - Load All Context

Read in this order:
1. `.design/<feature-name>/DESIGN_BRIEF.md` - brief, philosophy, tone, constraints
2. `.design/<feature-name>/INFORMATION_ARCHITECTURE.md` - pages, nav, flows
3. `tokens.css` (or existing token system) - all values you must use
4. `.design/<feature-name>/TASKS.md` - what to build, in what order

If any of these are missing: stop and tell the user which document is missing and how to generate it.

---

## Step 2 - Codebase Compatibility Check

Before writing any code:
- Confirm the framework (React, Next, Vue, plain HTML)
- Confirm the CSS approach (CSS modules, Tailwind, global CSS, styled-components)
- Confirm routing (React Router, Next App Router, none)
- Confirm any existing component library (shadcn, Radix, Headless UI, etc.)

Build using the patterns already in the codebase. Do not introduce new patterns unless the brief requires something the existing stack cannot support.

---

## Step 3 - Build Constraints (Non-Negotiable)

These apply to every component and every file:

### Tokens
- **Never hardcode** a colour, font size, spacing value, shadow, or duration
- Every value comes from CSS custom properties defined in `tokens.css`
- Exception only if the framework has no CSS custom property support (extremely rare)

### Mobile-First
- Build every layout starting at **375px**
- Scale up with `min-width` media queries only
- Touch targets minimum **44×44px**
- Test the layout mentally at 375px, 768px, and 1280px before finishing

### Dark Mode
- Every component works in both light and dark mode
- Use semantic colour tokens (`--colour-bg-base`, `--colour-text-primary`) - never primitives
- Never use `color: black` or `background: white` directly

### Accessibility
- Every interactive element reachable by keyboard (`Tab`, `Enter`, `Space`, arrow keys for groups)
- Every image has `alt` text
- Every form input has a visible label (not just placeholder)
- Focus rings visible and styled - never `outline: none` without a replacement
- Colour contrast minimum 4.5:1 for body text, 3:1 for large text

### No Generic Output
- Do not use default browser button styles without customisation
- Do not use placeholder lorem ipsum text in shipped UI (use realistic placeholder content)
- Do not produce cookie-cutter layouts - let the aesthetic philosophy drive composition

---

## Step 4 - Aesthetic Philosophy Implementation

Apply the philosophy from the brief consistently across every component:

### Dieter Rams
- Remove anything decorative that doesn't serve a function
- Align everything to the grid - no arbitrary positioning
- Use weight and size for hierarchy - not colour
- Micro-interactions only where they communicate state change

### Swiss / International Typographic
- Hard grid. Headings set at a dramatically larger size than body
- Black and one colour maximum
- Tight leading on headings. Generous leading on body.
- No rounded corners on structural elements

### Japanese Minimalism (Ma)
- Leave space deliberately - padding is content, not waste
- Animate only when the user initiates action
- No decorative borders - use space to separate, not lines
- Typographic scale is small and refined, not dramatic

### Brutalist
- Show the structure - don't hide the grid
- Monospaced or rough type is acceptable
- Borders visible. Shadows aggressive or absent.
- Interaction feedback immediate and visible

### Scandinavian
- Warmth through rounded corners and warm-neutral backgrounds
- Generous padding - let elements breathe
- Subtle hover states. No abrupt transitions.
- Illustrative icons if the brief allows (not just system icons)

### Art Deco
- Symmetry in layout wherever possible
- Gold or jewel-tone accent used sparingly - make it mean something
- Serif display type at large scale. Sans for data and UI.
- Borders used as decorative frames around key elements

### Neo-Memphis
- Colour is used aggressively - not timidly
- Elements can overlap. Borders visible. Offset shadows.
- Hierarchy through weight and scale, not through restraint
- Hover states exaggerated - motion is part of the personality

### Editorial / Magazine
- Typography is the layout - let headlines dominate
- Long lines of content tolerated (60–80 character line length)
- White space used to pace content, not fill it
- Minimal chrome - let content speak

---

## Step 5 - Build Sequence

Work through `TASKS.md` in layer order. After each task:
- Mark it `[x]` in the task file
- Note any design decision made during build with: `// Design decision: [what] because [why based on brief]`
- If you encounter a decision that contradicts the brief: stop and ask before proceeding

---

## Step 6 - Quality Check (Before Calling Done)

Before marking the build complete, verify:

- [ ] All CSS values are token-referenced - no hardcoded colours, sizes, or durations
- [ ] Mobile layout works at 375px
- [ ] Dark mode works without any white or black hardcoding
- [ ] Keyboard navigation works through all interactive elements
- [ ] Empty, loading, and error states are implemented for every data area
- [ ] No placeholder text in the final output
- [ ] The aesthetic philosophy is consistently expressed - not just in one component but across all

---

## After Build

Tell the user:
- What was built (list of pages/components)
- Any design decisions made during build that weren't specified in the brief
- "Run `/design-review` to critique the output against the brief."
