---
name: design-tokens
description: >
  Generates a complete design token system as CSS custom properties covering colour,
  typography, spacing, elevation, motion, and breakpoints - with full light and dark mode.
  Trigger after /design-brief is complete. Skip if the project already has a token/variable
  system detected during the brief. The brief's aesthetic philosophy determines the token values.
---

# Design Tokens - Complete Token System

You are generating a design token system. Every value in the resulting `tokens.css` must be intentional - derived from the aesthetic philosophy in the brief, not randomly chosen.

---

## Step 1 - Check for Existing Token System

Look for:
- `tokens.css`, `variables.css`, `theme.css`
- Any CSS file with `:root { --` blocks
- Tailwind config with custom theme values
- `tailwind.config.js/ts` with `theme.extend`

**If found:** Read the existing system. Do not replace it. Note what exists and what is missing. Output a patch file that only adds missing categories. Tell the user: "Existing token system detected. I've added the missing categories to extend it rather than replace it."

**If not found:** Proceed to generate the full system.

---

## Step 2 - Read the Brief

Read `.design/<feature-name>/DESIGN_BRIEF.md`. Extract:
- Aesthetic philosophy (determines tone of all values)
- Emotional tone (informs colour temperature and spacing density)
- Framework (informs output format: CSS custom properties vs Tailwind vs both)

---

## Step 3 - Determine Token Values by Philosophy

Use these parameters as your starting point. Adjust based on the brief's emotional tone.

### Dieter Rams
- **Colours:** Near-neutral palette. Off-white background, near-black text. Single utility accent (blue or orange). Maximum 3 semantic colours.
- **Type:** Geometric sans (Futura, DIN, or similar). No display font. Size scale: tight (13–20px range). Line height: 1.4.
- **Spacing:** 8px base unit. Tight density. No generous padding.
- **Motion:** None or near-none. 150ms max. Ease-out only.
- **Shadows:** None or 1px border-based. No elevation.

### Swiss / International Typographic
- **Colours:** Black, white, and one primary (red or blue). High contrast. No gradients.
- **Type:** Helvetica Neue, Neue Haas Grotesk, or Aktiv Grotesk. Strong size contrast (12px body, 48px+ display). Very tight letter-spacing on headings.
- **Spacing:** 12px base unit. Grid-conscious. Consistent column gutters.
- **Motion:** Sharp and linear. 200ms. No bounce.
- **Shadows:** None.

### Japanese Minimalism (Ma)
- **Colours:** Warm whites, warm greys, ink black, soft stone accents. No saturated colour.
- **Type:** Optima or similar humanist. Or a Japanese-influenced geometric. Small body size (14px). Large leading (1.7+).
- **Spacing:** 16px base unit. Very generous. Negative space is the design.
- **Motion:** Slow, deliberate. 400ms+. Ease-in-out. Only essential elements animate.
- **Shadows:** Subtle. Warm-toned. No hard shadows.

### Brutalist
- **Colours:** System colours. Pure black #000, pure white #FFF. One jarring accent.
- **Type:** System monospace or a grotesque. No refinement. No letter-spacing.
- **Spacing:** Irregular. Functional but not decorative. Elements crowd each other.
- **Motion:** None, or abrupt. No easing.
- **Shadows:** None, or extreme (8px offset, no blur).

### Scandinavian
- **Colours:** Warm white, warm grey, muted sage or clay accent. Never pure black - use very dark navy or charcoal.
- **Type:** Rounded sans (Nunito, Figtree, or Plus Jakarta Sans). Slightly loose tracking.
- **Spacing:** 8px base unit. Comfortable density - not tight, not airy.
- **Motion:** 250–350ms. Gentle ease. Spring animations allowed.
- **Shadows:** Warm, layered. Low-contrast.

### Art Deco
- **Colours:** Deep navy, gold, ivory, or deep green with gold. High contrast jewel tones.
- **Type:** Geometric serif for display (Cormorant, Playfair). Condensed sans for UI. Strong contrast in scale.
- **Spacing:** 16px base unit. Generous for display areas. Tighter for data.
- **Motion:** Measured and deliberate. 300ms. Linear or slight ease-out.
- **Shadows:** Dramatic and directional. Gold-tinted.

### Neo-Memphis
- **Colours:** Saturated, clashing primaries. Pink, yellow, cyan, purple. Black outlines.
- **Type:** A geometric with personality (Space Grotesk is too safe - try Syne, Unbounded, or Chivo). Heavy weights.
- **Spacing:** Unpredictable. Dense in some areas, loose in others.
- **Motion:** Bouncy spring. 250ms. Overshoot.
- **Shadows:** Offset solid shadows (no blur). 4–6px.

### Editorial / Magazine
- **Colours:** Warm white or cream background. Near-black text. One editorial accent (burgundy, forest, deep teal).
- **Type:** Display serif for headings (Playfair, Freight, or similar). Body in a refined sans or humanist serif.
- **Spacing:** 16–20px base unit. Generous vertical rhythm.
- **Motion:** Subtle fade and translate. 300ms.
- **Shadows:** Minimal. Content speaks.

---

## Step 4 - Generate tokens.css

```css
/* ============================================
   DESIGN TOKENS - <Feature Name>
   Philosophy: <Aesthetic Philosophy>
   Generated: <date>
   ============================================ */

/* -------- COLOUR: PRIMITIVES -------- */
/* Raw values - not used directly in components */
:root {
  --colour-neutral-0: #ffffff;
  --colour-neutral-50: #f9f9f7;
  --colour-neutral-100: #f0efe9;
  --colour-neutral-200: #e0dfd7;
  --colour-neutral-300: #c8c7bc;
  --colour-neutral-400: #9e9d92;
  --colour-neutral-500: #6e6d62;
  --colour-neutral-600: #4d4c43;
  --colour-neutral-700: #33322c;
  --colour-neutral-800: #1f1e1a;
  --colour-neutral-900: #0d0d0b;

  /* Accent - derived from philosophy */
  --colour-accent-300: ; /* light variant */
  --colour-accent-500: ; /* base accent */
  --colour-accent-700: ; /* dark variant */

  /* Semantic - used in UI */
  --colour-success: #2d7d46;
  --colour-warning: #a66000;
  --colour-error:   #c0392b;
  --colour-info:    #1a5276;
}

/* -------- COLOUR: SEMANTIC (LIGHT MODE) -------- */
:root,
[data-theme="light"] {
  --colour-bg-base:        var(--colour-neutral-0);
  --colour-bg-subtle:      var(--colour-neutral-50);
  --colour-bg-muted:       var(--colour-neutral-100);
  --colour-bg-emphasis:    var(--colour-neutral-200);

  --colour-text-primary:   var(--colour-neutral-900);
  --colour-text-secondary: var(--colour-neutral-600);
  --colour-text-muted:     var(--colour-neutral-400);
  --colour-text-on-accent: var(--colour-neutral-0);

  --colour-border:         var(--colour-neutral-200);
  --colour-border-focus:   var(--colour-accent-500);

  --colour-interactive:    var(--colour-accent-500);
  --colour-interactive-hover: var(--colour-accent-700);
}

/* -------- COLOUR: SEMANTIC (DARK MODE) -------- */
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) {
    --colour-bg-base:        var(--colour-neutral-900);
    --colour-bg-subtle:      var(--colour-neutral-800);
    --colour-bg-muted:       var(--colour-neutral-700);
    --colour-bg-emphasis:    var(--colour-neutral-600);

    --colour-text-primary:   var(--colour-neutral-0);
    --colour-text-secondary: var(--colour-neutral-300);
    --colour-text-muted:     var(--colour-neutral-500);
    --colour-text-on-accent: var(--colour-neutral-0);

    --colour-border:         var(--colour-neutral-700);
    --colour-border-focus:   var(--colour-accent-300);

    --colour-interactive:    var(--colour-accent-300);
    --colour-interactive-hover: var(--colour-accent-500);
  }
}

[data-theme="dark"] {
  /* Same overrides as above - allows manual toggle */
}

/* -------- TYPOGRAPHY -------- */
:root {
  /* Font families */
  --font-display:  ; /* from philosophy */
  --font-body:     ; /* from philosophy */
  --font-mono:     'JetBrains Mono', 'Fira Code', monospace;

  /* Size scale (modular) */
  --text-xs:   0.75rem;   /* 12px */
  --text-sm:   0.875rem;  /* 14px */
  --text-base: 1rem;      /* 16px */
  --text-lg:   1.125rem;  /* 18px */
  --text-xl:   1.25rem;   /* 20px */
  --text-2xl:  1.5rem;    /* 24px */
  --text-3xl:  1.875rem;  /* 30px */
  --text-4xl:  2.25rem;   /* 36px */
  --text-5xl:  3rem;      /* 48px */
  --text-6xl:  3.75rem;   /* 60px */

  /* Line heights */
  --leading-tight:  1.25;
  --leading-snug:   1.375;
  --leading-normal: 1.5;
  --leading-relaxed: 1.625;
  --leading-loose:  2;

  /* Letter spacing */
  --tracking-tight:  -0.02em;
  --tracking-normal:  0em;
  --tracking-wide:    0.05em;
  --tracking-wider:   0.1em;
  --tracking-widest:  0.2em;

  /* Font weights */
  --weight-light:    300;
  --weight-regular:  400;
  --weight-medium:   500;
  --weight-semibold: 600;
  --weight-bold:     700;
  --weight-black:    900;
}

/* -------- SPACING -------- */
:root {
  /* Base unit - set from philosophy */
  --space-unit: 8px;

  --space-0:  0;
  --space-1:  calc(var(--space-unit) * 0.5);   /* 4px */
  --space-2:  var(--space-unit);               /* 8px */
  --space-3:  calc(var(--space-unit) * 1.5);   /* 12px */
  --space-4:  calc(var(--space-unit) * 2);     /* 16px */
  --space-5:  calc(var(--space-unit) * 2.5);   /* 20px */
  --space-6:  calc(var(--space-unit) * 3);     /* 24px */
  --space-8:  calc(var(--space-unit) * 4);     /* 32px */
  --space-10: calc(var(--space-unit) * 5);     /* 40px */
  --space-12: calc(var(--space-unit) * 6);     /* 48px */
  --space-16: calc(var(--space-unit) * 8);     /* 64px */
  --space-20: calc(var(--space-unit) * 10);    /* 80px */
  --space-24: calc(var(--space-unit) * 12);    /* 96px */
}

/* -------- BORDER RADIUS -------- */
:root {
  --radius-none:   0;
  --radius-sm:     2px;
  --radius-md:     4px;
  --radius-lg:     8px;
  --radius-xl:     12px;
  --radius-2xl:    16px;
  --radius-full:   9999px;
}

/* -------- ELEVATION / SHADOWS -------- */
:root {
  --shadow-sm:  0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md:  0 4px 6px -1px rgb(0 0 0 / 0.10), 0 2px 4px -1px rgb(0 0 0 / 0.06);
  --shadow-lg:  0 10px 15px -3px rgb(0 0 0 / 0.10), 0 4px 6px -2px rgb(0 0 0 / 0.05);
  --shadow-xl:  0 20px 25px -5px rgb(0 0 0 / 0.10), 0 10px 10px -5px rgb(0 0 0 / 0.04);
  --shadow-none: none;
}

/* -------- MOTION -------- */
:root {
  /* Durations */
  --duration-instant:  0ms;
  --duration-fast:     150ms;
  --duration-normal:   250ms;
  --duration-slow:     400ms;
  --duration-slower:   600ms;

  /* Easings */
  --ease-linear:   linear;
  --ease-in:       cubic-bezier(0.4, 0, 1, 1);
  --ease-out:      cubic-bezier(0, 0, 0.2, 1);
  --ease-in-out:   cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring:   cubic-bezier(0.175, 0.885, 0.32, 1.275);

  /* Reduced motion override */
  @media (prefers-reduced-motion: reduce) {
    --duration-fast:   0ms;
    --duration-normal: 0ms;
    --duration-slow:   0ms;
    --duration-slower: 0ms;
  }
}

/* -------- BREAKPOINTS -------- */
/* Used as min-width values in media queries - mobile first */
/*
  --bp-sm:  640px
  --bp-md:  768px
  --bp-lg:  1024px
  --bp-xl:  1280px
  --bp-2xl: 1536px
*/

/* -------- Z-INDEX SCALE -------- */
:root {
  --z-below:    -1;
  --z-base:      0;
  --z-raised:   10;
  --z-dropdown: 100;
  --z-sticky:   200;
  --z-overlay:  300;
  --z-modal:    400;
  --z-toast:    500;
  --z-tooltip:  600;
}
```

**Fill in all blank values** based on the philosophy parameters in Step 3. Do not leave any value empty in the final output.

---

## Step 5 - Save and Report

Save the completed file as `tokens.css` in the project root (or `src/styles/tokens.css` if the project uses a `src/styles/` convention).

Tell the user:
- Which philosophy parameters drove the colour, type, and spacing decisions
- Any deviations from the philosophy and why
- "Run `/brief-to-tasks` next to break the brief into buildable slices."
