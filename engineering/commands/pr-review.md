You are a senior security engineer and code reviewer. Review the PR on branch
`$ARGUMENTS` against `{{base_branch}}`.

Steps:
1. Run: git fetch origin $ARGUMENTS
2. Run: git fetch origin {{base_branch}}
3. Run: git log --oneline origin/{{base_branch}}..origin/$ARGUMENTS
4. Run: git diff origin/{{base_branch}}..origin/$ARGUMENTS --stat  (get the file list first)
5. Run: git diff origin/{{base_branch}}..origin/$ARGUMENTS  (full diff)
6. Read every changed file in full via `git show origin/$ARGUMENTS:<path>`.

---

## Section 1 — Security (blockers first)

- **Endpoint auth:** Every new or modified route must have an explicit auth dependency. Flag any route that is unprotected or where the dependency was removed or weakened.
- **Secret storage:** Any credential (PIN, password, token) added to a model must be stored hashed — never plaintext. Flag plaintext storage or logging of any credential value.
- **Fail-closed auth:** Auth middleware must reject before any business logic runs. Check for any code path that allows a request through on error or exception.
- **Brute-force / rate limiting:** Any endpoint that accepts a credential must have a rate limit or lockout. Flag absence.
- **Constant-time comparisons:** Secret comparisons must use `hmac.compare_digest` or equivalent — never `==`.
- **Input validation / injection:** Check every new query parameter, path parameter, and request body field that reaches the DB or a shell.
- **PII / sensitive data in logs:** Check every new `logger.*` call — phone numbers, emails, tokens must be masked. Never log them raw.
- **Error internals exposed to callers:** `detail=str(e)` on bare `except Exception` leaks internal exception messages to API consumers. Flag it.
- **Seeding / debug endpoints in production:** Flag any endpoint that is a seeding utility, debug tool, or check-then-insert operation that should not exist in production.

---

## Section 2 — Breaking changes to existing functionality (MANDATORY — never skip)

This section covers changes in files that already existed on the base branch. Read the diff for each modified existing file carefully and answer every question below.

**ORM model changes**
- Was a new `Relationship` added to an existing model? If so, check `lazy=` setting. `lazy="selectin"` means every ORM load of that model now fires an additional query automatically. Count how many places in tasks, services, and endpoints load that model — each one now pays the extra query cost. If the relationship points to a table introduced by a migration in this same PR, deploying the code before running the migration will cause every load of that model to fail with a "table does not exist" error, breaking all existing functionality that touches it.
- Was a new column or field added to an existing model? Check whether existing serialisers / response schemas that use `from_attributes = True` will break if the DB column doesn't exist yet (migration not yet run).

**Deployment ordering risk**
- If the PR adds a migration AND modifies an existing model or relationship, confirm whether deploying code before running the migration causes a hard failure on startup or at first query. If it does, flag the required deploy order explicitly: migrate first, then deploy code.

**Celery task changes**
- Were existing task signatures changed (renamed, args reordered, new required args)? In-flight tasks serialised with the old signature will fail when picked up by the new worker.
- Were new tasks added that route to a new queue name? Check the deployment config (docker-compose, Procfile, start_celery_workers.sh) to confirm a worker process actually consumes that queue. A queue with no consumer causes tasks to accumulate in Redis indefinitely, applying silent memory pressure.
- Are new tasks defined as `async def`? Check the worker pool setting (`worker_pool` in celery config). Prefork workers do not execute coroutine functions — they return the coroutine object silently. All `async def` tasks must be regular `def` functions using the project's async runner helper.

**SQLAlchemy event listeners**
- Were new `@event.listens_for(Model, ...)` listeners registered? These attach to mapper classes globally. Check where they are initialised — if inside a lifespan/startup hook that can run multiple times (uvicorn reload, multiple workers), listeners will accumulate and fire multiple times per event. Also check whether they fire before or after transaction commit; dispatching Celery tasks from a pre-commit listener means the worker may read uncommitted data.

**Cache invalidation ordering**
- Is `cache.remove()` or `cache.set()` called inside a `@transactional()` block before the transaction commits? If so, a concurrent request that misses the cache between invalidation and commit will read pre-commit state from the DB and may cache it. If the transaction then fails, the cache holds a stale miss for committed-but-never-existed data.

**Auth / verification flows**
- Were any `asyncio.sleep()` calls added to user-facing auth flows (OTP verification, login, password reset)? These add latency regressions to every user on that path. A sleep does not guarantee DB commit propagation — flag any sleep used for that purpose.
- Were any debug `logger.info` calls added to existing auth methods? Check whether they log raw PII (phone numbers, emails, tokens).

**Beat schedule conflicts**
- Do any new cron entries share the same UTC time window as existing heavy tasks (scoring, billing, reconciliation)? Flag Sunday / daily collisions that could exhaust DB connections.

**Worker and queue resource fit**
- Is a new queue declared but no worker process in the deployment config (docker-compose, Procfile, start script) actually consumes it? If so, tasks will accumulate in the broker indefinitely. Do not just flag this — read the task definitions, classify each task by profile (short I/O-bound, long DB-heavy batch, high-frequency per-event), compare against existing worker queue assignments and their concurrency/memory settings, then give a specific routing recommendation. Only recommend a new dedicated worker if the task profile is genuinely incompatible with every existing worker (different memory ceiling, different SLA, needs independent scaling). At current scale, rerouting to an existing queue is almost always the lower-cost right answer.
- Is there a beat schedule conflict? Read the existing `beat_schedule` entries and their UTC times. If a new batch task lands in the same time slot as an existing heavy task on a `concurrency=1` worker, give the specific time fix — don't just note the risk.
- Is there a high-frequency fan-out pattern — one write event triggering one task per record? Read what models the event listeners attach to and what the write frequency is (payment processing, user updates, etc.). If there is no debounce guard, recommend one with a specific TTL based on what the task actually does and what staleness is acceptable for that domain. State the reasoning, not just "consider a debounce".
- Is `worker_prefetch_multiplier` left at its default (4) on a worker that runs long tasks? Flag it with the specific worker name and the impact on that worker's queue.

---

## Section 3 — Migration safety

- **Revision chain:** Confirm `down_revision` in every new migration file matches the actual head of the chain on the base branch.
- **Destructive ops:** Flag any `DROP COLUMN`, `DROP TABLE`, or `ALTER COLUMN` that changes type or removes NOT NULL without a backfill.
- **Missing nullable/server_default:** Any new `NOT NULL` column on an existing table must have a `server_default` or the migration will fail on non-empty tables.
- **Nullable columns that should not be:** New columns with `nullable=True` but no `server_default` on a required field leave the DB open to NULL values the ORM does not expect.
- **Idempotency:** Migration must be runnable exactly once — no `CREATE TABLE` without `IF NOT EXISTS` where appropriate, no index creation without a check.
- **Missing unique constraints:** If the application logic enforces uniqueness with a check-then-insert pattern but there is no DB-level unique constraint, flag the race condition.

---

## Section 4 — Correctness

- Does the implementation match the PR description?
- Are response schema field names consistent with what the service layer actually returns? Mismatched keys cause silent zeros or Pydantic validation errors at runtime.
- Are terminal state transitions guarded against re-processing?
- Celery money-moving tasks: `acks_late=True`, `reject_on_worker_lost=True`, idempotency guard?
- Are any endpoints performing expensive operations (full-table evaluation, large result sets) synchronously inside the request handler that should instead dispatch a Celery task?
- Are there N+1 query patterns — loops that call a service method per item where a single aggregated query would suffice?
- Are paginated endpoints doing SQL-level LIMIT/OFFSET, or loading the full result set into memory and slicing in Python?

---

## Section 5 — Conventions

- Are existing utilities reused (auth deps, session factory, rate limiter, HMAC signer, `@transactional()` decorator)?
- Are notifications dispatched via Celery, not synchronously from request handlers?
- Are new service methods that mutate state decorated with `@transactional()`?

---

## Section 6 — Test coverage

- Are new auth paths covered by tests?
- Are lockout / rate-limit edge cases tested?
- Do the tests actually run in CI (pytest-discoverable), or are they scripts that require a live server?
- Do tests cover the broken paths found in this review (schema mismatches, key mismatches, etc.)?

---

Format: one section per heading above, bullet points, `file:line` reference for every finding.
Write the full review to a `.md` file in the project root named `pr_review_<branch-name>.md`. Never only output to terminal.
End with a verdict: **APPROVE / REQUEST CHANGES / NEEDS DISCUSSION** and a one-sentence rationale.
