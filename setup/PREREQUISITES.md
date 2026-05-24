# Prerequisites - What You Need Before Using These Skills

The skills and prompts in this library read your actual codebase and project context. They are not standalone - they amplify what already exists. The more context Claude has going in, the better the output.

---

## For All Skills

### 1. Claude Code installed and authenticated
- Install: `npm install -g @anthropic-ai/claude-code` (or download the desktop app)
- Authenticate: `claude` and follow the login prompt

### 2. A project CLAUDE.md
Every project should have a `CLAUDE.md` in the root that tells Claude:
- What the project does
- The tech stack (language, framework, database, task queue, etc.)
- Key architectural decisions
- Conventions (naming, file structure, test approach)
- What not to do

If you don't have one yet, run `/init` inside Claude Code to generate one.

### 3. An accessible codebase
Claude reads real files. Skills work best when:
- The repo is checked out locally
- Key source files are not behind gitignore patterns that prevent reading
- The project can be understood from the file tree

---

## For Engineering Skills

### `/pr-review`, `/pr-comment-direct`, `/pr-comment-inquiry`
- Git must be installed and the repo must have a remote
- The branch being reviewed must be fetched locally or fetchable
- `git log` and `git diff` must work from the project root

### `/security-audit`, `/codebase-review`
- Works best when you list the specific files in scope (see the prompt placeholder)
- Vague scope = vague audit. "Audit the whole repo" is less useful than "Audit auth/, services/, and routers/"

### `/integration-docs`
- Claude will web-search the official docs - confirm the URL is from the official domain before trusting content
- Have your `.env.example` up to date so Claude knows which env vars already exist

### `/dep-audit`
- Requires a `requirements.txt`, `pyproject.toml`, or `package.json` in the project root
- Claude will web-search for CVEs - results are best-effort, not a substitute for a dedicated scanner

---

## For Design Skills

### Before `/design-flow` or `/design-session`

You need to have decided (or be willing to decide during grilling):

- **Tech stack** - framework, CSS approach (Tailwind, CSS modules, global CSS, styled-components), component library if any
- **Existing components** - what's already built? Claude will scan for these, but knowing in advance speeds things up
- **Existing token system** - any `tokens.css`, `variables.css`, Tailwind config? Claude will detect these and extend rather than replace
- **Screen sizes to support** - mobile-first is the default (375px); let Claude know if you're desktop-only

You do **not** need to have the visual design figured out - that's what `/grill-me` and `/design-brief` are for.

### During the design flow

- All design documents are saved to `.design/<feature-name>/` in your project root
- These documents persist between sessions - if you close Claude and come back, Claude can resume from where it left off
- Committing the `.design/` directory means your team can see the design rationale

### `/frontend-build`

Before Claude can build, you need:
- A completed `DESIGN_BRIEF.md` (from `/design-brief`)
- A token system in place or agreed to skip it
- A task list (from `/brief-to-tasks`) - Claude will not start building without a brief

---

## Quick Health Check

Run this mental checklist before starting any skill:

- [ ] `CLAUDE.md` exists in the project root (or I ran `/init`)
- [ ] The codebase is checked out and readable
- [ ] I know my tech stack
- [ ] I know roughly what I want to build or review
- [ ] Git is configured (for engineering skills)
- [ ] I have 15–30 minutes - these skills produce thorough output, not one-liners
