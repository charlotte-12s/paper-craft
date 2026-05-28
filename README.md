<div align="center">

# PaperCraft

**From rough idea to accepted paper at top CS conferences.**

*A full-pipeline AI research partner — not just another paper-writing tool.*

[![npm version](https://img.shields.io/npm/v/paper-craft.svg)](https://www.npmjs.com/package/paper-craft)
[![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Skills](https://img.shields.io/badge/Skills-12-green.svg)]()
[![Conferences](https://img.shields.io/badge/CCF--A_Conferences-16-orange.svg)]()
[![Rules](https://img.shields.io/badge/Research_Rules-17-purple.svg)]()

```bash
npx paper-craft
```

[English](#quick-start) · [中文说明](#中文说明)

</div>

---

## Why PaperCraft?

Your AI can search papers, design experiments, and write drafts. **But can it get accepted at NeurIPS?**

Most AI tools treat research as isolated tasks — search here, write there, debug somewhere else. PaperCraft treats it as a **pipeline** where each step builds on the last, and every decision is shaped by your target conference's taste.

| Without PaperCraft | With PaperCraft |
|---|---|
| "Help me search papers" | `/paper-search` — 4-layer multi-source search with quality filtering and citation traversal |
| "Write me a method section" | `/paper-write` — conference-specific style, claim-evidence alignment, content-driven figures |
| "My training crashed" | `/paper-train` — auto-derive params from your GPU, debug NaN/OOM with decision trees |
| "Review my paper" | `/paper-review` — simulate 3 reviewers including a skeptical one, with conference-specific rubric |
| "I don't know where to start" | `/paper-launch` — one command from raw ideas to complete project plan |

## The Full Pipeline

```
 💡 Idea        🔍 Search       📋 Plan         📊 Data         🔧 Env          🏋️ Train
paper-launch → paper-search → paper-plan → paper-data → paper-env → paper-train
                                                              ↓
 📖 Story       ✍️ Write        🔎 Review       💬 Rebuttal     ✅ Audit
paper-story → paper-write → paper-review → paper-rebuttal → paper-audit
```

Each skill is independently callable — enter at any point and loop back as needed.

## The 12 Skills

| Skill | What It Does |
|-------|-------------|
| `/paper-launch` | One-command research launcher — ideas to complete project plan |
| `/paper-search` | Multi-source literature search with quality filtering and citation traversal |
| `/paper-idea` | Find innovation gaps, check novelty, assess risks |
| `/paper-plan` | Resource-aware experiment design with content-driven ablation planning |
| `/paper-data` | Dataset selection, contamination check, one-click processing pipeline |
| `/paper-env` | One-shot environment setup with version compatibility matrix |
| `/paper-train` | Auto-derive training parameters, debug failures, analyze results |
| `/paper-story` | Craft your paper's narrative arc from 6 CS research story patterns |
| `/paper-write` | Section-by-section writing with conference-specific style guides |
| `/paper-review` | Simulate 2-3 reviewers before submission |
| `/paper-rebuttal` | Parse reviews, draft responses, plan resubmission |
| `/paper-audit` | Full-pipeline quality check before submission |

## 16 CCF-A Conference Profiles

Each profile includes review weights, writing style, recent trends, reviewer concerns, anti-patterns, and success patterns — so your paper speaks the conference's language.

| Area | Conferences |
|------|------------|
| ML | ICML · ICLR · NeurIPS |
| AI | AAAI · IJCAI |
| CV | CVPR · ICCV · ECCV |
| NLP | ACL · EMNLP |
| DM | KDD · SIGIR · WWW · WSDM |
| SE | ICSE |
| Security | S&P |

## The 17 Research Rules

Rules that prevent the most common reasons papers get rejected:

| # | Rule | Prevents |
|---|------|----------|
| 1 | **Novty First** | Building before confirming innovation |
| 2 | **Match Conference Taste** | Using NeurIPS style for an AAAI submission |
| 3 | **Search Before Propose** | Duplicating existing work |
| 4 | **Evidence Over Claims** | Unsupported claims reviewers will attack |
| 5 | **Baseline Fairness** | Cherry-picking weak baselines |
| 6 | **Ablation Discipline** | Adding modules without verifying they help |
| 7 | **Open Source First** | Reimplementing what already exists |
| 8 | **Reproducibility by Default** | "Works on my machine" |
| 9 | **Writing Serves Story** | Data dumps without narrative |
| 10 | **Review Anticipation** | Surprised by reviewer objections |
| 11 | **Consult Before Act** | AI running the entire pipeline alone |
| 12 | **Resource-Aware Design** | Experiments requiring 8×A100 when you have 1×3090 |
| 13 | **Prefer Reproducible Quality** | Citing non-reproducible papers |
| 14 | **Relevance Over Quantity** | 100 search results where 3 matter |
| 15 | **Explain Before Proceed** | Data without context or next steps |
| 16 | **Audit Before Submit** | Submitting with known errors |
| 17 | **Content-Driven Presentation** | Generic figure templates |

## Quick Start

### Option 1: npx (recommended)

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
node cli.js          # Cross-platform (Node.js)
bash install.sh      # Or bash (macOS/Linux/WSL)
```

### Bundle Options

Install only the skills you need:

```bash
npx paper-craft                      # All 12 skills (default)
npx paper-craft --bundle search-only  # Literature search only
npx paper-craft --bundle write-only   # Writing pipeline (story + write + review)
npx paper-craft --bundle launch-only  # One-command launcher only
```

## Cross-Tool Compatibility

Works with your favorite AI coding tool — auto-detected or specified manually:

| Tool | `--tool` flag | Auto-detection |
|------|---------------|----------------|
| Claude Code | `claude-code` | `.claude/` directory |
| Cursor | `cursor` | `.cursor/` directory |
| Codex CLI | `codex` | `AGENTS.md` file |
| Gemini CLI | `gemini` | `GEMINI.md` file |
| GitHub Copilot | `copilot` | `.github/` directory |
| Windsurf | `windsurf` | `.windsurfrules` file |

```bash
npx paper-craft --tool claude-code --tool cursor
```

## What Makes It Different?

### Conference-Specific Adaptation

The same idea written differently for different venues. PaperCraft loads the target conference's profile and adapts:
- **Writing style** — NeurIPS values theoretical grounding; CVPR prioritizes visual results
- **Experiment design** — ICML expects ablation on every component; AAAI prefers breadth over depth
- **Review rubric** — Different weight on novelty/significance/technical quality per venue

### Explain-Before-Proceed Pattern

Every output follows this format — no more data dumps:

```
📊 Result: What was done, what was found
💡 Explanation: Why this result, what it means for you
🎯 Action: What you need to do next
```

### CS Research Standards Built In

- **LaTeX double-column** format (not Word)
- **Algorithm pseudocode** with `\begin{algorithm}`
- **booktabs** tables (bold best, underline second-best, no vertical lines)
- **Color-blind friendly** palettes (viridis/Set2, not red-green)
- **Vector figures** (PDF format, zoom-friendly)
- **BibTeX + numeric** citations

### China-Specific Support

- A800 GPU and 昇腾910B training recipes
- CANN toolkit compatibility matrix
- MindSpore/PyTorch on Ascend setup guide
- Tsinghua/Aliyun PyPI mirrors
- HuggingFace mirrors (hf-mirror.com, modelscope.cn)

## Security

PaperCraft is a prompt engineering project — it installs Markdown skill files and rules into your project. It does **not** execute code, access APIs, or send data anywhere. All skills run locally within your AI coding tool.

## License

[BSD-3-Clause](LICENSE)

---

<div align="center">

**If PaperCraft helps your research, consider giving it a star! ⭐**

</div>
