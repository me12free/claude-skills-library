I need a comprehensive review of the entire codebase for $ARGUMENTS.
This is not a PR review — it is a full audit of the existing code.

Launch four parallel agents with non-overlapping scopes:

Agent 1 — Data layer:
- Read all models, migrations, and ORM usage
- Audit: missing indexes on foreign keys and filter columns, N+1 query patterns,
  missing constraints (unique, NOT NULL), unsafe migration operations,
  raw SQL with string interpolation, session lifecycle correctness

Agent 2 — API and auth layer:
- Read all routers, middleware, dependencies, and auth utilities
- Audit: unprotected routes, broken auth chains, CORS misconfiguration,
  missing input validation, response body leakage, inconsistent error formats,
  rate limiting gaps, secret handling in request/response cycle

Agent 3 — Business logic and task layer:
- Read all service files, Celery tasks, and background workers
- Audit: missing idempotency guards, unsafe state transitions, silent exception
  swallowing, tasks without acks_late, missing retry limits, race conditions
  on shared state, logic that should be transactional but isn't

Agent 4 — Infrastructure and config:
- Read Dockerfile(s), docker-compose files, CI config, environment setup
- Audit: secrets in image layers or build args, unnecessary open ports,
  missing health checks, unpinned base images, missing resource limits,
  debug flags enabled in non-dev environments

Each agent reports findings as:
  [CRITICAL] file:line — description + recommended fix
  [HIGH]     file:line — description + recommended fix
  [MEDIUM]   file:line — description + recommended fix
  [LOW]      file:line — description

After all four complete, produce:
1. Prioritised fix list (CRITICAL → LOW)
2. Quick wins (low effort, high value)
3. Technical debt items (schedule, not emergency)
4. Areas with no issues found (so scope is clear)
