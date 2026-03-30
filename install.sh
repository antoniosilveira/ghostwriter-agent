#!/bin/bash
# install.sh — Ghostwriter Agent installer for Claude Code
#
# What this does:
#   1. Copies all 8 skills to ~/.claude/skills/
#   2. Appends the Ghostwriter routing section to ~/.claude/CLAUDE.md
#
# What this does NOT do:
#   - It does not install Claude Code (install separately: https://claude.ai/code)
#   - It does not modify any files outside ~/.claude/
#   - It does not send any data anywhere
#   - It does not overwrite your existing CLAUDE.md (only appends)
#
# After running: edit ~/.claude/VOICE.md, USER.md, SOUL.md with your own content.

set -e

CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Ghostwriter Agent for Claude Code..."
echo ""

# Create ~/.claude if it doesn't exist
mkdir -p "$SKILLS_DIR"

# Copy all 8 skills
echo "Copying skills to $SKILLS_DIR..."
for skill in review reply outreach announce post blog prep feedback; do
  src="$SCRIPT_DIR/claude-code/skills/$skill"
  dst="$SKILLS_DIR/$skill"
  if [ -d "$src" ]; then
    cp -r "$src" "$dst"
    echo "  ✓ /$skill"
  else
    echo "  ✗ Missing: $src" >&2
  fi
done

# Copy identity sample files (only if they don't already exist)
echo ""
echo "Copying sample identity files (will not overwrite existing files)..."
for f in VOICE.md USER.md SOUL.md PRINCIPLES.md COMPANY.md; do
  src="$SCRIPT_DIR/sample/$f"
  dst="$CLAUDE_DIR/$f"
  if [ ! -f "$dst" ]; then
    cp "$src" "$dst"
    echo "  ✓ $f (edit this file with your own content)"
  else
    echo "  – $f already exists, skipping"
  fi
done

# Append routing section to CLAUDE.md if not already present
echo ""
if [ -f "$CLAUDE_MD" ] && grep -q "Ghostwriter Agent" "$CLAUDE_MD"; then
  echo "CLAUDE.md already contains Ghostwriter routing — skipping."
else
  echo "Appending Ghostwriter routing to $CLAUDE_MD..."
  cat >> "$CLAUDE_MD" << 'ROUTING'

# Ghostwriter Agent

Read VOICE.md, USER.md, and SOUL.md for context on who you are writing for.

**The one rule: never send anything. Only draft.**

## Slash Command Routing

| Command | Purpose |
|---------|---------|
| /review | Grammar, clarity, typo fix |
| /reply | Draft a reply (two versions) |
| /outreach | Cold/warm outreach |
| /announce | Org/team announcement |
| /post | Short LinkedIn/social post |
| /blog | Long-form article draft |
| /prep | Pre-meeting brief |
| /feedback | Strategic tone review |

## Voice Rules (all commands)
- No em dashes. Ever.
- No AI vocabulary: ensure, leverage, unlock, seamless, robust, foster, empower
- No filler openers
- Short sentences. Direct. Sound like the user, not an assistant.
ROUTING
  echo "  ✓ CLAUDE.md updated"
fi

echo ""
echo "Done! Next steps:"
echo "  1. Edit ~/.claude/VOICE.md with your real writing examples"
echo "  2. Edit ~/.claude/USER.md with your role and context"
echo "  3. Edit ~/.claude/SOUL.md with your behavior rules"
echo "  4. Start a Claude Code session and try: /review [some text]"
echo ""
echo "See claude-code/README.md for the full setup guide."
