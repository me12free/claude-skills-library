---
name: design-tokens
description: >
  Generates a complete design token system as CSS custom properties covering colour,
  typography, spacing, elevation, motion, and breakpoints — with full light and dark mode.
  Trigger after /design-brief is complete. Skip if the project already has a token/variable
  system detected during the brief. The brief's aesthetic philosophy determines the token values.
---

# Design Tokens — Complete Token System

You are generating a design token system. Every value in the resulting `tokens.css` must be intentional — derived from the aesthetic philosophy in the brief, not randomly chosen.

---

## Step 1 — Check for Existing Token System

Look for: `tokens.css`, `variables.css`, `theme.css`, any CSS file with `:root { --` blocks, or `tailwind.config.js/ts` with `theme.extend`.

**If found:** Read and extend — do not replace. Output a patch file for missing categories only.
**If not found:** Generate the full system.

---

## Step 2 — Read the Brief

Read `.design/<feature-name>/DESIGN_BRIEF.md`. Extract: aesthetic philosophy, emotional tone, framework.

---

## Step 3 — Philosophy Token Parameters

Apply these as your starting point per philosophy:

| Philosophy | Colours | Type | Spacing | Motion | Shadows |
|---|---|---|---|---|---|
| **Dieter Rams** | Near-neutral, 1 accent | Geometric sans, tight scale | 8px base, tight | 150ms max, ease-out | None or 1px border |
| **Swiss** | Black/white + 1 primary | Helvetica Neue, dramatic scale | 12px base, grid | Sharp linear 200ms | None |
| **Japanese (Ma)** | Warm whites, ink black | Humanist, small body, 1.7 leading | 16px base, very generous | Slow 400ms+ ease-in-out | Subtle, warm-toned |
| **Brutalist** | Pure #000/#FFF + jarring accent | System mono/grotesque | Irregular functional | None or abrupt | None or 8px offset hard |
| **Scandinavian** | Warm white/grey, muted accent, no pure black | Rounded sans, loose tracking | 8px base, comfortable | 250–350ms gentle spring | Warm layered low-contrast |
| **Art Deco** | Deep navy/gold/ivory, jewel tones | Geometric serif display, condensed sans UI | 16px base, generous display | 300ms linear | Dramatic directional, gold-tinted |
| **Neo-Memphis** | Saturated clashing primaries, black outlines | Geometric with personality, heavy | Unpredictable | Bouncy spring 250ms overshoot | Offset solid 4–6px |
| **Editorial** | Warm white/cream, near-black, 1 editorial accent | Display serif heads, refined sans body | 16–20px base, generous vertical | Subtle fade+translate 300ms | Minimal |

---

## Step 4 — Generate tokens.css

Generate a complete `tokens.css` covering:
- Colour primitives + semantic tokens (light mode + dark mode via `prefers-color-scheme` and `[data-theme]`)
- Typography (families, full size scale, line heights, letter-spacing, weights)
- Spacing (base unit scale, 8px or 16px depending on philosophy)
- Border radius
- Elevation / shadows
- Motion (durations + easings + `prefers-reduced-motion` override)
- Z-index scale
- Breakpoints (commented, for reference in media queries)

**Fill in every value from the philosophy. No blank values in the final output.**

---

## Step 5 — Save and Report

Save as `tokens.css` in project root (or `src/styles/tokens.css` if that convention exists).

Report: which philosophy parameters drove colour, type, and spacing decisions. Note any deviations and why.

Tell the user: "Run `/brief-to-tasks` next."
