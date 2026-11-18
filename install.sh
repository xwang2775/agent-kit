#!/usr/bin/env bash
# Wire ~/.agents (this repo) into Claude Code, Codex, and Gemini. Idempotent.
# Usage: git clone https://github.com/xwang2775/agent-kit.git ~/.agents && ~/.agents/install.sh
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
[ "$REPO" = "$HOME/.agents" ] || echo "warning: repo is at $REPO, profile pointers expect ~/.agents"
TS="$(date +%Y%m%d-%H%M%S)"

backup() {  # move a real file/dir out of the way (symlinks are just replaced)
  if [ -L "$1" ]; then rm "$1"
  elif [ -e "$1" ]; then mv "$1" "$1.bak.$TS"; echo "backed up $1 -> $1.bak.$TS"; fi
}

link() {  # link <target> <linkpath>
  mkdir -p "$(dirname "$2")"
  if [ -L "$2" ] && [ "$(readlink "$2")" = "$1" ]; then return; fi
  backup "$2"; ln -s "$1" "$2"; echo "linked $2 -> $1"
}

# 1. Profile: Claude imports it; Codex/Gemini read a symlink.
mkdir -p "$HOME/.claude"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"
if ! grep -qs '@~/.agents/USER_PROFILE.md' "$CLAUDE_MD"; then
  backup "$CLAUDE_MD"
  printf '# Global instructions\nPersonal profile (canonical, edit there, not here):\n@~/.agents/USER_PROFILE.md\n' > "$CLAUDE_MD"
  echo "wrote $CLAUDE_MD"
fi
link "$REPO/USER_PROFILE.md" "$HOME/.codex/AGENTS.md"
link "$REPO/USER_PROFILE.md" "$HOME/.gemini/GEMINI.md"

# 2. Skills: Codex reads ~/.agents/skills natively; Claude needs per-skill links.
for s in "$REPO"/skills/*/; do
  name="$(basename "$s")"
  link "${s%/}" "$HOME/.claude/skills/$name"
  link "${s%/}" "$HOME/.codex/skills/$name"
done

echo "done. Skills: $(ls "$REPO/skills" | tr '\n' ' ')"
