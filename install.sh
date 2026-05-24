#!/usr/bin/env bash
# claude-skills-library installer
# Usage:
#   bash install.sh                      → install everything globally
#   bash install.sh global design        → design skills only, global
#   bash install.sh global engineering   → engineering commands only, global
#   bash install.sh project all          → install into current project (.claude/)
#   bash install.sh project design       → design skills into current project only

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCOPE="${1:-global}"
PACK="${2:-all}"

if [ "$SCOPE" = "global" ]; then
  SKILLS_DIR="$HOME/.claude/skills"
  COMMANDS_DIR="$HOME/.claude/commands"
  SCOPE_LABEL="global (~/.claude/)"
else
  SKILLS_DIR=".claude/skills"
  COMMANDS_DIR=".claude/commands"
  SCOPE_LABEL="project (.claude/)"
fi

echo ""
echo "Claude Skills Library — Installer"
echo "  Scope : $SCOPE_LABEL"
echo "  Pack  : $PACK"
echo ""

mkdir -p "$SKILLS_DIR" "$COMMANDS_DIR"

if [ "$PACK" = "all" ] || [ "$PACK" = "design" ]; then
  echo "Installing design skills..."
  for skill_dir in "$REPO_DIR/design/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    mkdir -p "$SKILLS_DIR/$skill_name"
    cp "$skill_dir/SKILL.md" "$SKILLS_DIR/$skill_name/SKILL.md"
    echo "  + skill: $skill_name"
  done
  for cmd in "$REPO_DIR/design/commands/"*.md; do
    cmd_name=$(basename "$cmd")
    cp "$cmd" "$COMMANDS_DIR/$cmd_name"
    echo "  + command: /${cmd_name%.md}"
  done
fi

if [ "$PACK" = "all" ] || [ "$PACK" = "engineering" ]; then
  echo ""
  echo "Installing engineering commands..."
  for cmd in "$REPO_DIR/engineering/commands/"*.md; do
    cmd_name=$(basename "$cmd")
    cp "$cmd" "$COMMANDS_DIR/$cmd_name"
    echo "  + command: /${cmd_name%.md}"
  done
fi

TOTAL=$(ls "$COMMANDS_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "Done. $TOTAL commands installed to $COMMANDS_DIR"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code (or open a new session)"
echo "  2. Type /design-flow to start a design session"
echo "  3. Type /pr-review <branch> to review a PR"
echo ""
echo "See README.md for the full command reference."
