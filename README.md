# agent-kit

[English](#english) | [中文](#中文)

## English

My portable agent setup: a personal profile plus skills, shared by Claude Code, T3 Code, Codex, and Gemini.

### Install on a new machine

```bash
git clone https://github.com/xwang2775/agent-kit.git ~/.agents
~/.agents/install.sh
```

The script is idempotent. Any existing real file it would replace is backed up as `*.bak.<timestamp>` first.

| Path | Points to |
|---|---|
| `~/.claude/CLAUDE.md` | small file that imports `@~/.agents/USER_PROFILE.md` |
| `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md` | symlink to `USER_PROFILE.md` |
| `~/.claude/skills/<name>`, `~/.codex/skills/<name>` | symlink to `skills/<name>` |

### Contents

- `USER_PROFILE.md`: who I am, communication and writing preferences, feedback log. Agents update it directly (see the self-update rule inside).
- `skills/status-report/`: default status-report protocol for long-running work: reports every 30 min in CST, each report self-contained, numbered questions with defaults, pinned answers until acknowledged. Trigger with "status report" or "按汇报协议". `SKILL.md` is English (what agents load), `SKILL.zh.md` is the Chinese version.

### Updating

Edit in `~/.agents`, then `git -C ~/.agents commit -am "..." && git -C ~/.agents push`. On other machines run `git -C ~/.agents pull`; rerun `install.sh` only after adding a new skill.

To add a skill: create `skills/<name>/SKILL.md` with `name` / `description` frontmatter, then rerun `install.sh`.

### Using it yourself

Fork the repo, replace `USER_PROFILE.md` with your own profile, and keep or drop the skills.

## 中文

我的跨电脑 agent 配置：个人 profile 加若干 skill，Claude Code、T3 Code、Codex、Gemini 共用。

### 新电脑安装

```bash
git clone https://github.com/xwang2775/agent-kit.git ~/.agents
~/.agents/install.sh
```

脚本可重复运行。要替换的已有文件会先备份成 `*.bak.<时间戳>`。

| 路径 | 指向 |
|---|---|
| `~/.claude/CLAUDE.md` | 一个小文件，import `@~/.agents/USER_PROFILE.md` |
| `~/.codex/AGENTS.md`、`~/.gemini/GEMINI.md` | 软链接到 `USER_PROFILE.md` |
| `~/.claude/skills/<name>`、`~/.codex/skills/<name>` | 软链接到 `skills/<name>` |

### 内容

- `USER_PROFILE.md`：我的背景、沟通和写作偏好、反馈记录。agent 会按里面的 self-update rule 直接更新。
- `skills/status-report/`：长任务的默认汇报协议：每 30 分钟按 CST 汇报一次，每份汇报自成一体，待决问题编号并给默认选项，答复钉住直到确认看到。说"按汇报协议"或"status report"触发。`SKILL.md` 是英文版（agent 实际加载），`SKILL.zh.md` 是中文版。

### 更新

在 `~/.agents` 里改，然后 `git -C ~/.agents commit -am "..." && git -C ~/.agents push`。其他电脑上 `git -C ~/.agents pull`；只有新增 skill 后才需要重跑 `install.sh`。

新增 skill：建 `skills/<name>/SKILL.md`，写好 `name` / `description` frontmatter，重跑 `install.sh`。

### 自己用

Fork 这个 repo，把 `USER_PROFILE.md` 换成你自己的，skill 按需保留。
