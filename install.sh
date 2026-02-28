#!/usr/bin/env bash
set -euo pipefail

# Install codingskills into the current project.
# Copies skills/ to .agents/skills/ and symlinks .claude/skills/ for Claude Code.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
AGENTS_DIR=".agents/skills"
CLAUDE_DIR=".claude/skills"

SKILLS=(
  yagni
  kiss
  dry
  solid
  separation-of-concerns
  law-of-demeter
  boy-scout-rule
  convention-over-configuration
  detect-stack
)

echo "Installing coding-principles skills..."
echo ""

# Copy each skill directory
for skill in "${SKILLS[@]}"; do
  src="${SCRIPT_DIR}/skills/${skill}"
  dest="${AGENTS_DIR}/${skill}"

  if [ ! -d "${src}" ]; then
    echo "  ! skills/${skill} not found, skipping"
    continue
  fi

  mkdir -p "${dest}"
  cp -r "${src}/"* "${dest}/"
  echo "  + ${skill}"

  # Create .claude/skills/ symlink
  mkdir -p "${CLAUDE_DIR}"
  link="${CLAUDE_DIR}/${skill}"
  if [ -L "${link}" ]; then
    rm "${link}"
  elif [ -d "${link}" ]; then
    rm -rf "${link}"
  fi
  ln -s "../../${AGENTS_DIR}/${skill}" "${link}"
done

echo ""
echo "Installed to:"
echo "  .agents/skills/    (actual files)"
echo "  .claude/skills/    (symlinks)"
echo ""
echo "Next: ask your agent to run detect-stack to generate .agents/stack-context.md"
