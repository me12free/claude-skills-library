# Claude Skills Library

A reusable, shareable library of Claude Code skills and slash commands covering two domains:

- **Design** — a full 7-phase AI design process: from idea → brief → tokens → build → review
- **Engineering** — 15 expert prompts for architecture reviews, security audits, PR reviews, performance audits, and more

Works globally (all your projects) or per-project (team-shared). Install in 60 seconds.

---

## About This Library

Built by a full-stack developer with a strong backend bias — not a designer. The engineering commands are written from that perspective: security-first, production-focused, backend-heavy. The design skills exist because even backend-leaning developers ship UIs, and shipping a bad UI is still shipping bad work.

**Design skills** are adapted from [julianoczkowski/designer-skills](https://github.com/julianoczkowski/designer-skills) — an excellent design process library by Julian Oczkowski. I adapted the skills for Claude Code's slash command system and added the standalone prompt variants. All credit for the design process, phase structure, and aesthetic philosophy system goes to Julian.

**Engineering commands** are my own, written for senior full-stack and backend work.

---

## Before You Start — Prerequisites

**These skills work from context. They are not magic wands.**

For the skills to produce useful output, Claude needs to understand your project. Before running any skill or prompt, make sure you have:

- A `CLAUDE.md` in your project root describing the tech stack, conventions, and key decisions
- Your project already partially explored by Claude (run `/init` if you haven't)
- For design skills: a working frontend codebase or at least a clear tech stack decision
- For engineering skills: the code already in the repo (skills read real files — they don't invent them)

The more context Claude has, the better the output. Vague project = vague results.

See [setup/PREREQUISITES.md](setup/PREREQUISITES.md) for the full checklist.

---

## Install

### Option 1 — Script (fastest)

**Mac / Linux:**
```bash
git clone https://github.com/me12free/claude-skills-library.git
cd claude-skills-library
bash install.sh                    # install everything globally
bash install.sh global design      # design skills only
bash install.sh global engineering # engineering commands only
bash install.sh project all        # install into current project (.claude/)
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/me12free/claude-skills-library.git
cd claude-skills-library
.\install.ps1                           # install everything globally
.\install.ps1 -Scope global -Pack design
.\install.ps1 -Scope global -Pack engineering
.\install.ps1 -Scope project -Pack all  # install into current project
```

---

### Option 2 — Tell Claude (no terminal needed)

Open Claude Code in any project and paste the prompt from [setup/INSTALL_GLOBAL_PROMPT.md](setup/INSTALL_GLOBAL_PROMPT.md).

Claude will clone the repo, run the install, and confirm what was installed.

---

### Option 3 — Per-project setup prompt

Paste the prompt from [setup/INSTALL_PROJECT_PROMPT.md](setup/INSTALL_PROJECT_PROMPT.md) into Claude Code inside your project.

Claude will install the skills into `.claude/` in your current project, making them available to your team when they check out the repo.

---

## What Gets Installed

| Location | What | Available as |
|---|---|---|
| `~/.claude/skills/` | 8 design skill knowledge files | Referenced by design commands |
| `~/.claude/commands/` | 13 design commands | `/design-flow`, `/grill-me`, etc. |
| `~/.claude/commands/` | 15 engineering commands | `/pr-review`, `/security-audit`, etc. |

---

## Design Commands

The design system is a 7-phase process. Run `/design-flow` to be guided through all phases in sequence, or jump to any individual phase.

| Command | Phase | What it does |
|---|---|---|
| `/design-session <product>` | All | Master prompt — loads skills, starts full flow |
| `/design-flow` | Orchestrator | Guided 7-phase sequence with confirm between each |
| `/grill-me` | 1 | Stress-test the idea before any code is written |
| `/design-brief` | 2 | Structured brief + codebase scan + aesthetic direction |
| `/information-architecture` | 3 | Nav, pages, hierarchy, URL patterns, user flows |
| `/design-tokens` | 4 | Complete CSS token system (light + dark mode) |
| `/brief-to-tasks` | 5 | Break the brief into layered, independently buildable slices |
| `/frontend-build` | 6 | Build the UI from all prior docs |
| `/design-review` | 7 | Critique against the brief — screenshots or code |
| `/design-build-one <component>` | Standalone | Build one specific component |
| `/design-review-built <slug>` | Standalone | Review what was built |
| `/design-fix <files>` | Standalone | Fix an existing page's design |
| `/design-tokens-new <product>` | Standalone | Generate a token system from scratch |

**Design output:** All docs are written to `.design/<feature-name>/` in your project root.

---

## Engineering Commands

| Command | What it does |
|---|---|
| `/architecture-review <project>` | Target architecture doc with Mermaid diagram |
| `/pr-review <branch>` | Security-first PR review |
| `/security-audit <service>` | 3-agent pre-production security audit |
| `/developer-guide <feature>` | Security-first handoff doc for a developer |
| `/feature-plan <feature>` | Phased implementation plan, no code yet |
| `/pr-comment-direct <branch>` | Blunt GitHub PR comment, severity-grouped |
| `/pr-comment-inquiry <branch>` | PR comment that asks before asserting |
| `/integration-docs <provider>` | Research + verify official docs before coding |
| `/codebase-review <service>` | 4-agent full codebase audit |
| `/performance-audit <service>` | DB, API, cache, task queue bottleneck analysis |
| `/optimize <file or endpoint>` | Two-phase optimization plan with approval gate |
| `/post-mortem <service>` | Structured incident post-mortem + fix plan |
| `/new-service <name>` | Pre-scaffold briefing — what to reuse, what risks |
| `/test-gaps <module>` | Coverage map + prioritised test stubs |
| `/dep-audit <service>` | CVE + maintenance risk table for all dependencies |

---

## Credits

- **Design skills** — adapted from [julianoczkowski/designer-skills](https://github.com/julianoczkowski/designer-skills) by Julian Oczkowski. Original design process, phase structure, aesthetic philosophy system, and SKILL.md format are his work.
- **Engineering commands** — written by [me12free](https://github.com/me12free).

---

## Global CLAUDE.md (Optional)

[setup/CLAUDE_MD_TEMPLATE.md](setup/CLAUDE_MD_TEMPLATE.md) is a global instruction template for `~/.claude/CLAUDE.md`.

It configures Claude as a senior full-stack engineer / security architect with opinionated defaults for code quality, security, git behaviour, and PR reviews. Adopt it wholesale or cherry-pick sections.

---

## Sharing with Your Team

For per-project installation, the `.claude/` directory should be committed to your repo:

```bash
git add .claude/
git commit -m "chore: add claude skills library"
```

Teammates who clone the repo get all commands and skills automatically when they open Claude Code.

---

## Directory Structure

```
claude-skills-library/
├── README.md
├── install.sh              # Mac/Linux installer
├── install.ps1             # Windows installer
│
├── design/
│   ├── README.md
│   ├── skills/             # Knowledge files read by design commands
│   │   ├── design-flow/SKILL.md
│   │   ├── grill-me/SKILL.md
│   │   ├── design-brief/SKILL.md
│   │   ├── information-architecture/SKILL.md
│   │   ├── design-tokens/SKILL.md
│   │   ├── brief-to-tasks/SKILL.md
│   │   ├── frontend-build/SKILL.md
│   │   └── design-review/SKILL.md
│   └── commands/           # Slash commands (~/.claude/commands/)
│       └── *.md
│
├── engineering/
│   ├── README.md
│   └── commands/           # Slash commands (~/.claude/commands/)
│       └── *.md
│
└── setup/
    ├── PREREQUISITES.md
    ├── CLAUDE_MD_TEMPLATE.md
    ├── INSTALL_GLOBAL_PROMPT.md
    └── INSTALL_PROJECT_PROMPT.md
```
