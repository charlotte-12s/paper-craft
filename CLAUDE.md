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

Match the user's INTENT, not just keywords. When the user's request is related to any of these activities, activate the corresponding skill — even if they use casual, indirect, or non-English phrasing.

### `paper-launch` — Full Pipeline / Starting from Scratch
**Activate when:** User wants to start a research project from the beginning, has rough ideas and wants a complete plan, says things like:
- "我想做一个关于X的研究" / "I want to do research on X"
- "帮我从零开始" / "从哪里开始" / "where do I start"
- "我有个想法但不知道怎么入手" / "I have an idea but don't know where to begin"
- "帮我规划一下整个项目" / "帮我立项" / "start a project"
- Any open-ended research request where the user hasn't specified a particular stage

### `paper-search` — Literature / Papers / Related Work
**Activate when:** User mentions anything about finding, reading, surveying, or understanding existing work:
- "搜论文" / "查文献" / "找相关研究" / "这个领域有什么工作" / "search papers"
- "帮我看看有没有做过X的" / "has anyone done X before"
- "综述" / "survey" / "related work" / "state of the art" / "SOTA"
- "引用" / "cite" / "参考文献" / "reference" / "bibliography"
- "哪个会议发了X方面的论文" / "what papers on X were published at"

### `paper-idea` — Novelty / Innovation / Research Direction
**Activate when:** User is evaluating or developing research ideas:
- "这个方向新不新" / "这个想法有没有人做过" / "is this novel"
- "帮我看看创新点" / "find innovation gaps" / "研究空白"
- "能不能发顶会" / "够不够新" / "is this publishable"
- "帮我头脑风暴研究想法" / "brainstorm research ideas"
- "和XXX比有什么不同" / "what's different from X"

### `paper-plan` — Experiments / Compute / Ablation Design
**Activate when:** User is designing experiments or planning compute resources:
- "帮我设计实验" / "design experiments" / "实验方案"
- "我只有X卡GPU" / "I only have X GPU" / "算力不够怎么办"
- "消融实验怎么做" / "ablation study" / "怎么验证每个模块"
- "帮我找开源代码/数据集" / "find open-source code"
- "跑多少组实验" / "how many experiments to run"

### `paper-data` — Datasets / Data Processing / Contamination
**Activate when:** User mentions datasets, data processing, or data quality:
- "用什么数据集" / "which dataset" / "数据集选择"
- "数据有没有污染" / "data contamination" / "test set leak"
- "帮我处理数据" / "process data" / "data pipeline"
- "数据预处理" / "preprocessing" / "data cleaning"
- "数据划分" / "train/val/test split"

### `paper-env` — Environment Setup / Dependencies / Compatibility
**Activate when:** User is setting up or troubleshooting development environments:
- "环境配不好" / "environment setup" / "装不上"
- "CUDA版本" / "PyTorch版本" / "version conflict"
- "帮我配环境" / "set up environment" / "依赖冲突"
- "Docker" / "conda" / "pip install 报错"

### `paper-train` — Training / Fine-tuning / Debugging Training
**Activate when:** User is training, fine-tuning, or debugging model training:
- "帮我配训练参数" / "training config" / "hyperparameters"
- "batch size 设多少" / "learning rate" / "LoRA rank"
- "NaN loss" / "OOM" / "训练崩了" / "loss 不降"
- "loss 震荡" / "不收敛" / "overfitting" / "欠拟合"
- "微调" / "fine-tune" / "训练一个模型" / "train a model"
- "DeepSpeed" / "分布式训练" / "multi-GPU"

### `paper-story` — Narrative / Story / Paper Structure
**Activate when:** User is thinking about how to tell the paper's story or structure:
- "论文怎么讲这个故事" / "how to frame the paper"
- "用什么叙事结构" / "narrative structure" / "story pattern"
- "论文逻辑链" / "argument chain" / "怎么组织论文"
- "和XXX那篇论文一样的讲法" / "like the Attention paper"

### `paper-write` — Writing / Sections / LaTeX
**Activate when:** User is writing or revising paper content:
- "帮我写XX部分" / "write the method section" / "写abstract"
- "帮我润色" / "polish" / "改写" / "rewrite"
- "LaTeX" / "写论文" / "draft" / "manuscript"
- "introduction怎么写" / "related work怎么组织"
- "会议模板" / "conference template" / "双栏格式"

### `paper-review` — Review / Feedback / Weakness Check
**Activate when:** User wants feedback, review simulation, or weakness identification:
- "帮我看看论文有什么问题" / "review my paper" / "找找弱点"
- "模拟审稿" / "simulate review" / "审稿人会怎么说"
- "能不能中" / "will it be accepted" / "有什么风险"
- "reviewer 2" / "weakness" / "rebuttal 提前准备"
- "帮我检查一下" / "check this before submission"

### `paper-rebuttal` — Rebuttal / Response to Reviews
**Activate when:** User has received reviews and needs to respond:
- "审稿意见来了" / "got reviews" / "reviewer 说了X"
- "帮我写回复" / "write rebuttal" / "response to reviewers"
- "怎么反驳审稿人" / "how to respond" / "rebuttal strategy"
- "审稿人不认可X" / "reviewer rejected X"

### `paper-audit` — Pre-submission Check / Quality Audit
**Activate when:** User is about to submit or wants a comprehensive quality check:
- "要提交了帮我检查" / "pre-submission check" / "提交前检查"
- "有没有遗漏" / "anything missing" / "自查"
- "审计" / "audit" / "50项检查清单" / "checklist"
- "匿名化" / "anonymization" / "格式对不对"
- "引用够不够" / "citations complete" / "有没有声明冲突"
