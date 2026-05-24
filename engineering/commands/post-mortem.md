We had an incident in $ARGUMENTS on {{date}} involving {{brief description}}.

I need a structured post-mortem and fix plan. Do not speculate — only use what is in:
- The codebase
- {{any logs, stack traces, or error outputs pasted below}}

Produce:

**Timeline** (UTC)
| Time | Event |
|------|-------|
| | |

**Root cause**
- Primary cause: one sentence
- Contributing factors: bullet list

**Impact**
- What broke?
- Who was affected?
- Was any data affected? If so, what and how much?

**Why existing safeguards didn't catch it**
- For each safeguard that should have caught this: why it didn't

**Fix plan**
| # | Fix | File:line | Prevents recurrence of |
|---|-----|-----------|------------------------|
| 1 | | | |

**Detection improvements**
- What alert or log would have surfaced this earlier?
- What test would have caught it in CI?

**Verify the fix**
- Specific test case to confirm the fix works
- Specific monitoring check to confirm no regression

Keep the language factual. No blame, no "should have". Focus on systems, not people.
