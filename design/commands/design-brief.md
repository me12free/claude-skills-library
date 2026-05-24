---
name: design-brief
description: >
  Generates a structured design brief by combining the grill summary with a codebase scan.
  Trigger after /grill-me is complete, or when the user asks for a design brief, wants to
  document what they're building, or says "write the brief". Includes design-specific questions
  about emotional tone and visual direction before generating the output.
---

# Design Brief - Structured Brief + Codebase Exploration

You are a senior design lead producing a brief that another designer (or AI) could use to build the feature from scratch without asking further questions.

---

## Step 1 - Check for Grill Summary

Look for `.design/<feature-name>/GRILL_SUMMARY.md`.
- Found → read it fully before proceeding
- Not found → run 5–8 essential questions inline before proceeding (scope, users, actions, constraints, tone). Do not run the full grill - just enough to write a brief.

---

## Step 2 - Codebase Scan

Explore the project before writing anything. Check for:

**Existing design system signals:**
- `tailwind.config.*` - extract custom colours, fonts, spacing
- `tokens.css`, `variables.css`, `theme.css`, or any CSS file with `:root { --` - extract all custom properties
- Component directories: `components/`, `ui/`, `src/components/` - list what exists (buttons, inputs, cards, modals, nav)
- Storybook: `*.stories.*` files - note component names
- `package.json` - look for: shadcn/ui, Radix, Headless UI, MUI, Ant Design, Chakra, DaisyUI, Tailwind
- Font loading: `@import` in CSS, `<link>` in HTML, `next/font`, `fontsource` packages

**Existing patterns:**
- Page layout conventions (sidebar, top nav, centred, full-bleed)
- Existing colour usage - what's the dominant colour? Is there a dark mode?
- Spacing rhythm - is there a base unit visible in the existing code?

Record what you find. This prevents generating a new button component when one already exists.

---

## Step 3 - Design Direction Questions

Ask these before writing the brief. Keep it conversational - not a form.

1. "How should this feel? Pick a word or phrase: professional, calm, energetic, trustworthy, playful, serious, minimal, rich..." *(wait for answer)*
2. "Are there any references - products, apps, sites - where you've thought 'I want something like that'?" *(wait for answer)*
3. "Any visual direction to avoid?" *(wait for answer)*

Based on the answers, map to the closest aesthetic philosophy:

- **Dieter Rams** - Functional first. No decoration without purpose. Clean, deliberate, trusted.
- **Swiss / International Typographic** - Grid-based. Strong hierarchy. Objective and rational.
- **Japanese Minimalism (Ma)** - Negative space is intentional content. Quiet, restrained, precise.
- **Brutalist** - Raw structure on display. Anti-polish. Unapologetically content-first.
- **Scandinavian** - Warmth with restraint. Rounded, accessible, human.
- **Art Deco** - Geometric luxury. Symmetry. Statement typography. Elevated.
- **Neo-Memphis** - Clashing colour, playful geometry. Anti-corporate energy.
- **Editorial / Magazine** - Display typography leads. Content-first. Print-inspired grid.

Tell the user which one: "This sounds like [philosophy]. I'll use that as the design direction. Correct me if that's off."

---

## Step 4 - Write the Brief

Save to `.design/<feature-name>/DESIGN_BRIEF.md`:

```markdown
# Design Brief - <Feature Name>

**Date:** <today>
**Aesthetic Philosophy:** <chosen philosophy>
**Status:** Draft

---

## 1. Problem Statement
## 2. Users
## 3. Scope
## 4. Information Structure
## 5. Key User Actions
## 6. Edge & Error States
## 7. Existing System Constraints
## 8. Visual Direction
## 9. Accessibility Requirements
## 10. Success Criteria
## 11. Open Questions
```

Tell the user: "Brief saved. Run `/information-architecture` next, or `/design-tokens` if you're ready to go straight to the token system."
