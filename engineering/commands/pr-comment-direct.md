Read the diff on branch $ARGUMENTS.
Produce a GitHub PR review comment in markdown.

Rules:
- No congratulations, no praise, no "great work"
- Go directly to the issues
- Group by severity: blocker first, then high, then medium
- For each issue: what it is, why it matters, the fix (one code block if needed)
- If something is correct and intentional, do not mention it
- Keep it under 500 words
- Output raw markdown only - ready to paste into GitHub
