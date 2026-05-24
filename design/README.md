# Design Skills

A 7-phase AI design process that takes a raw idea to a production-quality, accessible, dark-mode-ready frontend — with every decision documented.

---

## The Flow

```
/design-flow          ← Start here. Guides you through all 7 phases in sequence.
     │
     ▼
/grill-me             ← Stress-test the idea. Every unresolved decision surfaced before code is written.
     │
     ▼
/design-brief         ← Turn the grilling into a structured brief + codebase scan + aesthetic direction.
     │
     ▼
/information-architecture  ← Pages, nav, hierarchy, URL patterns, user flows.
     │
     ▼
/design-tokens        ← CSS custom properties: colour, type, spacing, motion, dark mode.
     │
     ▼
/brief-to-tasks       ← Break the brief into ordered, independently buildable slices.
     │
     ▼
/frontend-build       ← Build the frontend using every document generated above.
     │
     ▼
/design-review        ← Structured critique: screenshots or code, findings with fixes.
```

---

## Aesthetic Philosophies

Eight named design philosophies with full implementation parameters:

| Philosophy | Character |
|---|---|
| **Dieter Rams** | Less but better. Functional. Zero decoration without purpose. |
| **Swiss / International** | Grid-locked. Strong type hierarchy. Objective. |
| **Japanese Minimalism (Ma)** | Negative space as content. Quiet. Restrained. |
| **Brutalist** | Raw structure visible. Anti-polish. Content-first. |
| **Scandinavian** | Warmth plus restraint. Rounded. Accessible by default. |
| **Art Deco** | Geometric luxury. Bold symmetry. Statement typography. |
| **Neo-Memphis** | Playful chaos. Clashing colour. Anti-corporate. |
| **Editorial / Magazine** | Content-led. Display typography. Print-inspired. |

You don't have to name one. Describe a vibe and Claude picks the closest match.

---

## Output

All docs go to `.design/<feature-name>/` in the project root:

```
.design/
└── my-feature/
    ├── GRILL_SUMMARY.md
    ├── DESIGN_BRIEF.md
    ├── INFORMATION_ARCHITECTURE.md
    ├── TASKS.md
    └── DESIGN_REVIEW.md
```

Commit `.design/` to your repo — it's the design rationale for the feature.

---

## Key Principles

- **Respect existing code** — Every skill scans for existing components, tokens, and patterns before generating anything new. Never duplicates what already exists.
- **Mobile-first** — Every UI built at 375px first, scaled up with `min-width` queries.
- **Dark mode by default** — Token system generates both palettes. UI supports `prefers-color-scheme` and a manual toggle.
- **Token-only values** — Never hardcoded colours, sizes, or durations in component code.
