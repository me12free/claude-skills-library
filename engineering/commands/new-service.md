I am about to scaffold a new service: $ARGUMENTS.

Before I write any code, review the existing codebase and answer:

1. **What already exists that I should reuse?**
   - Auth utilities (file:function)
   - Session/DB factories (file:function)
   - Rate limiters (file:function)
   - Error response helpers (file:function)
   - Celery setup and task base class (file:function)
   - Logging config (file:function)

2. **What is the established pattern for:**
   - Structuring a new router (show a real example from the codebase)
   - Wiring a new service into the app (file:line)
   - Adding a new Alembic migration
   - Writing an integration test for an endpoint

3. **What env vars will this service need?**
   List what I need to add to `.env.example` and any startup validation.

4. **What are the cross-service auth requirements?**
   How does this service authenticate to others, and how do others authenticate to it?

5. **Risks of adding this service:**
   - Shared DB schema conflicts?
   - Event/task naming collisions?
   - Port or config conflicts?

Output this as a concise briefing I can hand to a developer before they start.
