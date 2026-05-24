Audit $ARGUMENTS for performance bottlenecks and scalability limits.

Explore the codebase fully before reporting. Then produce:

**Database**
- Identify all queries that will degrade under load (missing indexes, full table scans,
  N+1 patterns, unbounded result sets)
- Identify all write paths that could create lock contention
- For each issue: file:line, the query or ORM call, and the fix

**API layer**
- Identify endpoints with no pagination on list responses
- Identify synchronous operations that should be async (file I/O, external API calls,
  image processing, email/SMS dispatch)
- Identify any endpoint doing more than one round-trip to the DB when one would do

**Caching**
- Identify data that is read frequently but changes rarely — candidate for cache
- Identify any existing cache usage that has no TTL or no invalidation strategy
- Recommend specific cache keys, TTLs, and invalidation triggers

**Task queue**
- Identify Celery tasks with no rate limit that could flood external APIs
- Identify tasks with no result expiry (unbounded result backend growth)
- Identify tasks that retry indefinitely without a max_retries ceiling

**Horizontal scaling blockers**
- Identify any in-process state (module-level variables, local file storage) that
  breaks with multiple workers
- Identify any assumption of single-instance behaviour

**Load projection**
For each bottleneck found, estimate:
- At what request rate or data volume does this become a problem?
- What is the fix and its complexity (hours/days)?

Output format: one section per category above, with a final prioritised table:
| Issue | Severity | Est. fix effort | Owner hint |
|-------|----------|-----------------|------------|
