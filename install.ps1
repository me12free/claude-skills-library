# claude-skills-library installer for Windows (PowerShell)
#
# Usage:
#   .\install.ps1                                    # install everything globally
#   .\install.ps1 -Scope global -Pack design         # design skills only, global
#   .\install.ps1 -Scope global -Pack engineering    # engineering commands only, global
#   .\install.ps1 -Scope project -Pack all           # install into current project (.claude/)
#   .\install.ps1 -Scope project -Pack design        # design skills into current project only
#
# If blocked by execution policy, run:
#   powershell -ExecutionPolicy Bypass -File install.ps1
#
# SECURITY: only run this from a clone of the official repo.
# Verify the URL before cloning: https://github.com/YOUR_USERNAME/claude-skills-library

param(
  [ValidateSet("global","project")]
  [string]$Scope = "global",

  [ValidateSet("all","design","engineering")]
  [string]$Pack = "all"
)

$ErrorActionPreference = "Stop"

# ── resolve repo root ─────────────────────────────────────────────────────────

$repoDir = $PSScriptRoot

if (-not (Test-Path "$repoDir\design\skills") -or -not (Test-Path "$repoDir\engineering\commands")) {
  Write-Error "Could not find design\skills or engineering\commands under $repoDir. Run this script from the root of the claude-skills-library repo."
  exit 1
}

# ── resolve target directories ────────────────────────────────────────────────

if ($Scope -eq "global") {
  $skillsDir   = "$env:USERPROFILE\.claude\skills"
  $commandsDir = "$env:USERPROFILE\.claude\commands"
  $scopeLabel  = "global (~/.claude/)"
} else {
  $skillsDir   = "$((Get-Location).Path)\.claude\skills"
  $commandsDir = "$((Get-Location).Path)\.claude\commands"
  $scopeLabel  = "project ($((Get-Location).Path)\.claude\)"
}

# ── install ───────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "Claude Skills Library -- Installer"
Write-Host "  Scope : $scopeLabel"
Write-Host "  Pack  : $Pack"
Write-Host ""

New-Item -ItemType Directory -Force -Path $skillsDir   | Out-Null
New-Item -ItemType Directory -Force -Path $commandsDir | Out-Null

if ($Pack -eq "all" -or $Pack -eq "design") {
  Write-Host "Installing design skills..."
  Get-ChildItem "$repoDir\design\skills" -Directory | ForEach-Object {
    $dst = "$skillsDir\$($_.Name)"
    New-Item -ItemType Directory -Force -Path $dst | Out-Null
    Copy-Item "$($_.FullName)\SKILL.md" "$dst\SKILL.md" -Force
    Write-Host "  + skill: $($_.Name)"
  }
  Get-ChildItem "$repoDir\design\commands" -Filter "*.md" | ForEach-Object {
    Copy-Item $_.FullName "$commandsDir\$($_.Name)" -Force
    $cmdName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    Write-Host "  + command: /$cmdName"
  }
}

if ($Pack -eq "all" -or $Pack -eq "engineering") {
  Write-Host ""
  Write-Host "Installing engineering commands..."
  Get-ChildItem "$repoDir\engineering\commands" -Filter "*.md" | ForEach-Object {
    Copy-Item $_.FullName "$commandsDir\$($_.Name)" -Force
    $cmdName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    Write-Host "  + command: /$cmdName"
  }
}

$total = (Get-ChildItem $commandsDir -Filter "*.md").Count

Write-Host ""
Write-Host "Done. $total commands installed to $commandsDir"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Restart Claude Code (or open a new session)"
Write-Host "  2. Type /design-flow to start a design session"
Write-Host "  3. Type /pr-review <branch> to review a PR"
Write-Host ""
Write-Host "See README.md for the full command reference."
