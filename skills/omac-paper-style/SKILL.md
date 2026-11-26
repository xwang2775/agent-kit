---
name: omac-paper-style
description: Academic writing style distilled from "OMAC: A Holistic Optimization Framework for LLM-Based Multi-Agent Collaboration" (Li, Hasson, Ghosh; ICML 2026, arXiv 2505.11765). Use when drafting or refining ML/NLP paper prose (intro, related work, method, experiments, conclusion) in an ICML/ACL register, or when the user says "OMAC style", "用这个 skill 写", "按 OMAC 的写法".
---

# OMAC Paper Style

Distilled from OMAC (arXiv 2505.11765, v5, ICML 2026). The skill captures *how the paper argues*: what each paragraph is for, the order of moves inside it, and the connective vocabulary. Copy the moves, not the sentences.

Section 6 lists where we deliberately depart from OMAC (claim calibration, dashes). Those overrides always win.

## 1. Global voice

- **One idea per paragraph, announced in its first sentence.** The rest of the paragraph elaborates ("Specifically, ...") and then justifies ("The rationale behind this design is to ...").
- **Plain, declarative, present tense** for the method ("The router reads ..."), past tense only for what was run ("We trained five seeds").
- **"We" is the actor.** "We identify", "we propose", "we construct", "we adopt". Never "this paper aims to".
- **Name things once, then reuse the name exactly.** OMAC names its actors (Semantic Initializer, Contrastive Comparator) and its dimensions (Fun-1, Str-2) and never paraphrases them. Define a macro and stick to it.
- **Concrete over generic.** Every claim of a gap points to a specific prior system and the specific thing it does not do ("its approach centers solely on unsupervised optimization of team composition").
- **Signposting is explicit but short.** Forward references to sections, figures and appendices are given in-line: "(Section 3.2)", "More details are given in Appendix C.1."
- **Terminology footnotes** clarify loose words up front (OMAC: "we use the word *optimize* in a colloquial way to signify improvement instead of mathematical guarantee"). Use one when a key word could be over-read (e.g. *forget*, *safe*, *guarantee*).

### Connective vocabulary (in order of frequency in OMAC)
Specifically, · However, · Furthermore, · Subsequently, · Thus, / Consequently, · In contrast, · Notably, · Nevertheless, · Similarly, · Beyond X, · As such, · For instance / For example,

Use *Specifically* to narrow, *However* to pivot to a gap, *In contrast* to separate us from prior work, *Nevertheless* to report a positive result for a weaker variant.

## 2. Section recipes

### 2.1 Abstract (6 to 8 sentences)
1. Capability context (what LLM systems can now do).
2. "Recently, ..." the specific setting.
3. "However, ..." the gap, framed as reliance on hand-crafted / unaddressed decisions.
4. "In this work, we introduce X, a ... designed for ..."
5. "Specifically, we identify/formulate ..." (the conceptual frame).
6. "Building upon ..., we propose ..." (the method), then the extension.
7. "Extensive experiments demonstrate ..." → replace with the calibrated headline number (Section 6).
8. Code/data availability.

### 2.2 Introduction
Move order:
1. **Context**: one or two sentences, cited, on why the area matters.
2. **Recent direction**: "Recently, X has emerged as ..." with example applications in a parenthetical list "(e.g., code generation (A), reasoning (B), decision making (C))".
3. **Gap, split by axis**: "However, ... predominantly relies on ... Regarding <axis 1>, prior studies typically ... Concerning <axis 2>, existing approaches ..." Each axis ends with what is missing.
4. **Closest work, conceded then limited**: "A recent study, Y, represents a promising effort toward ... However, its approach centers solely on ..., rather than ..." Then "Similarly, other recent works such as Z ... thereby only addressing ..."
5. **Our answer**: "To address these challenges, we introduce X, ..." then "Specifically, we identify ..." (the frame), then a compact walk-through of the method in the same order as the method section.
6. **Evidence preview**: "We conduct experiments across ... The results demonstrate that ..." with the key numbers.
7. **Contributions**: "Our key contributions can be summarized as follows:" then 3 or 4 bullets, each starting with a verb (We introduce / We propose / We evaluate). Bullet 1 = problem/frame, bullet 2 = method, bullet 3 = evidence.

### 2.3 Problem definition
- Short lead-in: "We study ... within the context of ... The definitions are as follows:"
- Bold run-in labels, numbered if there are several: "**Definition 1: Agents.**", "**Definition 2: Multi-Step Collaboration.**"
- Each definition: informal sentence → formal object (function signature, tuple) → what each symbol ranges over → one concrete example ("For instance, when solving ...").
- End with a pointer to where the formal object is used ("detailed in Section 3.1").

### 2.4 Method
- **Roadmap paragraph first**: "In this section, we first detail ... Subsequently, we present ... Finally, we describe ..."
- **Bold run-in subcomponent headings** (Initialization of Collection. / Evaluation and Sampling. / Contrastive Reasoning for Optimization.). Each one:
  1. What happens, in pipeline order ("The first step involves ...", "After obtaining ..., we first ...", "Once we get ..., we feed it into ...").
  2. Exact parameters and rules (thresholds, sizes, what is frozen).
  3. **"The rationale behind this design is to ..."** paragraph: why this choice, what failure it prevents. This is the signature OMAC move; every non-obvious design choice gets one.
- **Demonstration example** tied to a figure: "Figure 2 illustrates an example of ... The X first ... Each ... is then ... Consequently, ..."
- **Inference / efficiency subsection** closes the method: what is used at test time, and the cost argument.

### 2.5 Experiments
- Opening run-in paragraphs: **Tasks and Datasets.** (dataset → what it contains → metric, one sentence each), **Baselines.** (grouped by family, with the reason each family is included, and "All baseline approaches retain their original configurations ... to ensure fair comparisons."), **Setup.** (model, temperature, repetitions: "All experiments are repeated N times, and the mean and standard deviation are reported.").
- Push overflow to the appendix explicitly: "Due to the space limitation, we report ... in Appendix X."
- Each results subsection opens with the action: "We first employ X to ...", "We further experiment on ...", "We further conduct experiments to validate ...".
- Results paragraph pattern:
  1. "Table N presents results on ..."
  2. "The results indicate that ..." (main finding, with numbers).
  3. "These results validate ... and confirm ..." (what the finding supports).
  4. "Furthermore, comparisons between A and B highlight ..." (secondary finding).
  5. "Finally, while both A and B ..., our approach ... by ..." (separate from the nearest competitor and say why).
  6. Pointer to more results in the appendix.
- **Ablation**: name the variant ("we introduce an ablation model, X-C, which excludes ..."), say exactly what remains, report, then "The comparison between X-C and X clearly demonstrates ..." and a "Nevertheless, X-C ... It indicates that even ..." sentence for what the reduced variant still achieves.
- **Cost subsection**: state why cost matters ("Since inference cost directly impacts both scalability and ..."), give the finding, point to appendix.

### 2.6 Related work
Each paragraph has a bold run-in heading and the same four moves:
1. **Define the area and its role** (one sentence, cited survey or seminal paper).
2. **Map it**: "Existing research has proposed various X, such as A (cite), B (cite), and C (cite)." or "can be broadly divided into A-based and B-based approaches."
3. **Shared limitation**: "However, these ... are typically ... and remain ..." Name the closest one or two works and their specific limitation.
4. **Positioning sentence**: "In contrast, <ours> ..." states the exact axis on which we differ. Every paragraph ends this way.
Optionally an "Expanded Related Work" appendix repeats the pattern at greater depth.

### 2.7 Conclusion
"In this study, we introduce X, ... We formalize ... Based on them, we develop ... Furthermore, we propose ... Experiments demonstrate ..." One paragraph, no new numbers beyond the headline ones.

## 3. Sentence-level habits
- Parenthetical examples with citations inside: "(e.g., debate (Du et al., 2023))".
- Lists of three in prose: "general reasoning, code generation, and arithmetic reasoning".
- Purpose clauses at sentence end: "..., thereby improving its task-specific performance."
- Pair a claim with its mechanism in the same sentence: "superior efficacy by utilizing supervised signals derived from training data evaluations."
- Quantities are given with the comparison anchor: "improve from 2.9% to 9.6%".

## 4. Figures and tables
- Captions start with what is shown, then how to read it. Tables report mean ± s.d. (or CI) and say how many runs.
- One figure for the workflow, one worked example, one results trend.

## 5. Checklist before finishing a section
- [ ] First sentence of every paragraph states its point.
- [ ] Every non-obvious design choice has a rationale sentence.
- [ ] Every related-work paragraph ends with "In contrast, ours ...".
- [ ] Every result sentence carries a number and its comparison anchor.
- [ ] Names, macros and metric symbols are identical across sections.
- [ ] Overflow is pointed to a specific appendix, not dropped silently.

## 6. Overrides (always apply; these beat OMAC)
- **Calibrate claims to evidence.** OMAC leans on "significant", "extensive", "superior", "comprehensively". Use them only with a test or CI behind them. Prefer the number: "+5.2 points [+4.3, +6.1], 15/15 seeds" over "significantly improves".
- **Report negative and mixed results in the same paragraph** as the positive one, in the same register (OMAC rarely does; ICML/ACL rigor requires it).
- **No em-dashes or spaced hyphens as sentence connectors** in prose. Use a comma, a colon, a semicolon, or a new sentence. En-dashes only for ranges (1--5\%) and names (Neyman--Pearson).
- **No AI-sounding filler**: no "delve", "landscape", "crucial", "pivotal", "seamlessly", "plays a vital role", "in today's world". Concrete detail instead.
- **Do not overstate novelty**: say "to our knowledge" only after a real search, and cite the nearest neighbour even if it weakens the novelty claim.
- **Every citation must be verified** (title, authors, venue, year) against arXiv / ACL Anthology / DBLP / OpenReview before it enters the bib, and the sentence attached to it must match the paper's own abstract.
