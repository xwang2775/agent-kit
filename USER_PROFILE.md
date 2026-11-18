# User Profile — Xinyu Jessica Wang (王昕雨)

> Global personal profile, loaded by every agent at launch (Claude Code / T3 Code / Codex / Gemini).
> **Canonical path: `~/.agents/USER_PROFILE.md`.** Other paths (`~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md`) only point here. Always edit this file, never the pointers.

## Who I am
- 2nd-year CS PhD student at UW–Madison (started Fall 2025, expected graduation May 2029) (xwang2775@wisc.edu). Advisors: Prof. Bilge Mutlu, Prof. Robert Nowak. Supported by Honda Research Institute USA.
- Research: Agentic AI + HCI — interactive agent systems, human–AI collaboration, LLM agent evaluation/failure analysis, formal verification + LLM planning, AI for education.
- Past work: VeriPlan (CHI '25), LearnMate (CHI EA '25), long-horizon agent failure analysis (COLM '26 submission), Agent-HLE.
- Personal website repo: `~/Documents/Personal_Info/personal_website/xwang2775.github.io` (CV: `Xinyu_CV.pdf` there).
- Typical work: paper writing (LaTeX, figures, rebuttals), user-study setup, Python/data analysis, slides, job/internship applications.

## Communication
- I write in a mix of Chinese and English. Reply in the language I mainly used; keep technical terms in English.
- Be concise and direct. Give a recommendation instead of a long list of options.
- Don't ask for confirmation on routine, reversible steps — just do it and tell me what you did.

## Writing for me (emails, referrals, statements, papers)
- Must NOT sound AI-written: concrete details and specifics over generic praise/buzzwords.
- Avoid em-dashes / dashes (—, -) as sentence connectors in prose I'll send out.
- Don't restate what's already obvious from my resume; add new information.
- When inventing context (e.g., story for a referral), stay consistent with my real CV and real timelines.

## Working environment
- macOS, zsh. Agents run with permissions bypassed. Python projects: prefer a local venv per repo.
- Explain how to run/reproduce things myself when you set something up (short "how to start" notes).

## Skills (in `~/.agents/skills/`, synced via GitHub repo `xwang2775/agent-kit`)
- `status-report`: 默认汇报协议. When I say "按汇报协议" / "开始汇报" / "status report", or hand off a long task, read `~/.agents/skills/status-report/SKILL.md` and follow it until I say stop.

## Self-update rule (for all agents)
When I give feedback that is **important and reusable across sessions** (a correction, a stated preference, or something I confirm works well), update this file:
1. Edit `~/.agents/USER_PROFILE.md` directly: put it in the right section above, or in the Feedback log below if it doesn't fit one.
2. Keep it short (one line each), dated (YYYY-MM-DD), dedupe/merge with existing lines; delete lines that become wrong.
3. Don't record one-off task details, project-specific facts (those go in the project's own memory/CLAUDE.md/AGENTS.md), or secrets.
4. Tell me in one line what you added/changed.
5. `~/.agents` is my private git repo: after editing, `git -C ~/.agents commit -am "<what changed>" && git -C ~/.agents push` (pushing this repo is pre-approved).

## Feedback log
- 2026-11-05: Created this profile; agents should keep it updated from my feedback.
- 2026-11-17: Corrected: 2nd-year PhD (not 1st), graduating 2029-05.
