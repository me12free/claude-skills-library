#!/usr/bin/env bash
# claude-skills-library installer — Linux and macOS
#
# Usage:
#   bash install.sh                      → install everything globally
#   bash install.sh global design        → design skills only, global
#   bash install.sh global engineering   → engineering commands only, global
#   bash install.sh project all          → install into current project (.claude/)
#   bash install.sh project design       → design skills into current project only
#
# SECURITY: only run this from a clone of the official repo.
# Verify the URL before cloning: https://github.com/me12free/claude-skills-library

set -euo pipefail

# ── helpers ──────────────────────────────────────────────────────────────────

usage() {
  echo "Usage: bash install.sh [global|project] [all|design|engineering]"
  echo "  Default: bash install.sh global all"
  exit 1
}

count_files() {
  find "$1" -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' '
}

# ── resolve repo root ─────────────────────────────────────────────────────────

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Sanity-check that we're running from the actual repo (not some random directory)
if [ ! -d "$REPO_DIR/design/skills" ] || [ ! -d "$REPO_DIR/engineering/commands" ]; then
  echo "ERROR: Could not find design/skills or engineering/commands under $REPO_DIR"
  echo "Make sure you run this script from the root of the claude-skills-library repo."
  exit 1
fi

# ── parse arguments ───────────────────────────────────────────────────────────

SCOPE="${1:-global}"
PACK="${2:-all}"

case "$SCOPE" in
  global|project) ;;
  *) echo "ERROR: Invalid scope '$SCOPE'. Use 'global' or 'project'."; usage ;;
esac

case "$PACK" in
  all|design|engineering) ;;
  *) echo "ERROR: Invalid pack '$PACK'. Use 'all', 'design', or 'engineering'."; usage ;;
esac

# ── resolve target directories ────────────────────────────────────────────────

if [ "$SCOPE" = "global" ]; then
  SKILLS_DIR="$HOME/.claude/skills"
  COMMANDS_DIR="$HOME/.claude/commands"
  SCOPE_LABEL="global (~/.claude/)"
else
  # Project-scope: must be run from the project root
  SKILLS_DIR="$(pwd)/.claude/skills"
  COMMANDS_DIR="$(pwd)/.claude/commands"
  SCOPE_LABEL="project ($(pwd)/.claude/)"
fi

# ── install ───────────────────────────────────────────────────────────────────

echo ""
echo "Claude Skills Library — Installer"
echo "  Scope : $SCOPE_LABEL"
echo "  Pack  : $PACK"
echo ""

mkdir -p "$SKILLS_DIR" "$COMMANDS_DIR"

if [ "$PACK" = "all" ] || [ "$PACK" = "design" ]; then
  echo "Installing design skills..."
  for skill_dir in "$REPO_DIR/design/skills"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name=$(basename "$skill_dir")
    mkdir -p "$SKILLS_DIR/$skill_name"
    cp "$skill_dir/SKILL.md" "$SKILLS_DIR/$skill_name/SKILL.md"
    echo "  + skill: $skill_name"
  done
  for cmd in "$REPO_DIR/design/commands/"*.md; do
    [ -f "$cmd" ] || continue
    cmd_name=$(basename "$cmd")
    cp "$cmd" "$COMMANDS_DIR/$cmd_name"
    echo "  + command: /${cmd_name%.md}"
  done
fi

if [ "$PACK" = "all" ] || [ "$PACK" = "engineering" ]; then
  echo ""
  echo "Installing engineering commands..."
  for cmd in "$REPO_DIR/engineering/commands/"*.md; do
    [ -f "$cmd" ] || continue
    cmd_name=$(basename "$cmd")
    cp "$cmd" "$COMMANDS_DIR/$cmd_name"
    echo "  + command: /${cmd_name%.md}"
  done
fi

TOTAL=$(count_files "$COMMANDS_DIR")

echo ""
echo "Done. $TOTAL commands installed to $COMMANDS_DIR"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code (or open a new session)"
echo "  2. Type /design-flow to start a design session"
echo "  3. Type /pr-review <branch> to review a PR"
echo ""
echo "See README.md for the full command reference."
