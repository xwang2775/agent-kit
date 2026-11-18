---
name: status-report
description: Default status-report protocol (默认汇报协议) for long-running or autonomous work such as experiment batches, multi-step jobs, overnight runs. Use when the user says "status report", "report every 30 min", "按汇报协议", "开始汇报", "每30分钟汇报", or hands off a long task and will be away. Defines a 30-min cadence in CST, self-contained reports, numbered decision questions with defaults, and pinned answers until acknowledged.
---

# Default Status-Report Protocol

> English version. 中文版: [SKILL.zh.md](SKILL.zh.md) (same content).

Takes effect as soon as it is received and stays in effect until the user says stop.

## 0. Combine with the user's preferences (read first)
- Language: write reports in the language the user has mainly been using (Chinese headings from SKILL.zh.md if Chinese, the English headings below if English). Keep technical terms, experiment names, and metric names in English.
- Be concise: one sentence per table cell. For long content give the conclusion and key numbers, and point to file paths (`path:line`) for details. Do not paste large logs.
- Time: get it with `TZ=America/Chicago date +%H:%M` and always label it CST. Every ETA is an absolute clock time, never "in about 20 minutes".
- Routine, reversible steps (editing a script, rerunning a failed job, changing log level, etc.) are not decision questions: just do them and list them under "Changes". Only things that affect conclusions, cost noticeable resources, or are irreversible get a Q number.
- The default for every Q must be one clear recommendation with a one-line reason, not just a list of options.
- Emails or messages to other people are saved as drafts only, never sent (they are external actions under Section 4).
- Timer (pick one for your harness; never busy-poll with `sleep`):
  - Claude Code: `CronCreate` (`*/30 * * * *`), or `ScheduleWakeup(delaySeconds=1800)` in `/loop` dynamic mode.
  - T3 Code: same as above, or `schedule_task`.
  - Harnesses without a timer tool (some Codex/Gemini setups): send a full report at every natural checkpoint, and say in the first report that the 30-minute cadence cannot be guaranteed.

## 1. Frequency
- Report every 30 minutes. Use a scheduled wakeup, not idle polling.
- All times are US Central Time, labeled CST.

## 2. Every report is complete
- Reading only the latest report must be enough for the user to handle everything.
- If the user has not replied since their last reply, assume they have read none of the reports in between. The new report must include everything from that whole period.
- Never write "same as above", "see last report", or "unchanged". Write the content out in full.
- Below, "last reply" always means the user's most recent reply; if the user has never replied, count from when this protocol took effect.

## 3. Report format

**Report · HH:MM CST**

Start with one sentence on the overall state: since your last reply, how many are done, how many are running, how many more are planned, and the estimated CST time when everything will be finished.

Then one table covering three parts, top to bottom in this order: finished since your last reply, currently running, planned next. One row per experiment:

| # | Experiment | Status | Result / ETA | Notes |
|---|---|---|---|---|
| 1 | … | ✅ Done | key metrics | |
| 2 | … | ❌ Failed | cause, rerun or not | |
| 3 | … | 🔄 Running | progress, ETA HH:MM CST | |
| 4 | … | ⏳ Planned | expected start and finish (CST) | |

- Finished items (including failures) are ordered by completion time, with results. Unfinished items get an ETA; planned items too.
- Items finished before your last reply are not listed. Items that were running then and are still not done are listed.
- A large batch of identical-config experiments may be merged into one row with done/total.
- The last row of the table gives the estimated time when all planned work will be finished.

Then a section "Changes since your last reply": list every change in that period, most important first.

## 4. Questions that need the user's decision
- Number each question (Q1, Q2, …), list the options, and mark your default choice with its reason.
- If the user has not replied 30 minutes after a question is raised, proceed with the default. Do not stop working.
- The following must not proceed on a default. List them and wait for a reply, while continuing other unaffected work:
  - External actions: push, opening a PR, publishing, sending messages to other people. Messages between the user's own agents are not external and can be sent directly.
  - Deleting data that cannot be recovered.
  - Anything the user has explicitly said they want to decide themselves.

## 5. Report ending
Whenever there are open questions, every report must end with this section:

**Need your reply**
1. Done by default (can be reversed): list **all** decisions made by default since your last reply. For each: number, question, what I did, how to undo it.
2. Still needs your reply: list **all** undecided questions. For each: number, question, options, my default, why I cannot decide it myself.

After the user replies, handled items are removed from the next report; unhandled ones stay.

If there are no questions, end with "No reply needed".

If there are pinned answers from Section 6, put them after this section, as the very last part of the report.

## 6. Pin answers until the user confirms seeing them
When the user sends a message between reports and asks something specific, the agent answers right away, but the user may already have left and missed that answer. So:

- Pin such answers at the very end of **every** following report (after "Need your reply" or "No reply needed") until the user confirms seeing them.
- Counts as confirmed: the user says "seen" / "看到了" (confirms all), or "A1 seen" (confirms that one), or their next message clearly follows up on that answer (a follow-up question, or an instruction based on it). An unrelated message does not count.
- The agent decides which answers to pin. The test: **if the user did not see this answer, would they miss information they wanted, or make a wrong decision because of it?** If yes, pin it.
  - Pin: questions about specific facts or numbers ("is X done", "what was Y's result"); requests for reasons, analysis, judgment, or advice; instructions whose outcome differs from what the user expected (impossible, done differently, a problem found).
  - Do not pin: small talk ("hi", "thanks", "ok"); simple instructions already carried out whose result already shows in the table or "Changes"; answers that are themselves an open question (those go into "Need your reply" under Section 5, not listed twice).

Format:

**You asked earlier (reply "seen" once you've read it)**
- **A1** · HH:MM CST You asked: <one-sentence restatement of the question>
  Answer: <full answer>

- Number each one (A1, A2, …) with the time asked, the original question, and the full answer. Section 2 applies: never write "see above" or "same as before". For long answers, give the full conclusion and key evidence, and file paths for details.
- If things change after the answer was given (new data overturns the conclusion, an ETA moves), edit the pinned item to the latest answer and note "(updated, previously said …)".
- After the user confirms, remove the item from the next report.

## 7. Keep going
- When the plan changes (items added, removed, or reordered), update the table and ETAs and record it under "Changes since your last reply".
- The user's replies override default choices. Immediately undo any overridden decision and explain it in the next report.
