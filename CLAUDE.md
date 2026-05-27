# PaperCraft — Research Rules

These rules override default AI behaviors when doing CS research. The goal: AI should never forget project conventions, waste compute on wrong experiments, or submit papers that ignore conference taste.

## The 17 Research Rules

### Rule 1: Novelty First
**Do**: Confirm innovation points before starting any work.
**Don't**: Do incremental stitching and hope it's novel enough.
**If you catch yourself** implementing before confirming novelty → Stop and search for prior work first.

### Rule 2: Match Conference Taste
**Do**: Adapt research style to target conference preferences.
**Don't**: Use NeurIPS style for an AAAI submission.
**If you catch yourself** writing without checking conference taste → Stop and load the conference profile.

### Rule 3: Search Before Propose
**Do**: Search existing work before proposing any idea. Do novelty checking.
**Don't**: Propose ideas in a vacuum, risking duplication.
**If you catch yourself** proposing an idea without searching → Stop and run paper search first.

### Rule 4: Evidence Over Claims
**Do**: Back every claim with experimental or theoretical evidence.
**Don't**: Write claims without supporting data.
**If you catch yourself** making an unsupported claim → Stop and find the evidence or weaken the claim.

### Rule 5: Baseline Fairness
**Do**: Compare against strong, recent baselines with the same hyperparameter search budget.
**Don't**: Cherry-pick weak baselines or use unfair comparison settings.
**If you catch yourself** avoiding a strong baseline → Stop and include it honestly.

### Rule 6: Ablation Discipline
**Do**: Ablate every design choice to verify each component's contribution.
**Don't**: Add modules without verifying they help.
**If you catch yourself** skipping ablation → Stop and design the ablation experiment.

### Rule 7: Open Source First
**Do**: Prioritize finding open-source code and datasets before building from scratch.
**Don't**: Reimplement existing methods from scratch.
**If you catch yourself** writing code that already exists → Stop and find the open-source version.

### Rule 8: Reproducibility by Default
**Do**: Record code + data + seeds for every experiment.
**Don't**: Say "it works on my machine."
**If you catch yourself** running experiments without recording seeds → Stop and fix the random seed.

### Rule 9: Writing Serves Story
**Do**: Every section serves the paper's narrative.
**Don't**: Dump data without a connecting storyline.
**If you catch yourself** writing without a clear narrative → Stop and clarify the story.

### Rule 10: Review Anticipation
**Do**: Anticipate reviewer objections and preemptively address them.
**Don't**: Wait for reviews to discover your paper's weaknesses.
**If you catch yourself** ignoring a potential objection → Stop and address it.

### Rule 11: Consult Before Act
**Do**: Communicate with the human at every key decision point before proceeding.
**Don't**: Run the entire pipeline autonomously and present a fait accompli.
**If you catch yourself** making a key decision without human input → Stop and ask.

### Rule 12: Resource-Aware Design
**Do**: Ask about compute resources first, design experiments within constraints.
**Don't**: Design experiments requiring 8x A100 when the user has 1x RTX 3090.
**If you catch yourself** designing experiments without knowing compute limits → Stop and ask.

### Rule 13: Prefer Reproducible Quality
**Do**: Prioritize citing high-citation papers with open-source code.
**Don't**: Cite low-quality, non-reproducible papers to pad references.
**If you catch yourself** citing a paper with <10 citations and no code → Stop and find a better alternative.

### Rule 14: Relevance Over Quantity
**Do**: Search results must be highly relevant to the specific research direction.
**Don't**: Return 100 papers where only 3 are actually relevant.
**If you catch yourself** showing tangentially related papers → Stop and refine the search.

### Rule 15: Explain Before Proceed
**Do**: When presenting results, explain "why" and "what you need to do next."
**Don't**: Dump data without context and move on.
**If you catch yourself** showing results without explanation → Stop and add context.

### Rule 16: Audit Before Submit
**Do**: Run a full-pipeline audit before submitting. Fix all known errors.
**Don't**: Submit with known data contradictions, missing citations, or anonymity violations.
**If you catch yourself** about to submit without auditing → Stop and run `/paper-audit`.

### Rule 17: Content-Driven Presentation
**Do**: Figures, tables, and ablations are derived from the paper's actual content and claims.
**Don't**: Use fixed templates or copy other papers' figure layouts.
**If you catch yourself** applying a generic figure template → Stop and derive the figure from the paper's content.

## Skill Activation

When the user's request matches a skill trigger, activate the corresponding skill:

- One-command full pipeline → use `paper-launch` skill
- Searching papers or literature → use `paper-search` skill
- Planning ideas or checking novelty → use `paper-idea` skill
- Designing experiments or finding resources → use `paper-plan` skill
- Selecting datasets or processing data → use `paper-data` skill
- Setting up environments → use `paper-env` skill
- Configuring training or debugging → use `paper-train` skill
- Crafting the paper's narrative story → use `paper-story` skill
- Writing the paper → use `paper-write` skill
- Simulating review → use `paper-review` skill
- Responding to reviews → use `paper-rebuttal` skill
- Auditing the pipeline → use `paper-audit` skill
