I need a thorough pre-production security audit of $ARGUMENTS.
Real money / sensitive user data is at stake. Treat every finding as potentially critical.

Launch three parallel expert auditors covering these slices:

Agent 1 - Transport and middleware layer:
Read: {{list middleware and auth files}}
Audit: auth credential validation, replay window, IP filtering, rate limiting (sliding vs fixed),
body size limits, SSRF on any URL inputs, session factory isolation, startup secret validation,
hardcoded secrets, logging of PII.

Agent 2 - Business logic and data layer:
Read: {{list service and model files}}
Audit: double-processing prevention (idempotency), state machine correctness,
commit-before-notify ordering, session isolation per request/task, stale ORM state,
Celery task safety (acks_late, reject_on_worker_lost), silent exception swallowing,
race conditions on concurrent writes.

Agent 3 - Integration and API boundaries:
Read: {{list API router, webhook, and external integration files}}
Audit: webhook signature verification (mandatory vs skippable), provider callback handling,
credential isolation between services, 4xx vs 5xx error handling, response body leakage,
terminal state guards on all status transitions, audit trail completeness.

Each agent must report: PASS / FAIL / WARN with exact file:line for every finding.
After all three complete, give me a consolidated verdict:
- List of blockers (must fix before production)
- List of high issues (fix before first real transaction)
- List of medium/low items (fix within 30 days)
- Overall go / no-go
