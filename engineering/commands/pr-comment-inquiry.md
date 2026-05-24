Read the diff on branch $ARGUMENTS.
Produce a GitHub PR review comment in markdown.

Rules:
- No congratulations, no praise
- For findings where the intent is unclear: ask "was this intentional?" before stating it's wrong
- For clear bugs or security issues: state the issue and the fix directly
- Group by severity if there are multiple issues
- Keep it conversational but professional - not formal, not casual
- One code block per issue maximum
- Output raw markdown only - ready to paste into GitHub
