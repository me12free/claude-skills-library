# Install Prompt - Per Project (paste this into Claude Code)

> Paste the block below into Claude Code inside the project where you want the skills installed.
> Claude will clone the repo, copy the files into `.claude/` in your project root,
> and confirm what was set up.

---

```
I want to install the claude-skills-library into this project so it's available to
everyone who checks out this repo.

Do the following steps:

1. Clone https://github.com/me12free/claude-skills-library into a temp directory:
   - Windows: use $env:TEMP\claude-skills-install as the target path
   - Mac/Linux: /tmp/claude-skills-install

2. Run the installer targeting this project:
   - Windows (PowerShell): cd into the cloned dir, then run: .\install.ps1 -Scope project -Pack all
     (if blocked by execution policy, run: powershell -ExecutionPolicy Bypass -File install.ps1 -Scope project -Pack all)
   - Mac/Linux (bash): cd into the cloned dir, then run: bash install.sh project all

   This will copy skills into .claude/skills/ and commands into .claude/commands/
   relative to the current working directory (the project root).

3. Delete the temp directory after installation completes.

4. List every command that was installed.

5. Remind me to commit .claude/ to the repo so teammates get the skills automatically:
   git add .claude/
   git commit -m "chore: add claude skills library"

If git is not available, use the WebFetch tool to download each file individually from:
https://raw.githubusercontent.com/me12free/claude-skills-library/main/<path>
and write them to .claude/skills/ and .claude/commands/ in the project root.
```
