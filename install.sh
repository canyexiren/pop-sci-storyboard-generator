#!/usr/bin/env bash
set -e

SKILL_NAME="pop-sci-storyboard-generator"
REPO_URL="${1:-https://github.com/canyexiren/pop-sci-storyboard-generator.git}"

echo "Installing Universal Agent Skill: $SKILL_NAME ..."

TMP_DIR=$(mktemp -d)
git clone --depth 1 "$REPO_URL" "$TMP_DIR" >/dev/null 2>&1 || {
  echo "Error: Could not clone $REPO_URL. Make sure the repository URL is correct and public."
  exit 1
}

# 1. Install for Claude Code & Universal Agent Skills (~/.claude/skills & ~/.agents/skills)
mkdir -p "$HOME/.claude/skills/$SKILL_NAME"
cp "$TMP_DIR/SKILL.md" "$HOME/.claude/skills/$SKILL_NAME/SKILL.md"

mkdir -p "$HOME/.agents/skills/$SKILL_NAME"
cp "$TMP_DIR/SKILL.md" "$HOME/.agents/skills/$SKILL_NAME/SKILL.md"

# 2. Install for current workspace (Cursor, Claude Command, Cline, Windsurf) if inside a project
if [ -d ".git" ]; then
  mkdir -p ".cursor/rules"
  cp "$TMP_DIR/.cursor/rules/$SKILL_NAME.mdc" ".cursor/rules/$SKILL_NAME.mdc"
  mkdir -p ".claude/skills/$SKILL_NAME"
  cp "$TMP_DIR/SKILL.md" ".claude/skills/$SKILL_NAME/SKILL.md"
  echo "Installed workspace rules into .cursor/rules/ and .claude/skills/"
fi

rm -rf "$TMP_DIR"
echo "✅ Successfully installed $SKILL_NAME for your AI Agents!"
