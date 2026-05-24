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

## Step 1 - Read the Brief

Find and read `.design/<feature-name>/DESIGN_BRIEF.md` fully.

If it doesn't exist: ask "Can you describe what you're building in 2–3 sentences?" then proceed with that context.

---

## Step 2 - Complexity Check

Assess whether this feature needs a full IA or a simplified one.

- **Multi-page / multi-section feature** → run full IA
- **Single page with multiple states** → run simplified IA (sections only, no URL patterns)
- **Single component** → skip this skill. Tell the user: "This is a single-component feature - no IA needed. Proceed to `/design-tokens`."

If multi-page: ask up to 3 clarifying questions before proceeding. Examples:
- "How do users enter this feature? From a nav item, a dashboard card, a button?"
- "Is there a detail view, or is everything on one page?"
- "Are there any admin vs. regular user differences in what's visible?"

---

## Step 3 - Define the Architecture

Structure the IA around these dimensions:

### Navigation Pattern
Choose one and justify it:
- **Top navigation** - works for 4–7 primary items; familiar for web apps
- **Left sidebar** - works for complex tools with many sections; persistent context
- **Bottom navigation** - works for mobile-primary apps; max 5 items
- **Breadcrumb + contextual nav** - works for deep hierarchy content
- **No persistent nav** - works for focused single-task flows (onboarding, checkout)

### Page / View Inventory
List every page or view:

| Page | URL pattern | Entry point | Purpose |
|------|-------------|-------------|---------|
| | | | |

### Content Hierarchy
For each page, define the hierarchy of content zones (not visual design - structural priority):

```
Page: [Name]
├── Primary zone (what the user needs first)
│   ├── [Content element]
│   └── [Content element]
├── Secondary zone (supporting context)
│   └── [Content element]
└── Action zone (what the user does here)
    └── [Content element]
```

### User Flows
Map the 2–3 most important task flows:

```
Flow: [Task name]
1. User enters from [entry point]
2. Sees [primary content]
3. Takes action: [action]
4. System responds: [response]
5. User lands on / sees [next state]

Error path:
- If [condition]: user sees [error state] with option to [recovery action]
```

### URL Patterns (if applicable)
| Route | Page | Notes |
|-------|------|-------|
| `/` | | |
| `/<section>` | | |
| `/<section>/<id>` | | |

---

## Step 4 - Save Output

Save to `.design/<feature-name>/INFORMATION_ARCHITECTURE.md`:

```markdown
# Information Architecture - <Feature Name>

## Navigation Pattern
**Pattern:** [chosen pattern]  
**Rationale:** [one sentence]

## Page Inventory
| Page | URL | Entry point | Purpose |
|------|-----|-------------|---------|
| | | | |

## Content Hierarchy
[Per-page hierarchy as defined above]

## User Flows
[2–3 flows as defined above]

## URL Patterns
[Table if applicable]

## IA Decisions
[Any explicit decisions made: e.g. "Detail view is a modal, not a page, because the user should keep context of the list."]
```

Tell the user: "IA saved. Run `/design-tokens` next."
