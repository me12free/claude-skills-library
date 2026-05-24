# Security Policy

## Supply Chain Warning

This library installs files into your Claude Code configuration directories (`~/.claude/` or `.claude/`). Files placed there are read and executed as instructions by Claude Code in every session.

**Always verify you are cloning from the correct, official repository URL before running the installer.**

A malicious fork with a similar name could install instructions that alter Claude's behaviour in harmful ways — leaking context, bypassing security defaults, or producing insecure code.

Mitigations:
- Clone only from the URL you personally trust and have verified
- Review the contents of `design/commands/`, `engineering/commands/`, and `design/skills/` before installing — they are plain markdown files, fully readable
- After install, run `ls ~/.claude/commands/` and `ls ~/.claude/skills/` to confirm only expected files are present
- If you installed from an unverified source, remove the files and reinstall from the correct repo

---

## What This Repo Does and Does Not Do

**Does:**
- Copy `.md` instruction files into `~/.claude/commands/` and `~/.claude/skills/`
- Those files are read-only text — they contain no executable code, no network calls, and no scripts

**Does not:**
- Execute any code at install time beyond file copies
- Make network requests (the install scripts are pure file operations)
- Modify any system files, shell config, or environment variables
- Store any credentials or secrets

---

## Reporting a Security Issue

If you find a prompt injection, instruction manipulation, or any other security concern in this library, open a GitHub issue marked `[SECURITY]`.

Do not include exploit details in public issues — describe the category of issue and we will respond with a private channel to discuss details.
