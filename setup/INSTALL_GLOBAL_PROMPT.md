# Install Prompt — Global (paste this into Claude Code)

> Paste the block below into Claude Code to install everything globally.
> Claude will clone the repo, run the install, and confirm what was set up.
> Replace `YOUR_USERNAME` with the actual GitHub username before pasting.

---

```
I want to install the claude-skills-library globally so it applies to all my projects.

Do the following steps:

1. Clone https://github.com/YOUR_USERNAME/claude-skills-library into a temp directory:
   - Windows: C:\Users\<your-username>\AppData\Local\Temp\claude-skills-install
   - Mac/Linux: /tmp/claude-skills-install

2. Run the installer:
   - Windows (PowerShell): cd into the cloned dir, then run: .\install.ps1 -Scope global -Pack all
   - Mac/Linux (bash): cd into the cloned dir, then run: bash install.sh global all

3. Delete the temp directory after installation completes.

4. List every command that was installed (show the /command-name for each).

5. Confirm the skills were installed by listing the contents of ~/.claude/skills/ and ~/.claude/commands/.

If git is not available, use the WebFetch tool to download each file individually from:
https://raw.githubusercontent.com/YOUR_USERNAME/claude-skills-library/main/<path>
and write them to the correct locations manually.
```
