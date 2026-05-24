# Install Prompt - Global (paste this into Claude Code)

> Paste the block below into Claude Code to install everything globally.
> Claude will clone the repo, run the install, and confirm what was set up.

---

```
I want to install the claude-skills-library globally so it applies to all my projects.

Do the following steps:

1. Clone https://github.com/me12free/claude-skills-library into a temp directory:
   - Windows: use $env:TEMP\claude-skills-install as the target path
   - Mac/Linux: /tmp/claude-skills-install

2. Run the installer:
   - Windows (PowerShell): cd into the cloned dir, then run: .\install.ps1 -Scope global -Pack all
     (if blocked by execution policy, run: powershell -ExecutionPolicy Bypass -File install.ps1 -Scope global -Pack all)
   - Mac/Linux (bash): cd into the cloned dir, then run: bash install.sh global all

3. Delete the temp directory after installation completes.

4. List every command that was installed (show the /command-name for each).

5. Confirm the skills were installed by listing the contents of ~/.claude/skills/ and ~/.claude/commands/.

If git is not available, use the WebFetch tool to download each file individually from:
https://raw.githubusercontent.com/me12free/claude-skills-library/main/<path>
and write them to the correct locations manually.
```
