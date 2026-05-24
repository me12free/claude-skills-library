I want to optimize $ARGUMENTS.

Before proposing changes:
1. Read the target file(s) in full
2. Profile the call path: identify every DB query, external call, and CPU-heavy operation
3. Check if any existing utility (cache, batch loader, task queue) could apply

Then produce a two-phase optimization plan:

**Phase 1 — No-risk wins (ship immediately)**
- Changes with zero behaviour change: index additions, query rewrites, removing redundant
  fetches, replacing ORM calls with more efficient equivalents
- For each: file:line, before snippet, after snippet, why it's faster

**Phase 2 — Structural changes (requires testing)**
- Moving sync work to async tasks, adding caching, batching external calls
- For each: the change, the tradeoff, and the test that must pass before shipping

**Do not touch:**
- Auth logic
- Error handling paths
- Anything not in the critical path of this feature

After listing the plan, ask for approval before implementing anything.
