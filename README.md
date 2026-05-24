# Claude Skills Library

<p align="center">
  <a href="https://github.com/me12free/claude-skills-library"><img src="https://img.shields.io/badge/Claude_Code-compatible-blue?style=flat-square" alt="Claude Code compatible"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="MIT License"></a>
  <img src="https://img.shields.io/badge/commands-28-orange?style=flat-square" alt="28 commands">
  <img src="https://img.shields.io/badge/platform-Mac%20%7C%20Linux%20%7C%20Windows-lightgrey?style=flat-square" alt="Cross-platform">
</p>

<p align="center">
  A reusable library of Claude Code slash commands covering full-stack engineering and UI design workflows.<br>
  Works globally across all your projects, or installed per-project for your team.
</p>

---

## At a Glance

| | What | Commands |
|---|---|---|
| **Design** | 7-phase AI design process: idea to production UI | 13 commands + 8 skill files |
| **Engineering** | Expert prompts for audits, reviews, and architecture | 15 commands |

```
28 total commands  |  install in 60 seconds  |  global or per-project  |  Mac · Linux · Windows
```

---

## About

Built by a full-stack developer with a strong backend bias, not a designer. The engineering commands reflect that: security-first, production-focused, backend-heavy. The design commands exist because even backend developers ship UIs, and a bad UI ships bad work regardless of how solid the backend is.

**Design skills** are adapted from [julianoczkowski/designer-skills](https://github.com/julianoczkowski/designer-skills) by Julian Oczkowski. The design process, phase structure, aesthetic philosophy system, and SKILL.md format are his original work. I adapted them for Claude Code's slash command system and added standalone prompt variants for developers who need to ship UI without being designers.

**Engineering commands** are original, written for senior full-stack and backend work.

---

## Before You Start

> These skills work from your project context. They are not magic wands.

Claude needs to understand your project to produce useful output. Before running any command:

- Have a `CLAUDE.md` in your project root (run `/init` in Claude Code if you don't)
- Have your codebase checked out and readable
- Know your tech stack
- For engineering skills: the code must already exist in the repo
- For design skills: have at least a tech stack decision made

The more context Claude has, the better the output. **Vague project = vague results.**

See [setup/PREREQUISITES.md](setup/PREREQUISITES.md) for the full checklist.

---

## Install

### Script

**Mac / Linux:**
```bash
git clone https://github.com/me12free/claude-skills-library.git
cd claude-skills-library
bash install.sh                     # everything, globally
bash install.sh global design       # design only
bash install.sh global engineering  # engineering only
bash install.sh project all         # into current project (.claude/)
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/me12free/claude-skills-library.git
cd claude-skills-library
.\install.ps1                            # everything, globally
.\install.ps1 -Scope global -Pack design
.\install.ps1 -Scope global -Pack engineering
.\install.ps1 -Scope project -Pack all   # into current project
```

> If PowerShell blocks the script: `powershell -ExecutionPolicy Bypass -File install.ps1`

### Tell Claude (no terminal needed)

Open Claude Code and paste the prompt from [setup/INSTALL_GLOBAL_PROMPT.md](setup/INSTALL_GLOBAL_PROMPT.md). Claude clones the repo, runs the install, and confirms what was set up.

### Per-project (share with your team)

Paste the prompt from [setup/INSTALL_PROJECT_PROMPT.md](setup/INSTALL_PROJECT_PROMPT.md) inside your project. Claude installs into `.claude/` in your project root.

Then commit it so teammates get the commands automatically:

```bash
git add .claude/
git commit -m "chore: add claude skills library"
```

---

## What Gets Installed

| Path | Contents |
|---|---|
| `~/.claude/skills/` | 8 design skill knowledge files (read by design commands) |
| `~/.claude/commands/` | 13 design slash commands |
| `~/.claude/commands/` | 15 engineering slash commands |

---

## Design Commands

Run `/design-flow` to be guided through all 7 phases in sequence, or jump to any individual phase.

```
/design-flow
     |
     v
/grill-me              phase 1: stress-test the idea before any code is written
     |
     v
/design-brief          phase 2: structured brief + codebase scan + aesthetic direction
     |
     v
/information-architecture   phase 3: nav, pages, hierarchy, URL patterns, user flows
     |
     v
/design-tokens         phase 4: complete CSS token system (light + dark mode)
     |
     v
/brief-to-tasks        phase 5: break the brief into layered, independently buildable slices
     |
     v
/frontend-build        phase 6: build the UI from every doc above
     |
     v
/design-review         phase 7: critique against the brief (screenshots or code)
```

| Command | What it does |
|---|---|
| `/design-session <product>` | Master prompt: loads skills and starts the full flow |
| `/design-flow` | Guided 7-phase sequence with a confirm between each phase |
| `/grill-me` | Stress-test requirements before a line of code is written |
| `/design-brief` | Structured brief + codebase scan + aesthetic direction |
| `/information-architecture` | Nav, pages, content hierarchy, URL patterns, user flows |
| `/design-tokens` | Full CSS custom property token system, light and dark mode |
| `/brief-to-tasks` | Break the brief into layered, independently buildable slices |
| `/frontend-build` | Build the UI from all prior documents |
| `/design-review` | Structured critique against the brief |
| `/design-build-one <component>` | Build a single scoped component |
| `/design-review-built <slug>` | Review what was built against its brief |
| `/design-fix <files>` | Diagnose and fix an existing page's design |
| `/design-tokens-new <product>` | Generate a token system from scratch |

All design output is written to `.design/<feature-name>/` in your project root. Commit that folder - it is the design rationale for the feature.

### Aesthetic Philosophies

The `/design-tokens` and `/frontend-build` skills use one of eight named design philosophies. Name one or describe a vibe and Claude picks the closest match.

| Philosophy | Character |
|---|---|
| Dieter Rams | Less but better. Functional. Zero decoration without purpose. |
| Swiss / International | Grid-locked. Strong type hierarchy. Objective. |
| Japanese Minimalism (Ma) | Negative space as content. Quiet. Restrained. |
| Brutalist | Raw structure visible. Anti-polish. Content-first. |
| Scandinavian | Warmth plus restraint. Rounded. Accessible by default. |
| Art Deco | Geometric luxury. Bold symmetry. Statement typography. |
| Neo-Memphis | Playful chaos. Clashing colour. Anti-corporate. |
| Editorial / Magazine | Content-led. Display typography. Print-inspired. |

---

## Engineering Commands

| Command | What it does |
|---|---|
| `/architecture-review <project>` | Target architecture document with Mermaid diagram |
| `/pr-review <branch>` | Security-first structured PR review |
| `/security-audit <service>` | 3-agent pre-production security audit |
| `/developer-guide <feature>` | Security-first handoff document for a developer |
| `/feature-plan <feature>` | Phased implementation plan, no code written yet |
| `/pr-comment-direct <branch>` | Blunt GitHub PR comment grouped by severity |
| `/pr-comment-inquiry <branch>` | PR comment that asks before asserting |
| `/integration-docs <provider>` | Research and verify official docs before coding |
| `/codebase-review <service>` | 4-agent full codebase audit |
| `/performance-audit <service>` | DB, API, cache, and task queue bottleneck analysis |
| `/optimize <file or endpoint>` | Two-phase optimization plan with an approval gate |
| `/post-mortem <service>` | Structured incident post-mortem and fix plan |
| `/new-service <name>` | Pre-scaffold briefing: what to reuse, what risks exist |
| `/test-gaps <module>` | Coverage map and prioritised test stubs |
| `/dep-audit <service>` | CVE and maintenance risk table for all dependencies |

---

## Global CLAUDE.md (Optional)

[setup/CLAUDE_MD_TEMPLATE.md](setup/CLAUDE_MD_TEMPLATE.md) is a global instruction template for `~/.claude/CLAUDE.md`.

It configures Claude as a senior full-stack engineer and security architect with opinionated defaults for code quality, security, git behaviour, and PR reviews. Adopt it wholesale or take the sections you want.

---

## Key Principles

These apply to every skill and command in this library:

- **Context-first** - Every skill reads the existing codebase before generating anything. It never duplicates what already exists.
- **Mobile-first** - Every UI is built at 375px first, scaled up with `min-width` queries.
- **Dark mode by default** - Token system generates both palettes. UI supports `prefers-color-scheme` and a manual toggle.
- **Token-only values** - No hardcoded colours, sizes, or durations in component code. Everything references CSS custom properties.
- **Security defaults** - Engineering commands apply security checks automatically. No reminder needed.
- **No generic output** - Skills use the project's existing patterns. They do not generate boilerplate or cookie-cutter code.

---

## Credits

| Part | Credit |
|---|---|
| Design skills (process, phases, philosophy system, SKILL.md format) | [Julian Oczkowski](https://github.com/julianoczkowski/designer-skills) |
| Engineering commands | [me12free](https://github.com/me12free) |
| Adaptation for Claude Code slash commands | [me12free](https://github.com/me12free) |

---

## Directory Structure

```
claude-skills-library/
|-- README.md
|-- install.sh              Mac/Linux installer
|-- install.ps1             Windows installer
|-- LICENSE
|-- SECURITY.md
|
|-- design/
|   |-- README.md
|   |-- skills/             Knowledge files read by design commands
|   |   |-- design-flow/SKILL.md
|   |   |-- grill-me/SKILL.md
|   |   |-- design-brief/SKILL.md
|   |   |-- information-architecture/SKILL.md
|   |   |-- design-tokens/SKILL.md
|   |   |-- brief-to-tasks/SKILL.md
|   |   |-- frontend-build/SKILL.md
|   |   `-- design-review/SKILL.md
|   `-- commands/           Slash commands installed to ~/.claude/commands/
|       `-- *.md
|
|-- engineering/
|   |-- README.md
|   `-- commands/           Slash commands installed to ~/.claude/commands/
|       `-- *.md
|
`-- setup/
    |-- PREREQUISITES.md
    |-- CLAUDE_MD_TEMPLATE.md
    |-- INSTALL_GLOBAL_PROMPT.md
    `-- INSTALL_PROJECT_PROMPT.md
```
