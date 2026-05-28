# PaperCraft

**From idea to accepted paper at top CS conferences.**

[![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Skills: 12](https://img.shields.io/badge/Skills-12-green.svg)]()
[![Conferences: 16 CCF-A](https://img.shields.io/badge/Conferences-16_CCF--A-orange.svg)]()
[![Rules: 17](https://img.shields.io/badge/Rules-17-purple.svg)]()

Full-pipeline CS research AI partner with **17 rules + 12 skills** that guide researchers from rough ideas to accepted papers, with conference-specific adaptation for **16 CCF-A venues**.

## Why PaperCraft?

Your AI can search papers, design experiments, and write drafts. But can it get accepted at NeurIPS?

Most AI tools treat research as isolated tasks. PaperCraft treats it as a **pipeline** — where each step builds on the last, and every decision is shaped by the target conference's taste.

**Pain points PaperCraft solves:**
- Don't know where to start? → `/paper-launch` gives you a complete project plan in one session
- Can't match conference taste? → 16 CCF-A profiles adapt your writing and experiments
- Wasting compute on wrong experiments? → Resource-aware design asks about your GPU first
- Weak baselines and missing ablations? → Rules 5-6 enforce baseline fairness and ablation discipline
- Paper gets rejected? → `/paper-review` simulates reviewers before you submit

## The 12 Skills

| Skill | What It Does |
|-------|-------------|
| `/paper-launch` | One-command research launcher — ideas → complete project plan |
| `/paper-search` | Multi-source literature search with quality filtering and citation traversal |
| `/paper-idea` | Find innovation gaps, check novelty, assess risks |
| `/paper-plan` | Resource-aware experiment design with content-driven ablation planning |
| `/paper-data` | Dataset selection, contamination check, one-click processing pipeline |
| `/paper-env` | One-shot environment setup with version compatibility matrix |
| `/paper-train` | Auto-derive training parameters, debug failures, analyze results |
| `/paper-story` | Craft your paper's narrative arc from 6 CS research story patterns |
| `/paper-write` | Section-by-section writing with conference-specific style guides |
| `/paper-review` | Simulate 2-3 reviewers before submission |
| `/paper-rebuttal` | Parse reviews, draft responses, plan resubmission if rejected |
| `/paper-audit` | Full-pipeline quality check before submission |

## The 17 Rules

| # | Rule | Core Idea |
|---|------|-----------|
| 1 | Novelty First | Confirm innovation before implementation |
| 2 | Match Conference Taste | Adapt to target conference preferences |
| 3 | Search Before Propose | Always search existing work first |
| 4 | Evidence Over Claims | Back every claim with data |
| 5 | Baseline Fairness | Compare against strong, recent baselines |
| 6 | Ablation Discipline | Verify every design choice |
| 7 | Open Source First | Find existing code before building |
| 8 | Reproducibility by Default | Record code + data + seeds |
| 9 | Writing Serves Story | Every section serves the narrative |
| 10 | Review Anticipation | Preemptively address objections |
| 11 | Consult Before Act | Human checkpoints at key decisions |
| 12 | Resource-Aware Design | Design experiments within compute limits |
| 13 | Prefer Reproducible Quality | Cite high-quality, reproducible papers |
| 14 | Relevance Over Quantity | Filter search results tightly |
| 15 | Explain Before Proceed | Always explain "why" and "what next" |
| 16 | Audit Before Submit | Mandatory pre-submission audit |
| 17 | Content-Driven Presentation | Figures/ablations from content, not templates |

## 16 CCF-A Conference Profiles

Each profile includes review weights, writing style, recent trends, reviewer concerns, anti-patterns, and success patterns.

| Area | Conferences |
|------|------------|
| ML | ICML, ICLR, NeurIPS |
| AI | AAAI, IJCAI |
| CV | CVPR, ICCV, ECCV |
| NLP | ACL, EMNLP |
| DM | KDD, SIGIR, WWW, WSDM |
| SE | ICSE |
| Security | S&P |

## Quick Start

### Option 1: npx (recommended, cross-platform)

```bash
npx paper-craft
```

Works on Windows, macOS, and Linux.

### Option 2: curl (macOS/Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/charlotte-12s/paper-craft/main/install.sh | bash
```

### Option 3: Clone and run

```bash
git clone https://github.com/charlotte-12s/paper-craft.git
cd paper-craft
# Cross-platform (Node.js)
node cli.js
# Or use bash (macOS/Linux/WSL)
bash install.sh
```

## Bundle Options

Install only the skills you need:

```bash
# All 12 skills (default)
npx paper-craft --bundle full

# Literature search only
npx paper-craft --bundle search-only

# Writing pipeline only (story + write + review)
npx paper-craft --bundle write-only

# One-command launcher only
npx paper-craft --bundle launch-only
```

## Cross-Tool Compatibility

PaperCraft works with all major AI coding tools:

| Tool | `--tool` flag | Auto-detection |
|------|---------------|----------------|
| Claude Code | `claude-code` | `.claude/` directory |
| Cursor | `cursor` | `.cursor/` directory |
| Codex CLI | `codex` | `AGENTS.md` file |
| Gemini CLI | `gemini` | `GEMINI.md` file |
| GitHub Copilot | `copilot` | `.github/` directory |
| Windsurf | `windsurf` | `.windsurfrules` file |

Specify manually with `--tool`:

```bash
npx paper-craft --tool claude-code --tool cursor
```

## CS-Specific Conventions

PaperCraft enforces CS research standards by default:

- **LaTeX double-column** format (not Word)
- **Algorithm pseudocode** with `\begin{algorithm}`
- **TikZ/matplotlib** style figures
- **BibTeX + numeric** citations
- **booktabs** tables (bold best, underline second-best, no vertical lines)
- **Vector figures** (PDF format, zoom-friendly)
- **Color-blind friendly** palettes (viridis/Set2, not red-green)
- **Minimum 8pt** font size in figures

## China-Specific Support

- A800 GPU and 昇腾910B training recipes
- CANN toolkit compatibility matrix
- MindSpore/PyTorch on Ascend setup guide
- Tsinghua/Aliyun PyPI mirrors
- HuggingFace mirrors (hf-mirror.com, modelscope.cn)

## Interaction Pattern: Explain-Before-Proceed

Every human checkpoint follows this format:

```
📊 Result: What was done, what was found
💡 Explanation: Why this result, what it means for you
🎯 Action: What you need to do, how to do it
```

No more data dumps without context. Every output comes with explanation and next steps.

## Pipeline Iteration

The skills follow a linear flow but real research is iterative. Each skill is independently callable — enter at any point and loop back as needed:

```
paper-search → paper-idea → paper-plan → paper-data → paper-env → paper-train
     ↑                                                                        |
     |________________________________________________________________________|
                                        Revision loops:
                                        - paper-review → paper-write (revise draft)
                                        - paper-review → paper-story (restructure narrative)
                                        - paper-review → paper-train (add experiments)
                                        - paper-rebuttal → paper-search (resubmit to different venue)
```

## Security Note

PaperCraft is a prompt engineering project — it installs Markdown skill files and rules into your project. It does **not** execute code, access APIs, or send data anywhere. All skills run locally within your AI coding tool.

## License

[BSD-3-Clause](LICENSE)
