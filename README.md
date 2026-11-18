# agent-kit

Xinyu's portable agent setup: personal profile + skills, shared by Claude Code, T3 Code, Codex, and Gemini.

## New machine

```bash
git clone https://github.com/xwang2775/agent-kit.git ~/.agents
~/.agents/install.sh
```

The script is idempotent and backs up any existing real file as `*.bak.<timestamp>` before replacing it.

What it wires up:

| Path | Points to |
|---|---|
| `~/.claude/CLAUDE.md` | small file that imports `@~/.agents/USER_PROFILE.md` |
| `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md` | symlink to `USER_PROFILE.md` |
| `~/.claude/skills/<name>`, `~/.codex/skills/<name>` | symlink to `skills/<name>` |

## Contents

- `USER_PROFILE.md`: who I am, communication and writing preferences, feedback log. Agents edit this file directly (self-update rule inside).
- `skills/status-report/`: 默认汇报协议 for long-running work (30 min reports in CST, numbered Qs with defaults, pinned answers). Trigger with "按汇报协议" or "status report". `PROTOCOL.zh.md` is the original text; `SKILL.md` adds my preferences and per-harness timer notes.

## Updating

Edit in `~/.agents`, then `git -C ~/.agents commit -am "..." && git -C ~/.agents push`. On other machines: `git -C ~/.agents pull` (rerun `install.sh` only when a new skill is added).

To add a skill: create `skills/<name>/SKILL.md` with `name` / `description` frontmatter, rerun `install.sh`.
