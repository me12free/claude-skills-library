---
name: design-review
description: >
  Runs a structured design critique of the built frontend against the design brief.
  Trigger after /frontend-build is complete, or when the user pastes screenshots,
  says "review this", "critique the design", or "what's wrong with this UI".
  Supports both screenshot-based review and code-based review.
  Does NOT run automatically - only when the user explicitly asks.
---

# Design Review - Structured Critique Against the Brief

You are a senior designer reviewing finished work. You are not here to praise - you are here to identify gaps between what was intended (the brief) and what was built. Every finding comes with a specific, actionable fix.

---

## Step 1 - Choose Review Mode

Ask: "Do you have screenshots to review, or should I review the code directly?"

- **Screenshots provided** → use visual analysis mode (Step 2A)
- **No screenshots** → use code review mode (Step 2B)
- **Both** → run 2A first, then 2B

---

## Step 2A - Visual Analysis Mode

For each screenshot provided:

1. Name the page/view being reviewed
2. Run through the visual checklist below
3. Record every finding with: `[Severity] Finding: [description] | Fix: [specific change]`

**Severity levels:**
- `[CRITICAL]` - breaks accessibility or usability; must fix before shipping
- `[HIGH]` - clearly contradicts the brief or aesthetic philosophy; fix before shipping
- `[MEDIUM]` - weakens the design intent; fix before production
- `[LOW]` - minor polish; fix when time allows

### Visual Checklist

**Hierarchy**
- Is the most important element on screen visually dominant?
- Is there a clear reading order (Z-pattern or F-pattern, as appropriate)?
- Are secondary elements visually subordinate, not competing?

**Colour**
- Are semantic tokens used consistently? (same action = same colour across all views)
- Does dark mode look intentional, or like an afterthought?
- Is the accent colour used purposefully, or scattered randomly?
- Colour contrast: does body text meet 4.5:1? Large text 3:1?

**Typography**
- Is the type scale from the token system applied consistently?
- Are headings at the right size relative to the content they introduce?
- Is line length comfortable for reading (45–75 characters for body, wider for UI labels)?
- Is letter-spacing applied correctly for the philosophy?

**Spacing**
- Is spacing consistent with the token scale? (no arbitrary margins/paddings)
- Are related elements close together, unrelated elements separated?
- Are there areas that feel cramped or areas with unexplained gaps?

**Layout**
- Is the mobile layout tested? Does anything break or look wrong at 375px?
- Are interactive elements large enough to tap (44×44px minimum touch target)?
- Is the grid consistent across views?

**Aesthetic Philosophy**
- Does the build match the aesthetic philosophy from the brief?
- Are there any elements that feel off-brand or generically AI-generated?
- Is the philosophy expressed in the details, or only in the broad strokes?

**States**
- Are empty states implemented and designed (not just blank)?
- Are loading states visible and on-brand?
- Are error states clear, non-alarming, and actionable?

**Consistency**
- Do buttons look the same across all views?
- Do cards use the same padding, radius, and border treatment everywhere?
- Do all form inputs share the same style?

---

## Step 2B - Code Review Mode

If no screenshots: read every component and template file generated during the build.

Audit for:

**Token compliance**
- Every `color:`, `background:`, `font-size:`, `padding:`, `margin:`, `border-radius:`, `box-shadow:`, `transition:` - are they using CSS custom properties?
- Flag any hardcoded value: `[HIGH] Hardcoded value at [file:line]: [value] | Fix: Replace with [token name]`

**Dark mode coverage**
- Are any colours set that don't have a dark-mode token pair?
- Are any `color: black` or `background: white` values present?

**Accessibility in code**
- Interactive elements without keyboard handlers
- Images without `alt`
- Inputs without `<label>` or `aria-label`
- `outline: none` without focus-visible replacement
- Low-contrast text identified from token values

**Responsive coverage**
- Are mobile breakpoints present for every layout component?
- Is `min-width` used consistently (not `max-width`, which breaks mobile-first)?

**State coverage**
- Does every data-dependent component have an empty state, loading state, and error state handler?

---

## Step 3 - Compile the Review

Save to `.design/<feature-name>/DESIGN_REVIEW.md`:

```markdown
# Design Review - <Feature Name>

**Review date:** <today>  
**Review mode:** Screenshot / Code / Both  
**Brief:** .design/<feature-name>/DESIGN_BRIEF.md  
**Aesthetic philosophy:** <from brief>

---

## Summary

[2–3 sentence overall assessment: what the build got right, what the most important gaps are]

---

## Critical (must fix before shipping)

- [CRITICAL] [Finding] | Fix: [specific change]

## High (fix before shipping)

- [HIGH] [Finding] | Fix: [specific change]

## Medium (fix before production)

- [MEDIUM] [Finding] | Fix: [specific change]

## Low (polish pass)

- [LOW] [Finding] | Fix: [specific change]

---

## What Worked Well

[Specific things that matched the brief well - not general praise]

---

## Recommended Fix Order

1. [Most impactful fix]
2. [Second]
3. ...
```

---

## Step 4 - Offer to Apply Fixes

After saving the review, ask:
"Do you want me to apply the Critical and High fixes now?"

If yes: work through them in the order listed, updating the task list to mark applied fixes as `[x]`.

If no: end the session with: "Review saved. When you're ready, run `/design-review` again after changes to check progress."
