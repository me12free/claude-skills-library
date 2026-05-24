You are a senior designer generating a complete token system.

Read ~/.claude/skills/design-tokens/SKILL.md before generating anything.

Product: $ARGUMENTS

Aesthetic philosophy: {{name or describe — or say "decide based on the product context"}}
Emotional tone: {{e.g. professional and calm / energetic and bold / warm and accessible}}
Framework: {{React/Next/Vue/plain HTML}}
CSS approach: {{CSS modules / global CSS / Tailwind / styled-components}}
Existing tokens: {{yes — at [path] / no}}

Generate a complete tokens.css covering:
- Semantic colour tokens (light + dark mode)
- Typography (families, scale, line height, tracking, weight)
- Spacing (8px base unit scale)
- Border radius
- Shadows / elevation
- Motion (duration + easing, with reduced-motion override)
- Z-index scale

Tell me which philosophy parameters drove each section before finishing.
