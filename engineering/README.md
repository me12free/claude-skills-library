# Engineering Commands

15 expert prompts for senior-level software engineering tasks.

Each command uses `$ARGUMENTS` for its primary input — everything after the command name is passed in automatically.

---

## Command Reference

| Command | Primary argument | What it does |
|---|---|---|
| `/architecture-review <project>` | Project name or description | Full target architecture doc with Mermaid diagram |
| `/pr-review <branch>` | Branch name | Security-first structured PR review |
| `/security-audit <service>` | Service name | 3-agent pre-production security audit |
| `/developer-guide <feature>` | Feature name | Security-first handoff doc for a developer |
| `/feature-plan <feature>` | Feature description | Phased implementation plan, no code yet |
| `/pr-comment-direct <branch>` | Branch name | Blunt GitHub PR comment, severity-grouped |
| `/pr-comment-inquiry <branch>` | Branch name | PR comment that asks before asserting |
| `/integration-docs <provider>` | Provider name | Research + verify official docs before coding |
| `/codebase-review <service>` | Service/repo name | 4-agent full codebase audit |
| `/performance-audit <service>` | Service name | DB, API, cache, task queue bottleneck analysis |
| `/optimize <target>` | File or endpoint path | Two-phase optimization plan with approval gate |
| `/post-mortem <service>` | Service name | Structured incident post-mortem + fix plan |
| `/new-service <name>` | Service name and purpose | Pre-scaffold briefing — reuse opportunities + risks |
| `/test-gaps <module>` | Module or service name | Coverage map + prioritised test stubs |
| `/dep-audit <service>` | Service name | CVE + maintenance risk table for all dependencies |

---

## Tips

- **Be specific with scope.** `/security-audit payment-service` with a list of specific files in the prompt produces a better audit than just the service name.
- **Engineering commands read real code.** They require a working codebase to be useful — they do not invent or assume.
- **Multi-agent commands** (`/security-audit`, `/codebase-review`) launch parallel agents. They take longer but produce more thorough output.
- **Replace `{{placeholders}}`** in any prompt before Claude runs it — some commands have secondary placeholders beyond `$ARGUMENTS`.
