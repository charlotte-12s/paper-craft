#!/usr/bin/env bash
set -euo pipefail

REPO="paper-craft"
SKILLS=("paper-launch" "paper-search" "paper-idea" "paper-plan" "paper-data" "paper-env" "paper-train" "paper-story" "paper-write" "paper-review" "paper-rebuttal" "paper-audit")
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[paper-craft]${NC} $*"; }
warn()  { echo -e "${YELLOW}[paper-craft]${NC} $*"; }
error() { echo -e "${RED}[paper-craft]${NC} $*"; exit 1; }

# Parse arguments
BUNDLE="full"
TARGET_DIR="."
TOOLS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --bundle)
      BUNDLE="$2"
      shift 2
      ;;
    --target)
      TARGET_DIR="$2"
      shift 2
      ;;
    --tool)
      TOOLS+=("$2")
      shift 2
      ;;
    --help|-h)
      echo "Usage: paper-craft [options]"
      echo ""
      echo "Options:"
      echo "  --bundle full|search-only|write-only|launch-only   Skill bundle (default: full)"
      echo "  --target <dir>                                      Target directory (default: .)"
      echo "  --tool claude-code|cursor|codex|gemini|copilot|windsurf  Target tool (auto-detected)"
      echo "  --help                                              Show this help"
      exit 0
      ;;
    *)
      error "Unknown option: $1. Use --help for usage."
      ;;
  esac
done

cd "$TARGET_DIR" || error "Target directory not found: $TARGET_DIR"

# Select skills based on bundle
case "$BUNDLE" in
  full)          SELECTED_SKILLS=("${SKILLS[@]}") ;;
  search-only)   SELECTED_SKILLS=("paper-search") ;;
  write-only)    SELECTED_SKILLS=("paper-story" "paper-write" "paper-review") ;;
  launch-only)   SELECTED_SKILLS=("paper-launch") ;;
  *)             error "Unknown bundle: $BUNDLE. Use: full, search-only, write-only, launch-only" ;;
esac

# Auto-detect tools if not specified
if [[ ${#TOOLS[@]} -eq 0 ]]; then
  [[ -d ".claude" ]] && TOOLS+=("claude-code")
  [[ -d ".cursor" ]] && TOOLS+=("cursor")
  [[ -f "AGENTS.md" ]] && TOOLS+=("codex")
  [[ -f "GEMINI.md" ]] && TOOLS+=("gemini")
  [[ -d ".github" ]] && TOOLS+=("copilot")
  [[ -f ".windsurfrules" ]] && TOOLS+=("windsurf")

  if [[ ${#TOOLS[@]} -eq 0 ]]; then
    TOOLS+=("claude-code")
    info "No tool detected, defaulting to Claude Code"
  else
    info "Detected tools: ${TOOLS[*]}"
  fi
fi

# Install for Claude Code
install_claude_code() {
  info "Installing for Claude Code..."
  mkdir -p .claude/skills

  for skill in "${SELECTED_SKILLS[@]}"; do
    cp -r "$SCRIPT_DIR/skills/$skill" ".claude/skills/"
    info "  Installed skill: $skill"
  done

  # Copy conference profiles if paper-search or paper-launch is included
  if [[ " ${SELECTED_SKILLS[@]} " =~ " paper-search " ]] || [[ " ${SELECTED_SKILLS[@]} " =~ " paper-launch " ]]; then
    mkdir -p .claude/skills/paper-search/references/conferences
    cp -r "$SCRIPT_DIR/references/conferences/"* ".claude/skills/paper-search/references/conferences/" 2>/dev/null || true
    info "  Installed conference profiles"
  fi

  if [[ -f .claude/CLAUDE.md ]]; then
    echo "" >> .claude/CLAUDE.md
    echo "# --- PaperCraft Rules (appended by paper-craft) ---" >> .claude/CLAUDE.md
    cat "$SCRIPT_DIR/CLAUDE.md" >> .claude/CLAUDE.md
    info "  Appended rules to existing CLAUDE.md"
  else
    mkdir -p .claude
    cp "$SCRIPT_DIR/CLAUDE.md" .claude/CLAUDE.md
    info "  Created .claude/CLAUDE.md"
  fi
}

# Install for Cursor
install_cursor() {
  info "Installing for Cursor..."
  mkdir -p .cursor/rules

  for skill in "${SELECTED_SKILLS[@]}"; do
    cp "$SCRIPT_DIR/skills/$skill/SKILL.md" ".cursor/rules/$skill.mdc"
    info "  Installed rule: $skill.mdc"
  done

  cat "$SCRIPT_DIR/CLAUDE.md" > .cursor/rules/paper-craft-rules.mdc
  info "  Installed rules: paper-craft-rules.mdc"
}

# Install for Codex CLI
install_codex() {
  info "Installing for Codex CLI..."

  {
    cat "$SCRIPT_DIR/CLAUDE.md"
    echo ""
    echo "## Skill Instructions"
    for skill in "${SELECTED_SKILLS[@]}"; do
      echo ""
      cat "$SCRIPT_DIR/skills/$skill/SKILL.md"
    done
  } >> AGENTS.md

  info "  Appended to AGENTS.md"
}

# Install for Gemini CLI
install_gemini() {
  info "Installing for Gemini CLI..."

  {
    cat "$SCRIPT_DIR/CLAUDE.md"
    echo ""
    echo "## Skill Instructions"
    for skill in "${SELECTED_SKILLS[@]}"; do
      echo ""
      cat "$SCRIPT_DIR/skills/$skill/SKILL.md"
    done
  } >> GEMINI.md

  info "  Appended to GEMINI.md"
}

# Install for GitHub Copilot
install_copilot() {
  info "Installing for GitHub Copilot..."
  mkdir -p .github

  {
    cat "$SCRIPT_DIR/CLAUDE.md"
    echo ""
    echo "## Skill Instructions"
    for skill in "${SELECTED_SKILLS[@]}"; do
      echo ""
      cat "$SCRIPT_DIR/skills/$skill/SKILL.md"
    done
  } >> .github/copilot-instructions.md

  info "  Appended to .github/copilot-instructions.md"
}

# Install for Windsurf
install_windsurf() {
  info "Installing for Windsurf..."

  {
    cat "$SCRIPT_DIR/CLAUDE.md"
    echo ""
    echo "## Skill Instructions"
    for skill in "${SELECTED_SKILLS[@]}"; do
      echo ""
      cat "$SCRIPT_DIR/skills/$skill/SKILL.md"
    done
  } >> .windsurfrules

  info "  Appended to .windsurfrules"
}

# Execute installations
for tool in "${TOOLS[@]}"; do
  case $tool in
    claude-code) install_claude_code ;;
    cursor)      install_cursor ;;
    codex)       install_codex ;;
    gemini)      install_gemini ;;
    copilot)     install_copilot ;;
    windsurf)    install_windsurf ;;
    *)           warn "Unknown tool: $tool, skipping" ;;
  esac
done

info "Installation complete!"
info "Installed ${#SELECTED_SKILLS[@]} skill(s) for ${#TOOLS[@]} tool(s)"
info "Skills: ${SELECTED_SKILLS[*]}"
info "Tools: ${TOOLS[*]}"
