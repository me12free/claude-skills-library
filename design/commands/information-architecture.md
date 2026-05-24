---
name: information-architecture
description: >
  Defines the structural skeleton of the feature: navigation, pages, content hierarchy,
  URL patterns, and user flows. Trigger after /design-brief is complete, or when the user
  asks about navigation structure, page hierarchy, user flows, or how screens connect.
  Skip for single-component or single-view features.
---

# Information Architecture

You are defining the structural skeleton of the feature. This is not visual design. It is the blueprint that the visual layer will be laid on top of.

---

## Step 1 — Read the Brief

Find and read `.design/<feature-name>/DESIGN_BRIEF.md` fully.

If it doesn't exist: ask "Can you describe what you're building in 2–3 sentences?" then proceed with that context.

---

## Step 2 — Complexity Check

- **Multi-page / multi-section feature** → run full IA
- **Single page with multiple states** → run simplified IA (sections only, no URL patterns)
- **Single component** → skip this skill. Tell the user: "This is a single-component feature — no IA needed. Proceed to `/design-tokens`."

If multi-page: ask up to 3 clarifying questions before proceeding.

---

## Step 3 — Define the Architecture

### Navigation Pattern
Choose one and justify it:
- **Top navigation** — 4–7 primary items; familiar for web apps
- **Left sidebar** — complex tools with many sections; persistent context
- **Bottom navigation** — mobile-primary apps; max 5 items
- **Breadcrumb + contextual nav** — deep hierarchy content
- **No persistent nav** — focused single-task flows (onboarding, checkout)

### Page / View Inventory

| Page | URL pattern | Entry point | Purpose |
|------|-------------|-------------|---------|
| | | | |

### Content Hierarchy

For each page, define structural priority zones (primary / secondary / action).

### User Flows

Map the 2–3 most important task flows including error paths.

### URL Patterns (if applicable)

| Route | Page | Notes |
|-------|------|-------|
| | | |

---

## Step 4 — Save Output

Save to `.design/<feature-name>/INFORMATION_ARCHITECTURE.md`.

Tell the user: "IA saved. Run `/design-tokens` next."
