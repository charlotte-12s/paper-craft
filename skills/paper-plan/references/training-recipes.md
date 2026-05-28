# Training Recipes by GPU Type

## A100-80GB Recommended Config

| Parameter | 7B Model | 13B Model | 70B Model |
|-----------|----------|-----------|-----------|
| batch_size | 16 | 8 | 2 (with gradient accumulation) |
| learning_rate | 2e-5 | 1.5e-5 | 1e-5 |
| epochs | 3 | 3 | 2 |
| gradient_accumulation | 1 | 2 | 8 |
| LoRA rank | 16 | 8 | 4 |
| LoRA alpha | 32 | 16 | 8 |
| warmup_steps | 100 | 100 | 200 |
| weight_decay | 0.01 | 0.01 | 0.1 |
| fp16/bf16 | bf16 | bf16 | bf16 |
| DeepSpeed | ZeRO-2 | ZeRO-2 | ZeRO-3 |

## A800-80GB Recommended Config

Same as A100-80GB with the following differences:
- Reduced interconnect bandwidth (400GB/s vs 600GB/s NVLink) → ZeRO-3 may be slower for 70B
- Recommend ZeRO-2 + offload for 70B on 2x A800 instead of ZeRO-3 on 1x
- No functional differences for single-GPU workloads

## RTX 3090 24GB Recommended Config

| Parameter | 7B Model | 13B Model |
|-----------|----------|-----------|
| batch_size | 4 | 2 |
| learning_rate | 2e-5 | 1e-5 |
| epochs | 3 | 3 |
| gradient_accumulation | 4 | 8 |
| LoRA rank | 8 | 4 |
| LoRA alpha | 16 | 8 |
| warmup_steps | 50 | 50 |
| weight_decay | 0.01 | 0.01 |
| fp16/bf16 | fp16 | fp16 |
| gradient_checkpointing | Yes | Yes |

Notes: 70B models are NOT feasible on RTX 3090 without offloading. Use QLoRA with 4-bit quantization (bitsandbytes) to fit 7B in ~10GB.

## RTX 4090 24GB Recommended Config

Similar to RTX 3090 but:
- Faster compute (2x throughput) → training time roughly halved
- Same memory constraints (24GB) → same batch size limits
- Supports bf16 → use bf16 instead of fp16 for better stability

## 昇腾910B Recommended Config

| Parameter | 7B Model | 13B Model |
|-----------|----------|-----------|
| batch_size | 8 | 4 |
| learning_rate | 2e-5 | 1.5e-5 |
| epochs | 3 | 3 |
| gradient_accumulation | 2 | 4 |
| LoRA rank | 16 | 8 |
| LoRA alpha | 32 | 16 |
| Framework | PyTorch (CANN) or MindSpore | PyTorch (CANN) or MindSpore |

Notes:
- Requires CANN 7.0+ for PyTorch compatibility
- MindSpore provides native support and better performance on 昇腾
- HuggingFace models need AscendTorch adapter for PyTorch compatibility
- Some CUDA-specific ops may need replacement (check env-compat.md)

## LoRA Rank vs Learning Rate Guide

| LoRA Rank | Recommended LR | Reasoning |
|-----------|---------------|-----------|
| 4 | 3e-5 | Low rank needs higher LR to compensate |
| 8 | 2e-5 | Standard for 13B+ models |
| 16 | 1.5e-5 | Standard for 7B models |
| 32 | 1e-5 | High rank, lower LR to prevent instability |
| 64 | 8e-6 | Fine-grained tasks, needs careful tuning |
| 128 | 5e-6 | Very high rank, close to full fine-tuning |

General rule: lr ∝ 1/sqrt(rank). LoRA alpha = 2× rank is standard heuristic.

## DeepSpeed ZeRO Stage Selection Guide

| Model Size | GPU Count | GPU Memory | Recommended Stage |
|-----------|-----------|------------|-------------------|
| 7B | 1x | 80GB | ZeRO-2 (or no DeepSpeed) |
| 7B | 1x | 24GB | ZeRO-2 + offload |
| 13B | 2x | 80GB | ZeRO-2 |
| 13B | 1x | 24GB | ZeRO-3 + offload (QLoRA preferred) |
| 70B | 4x | 80GB | ZeRO-3 |
| 70B | 8x | 80GB | ZeRO-3 |
| 70B | 2x | 24GB | Not feasible without offloading |

## Common Training Problems Quick Reference

| Problem | Symptom | Likely Cause | Fix |
|---------|---------|-------------|-----|
| NaN loss | Loss becomes NaN after N steps | LR too high, data contains NaN, LoRA rank too high | Reduce LR 10x, check data, reduce rank |
| OOM error | CUDA out of memory | Batch size too large, model too big | Reduce batch_size, enable gradient_checkpointing, use DeepSpeed |
| Training doesn't converge | Loss plateaus high | LR too low, bad initialization, data issue | Increase LR, check data loading, try different seed |
| Eval metrics don't improve | Training loss drops but eval flat | Overfitting, eval data issue | Add regularization, check eval data, reduce epochs |
| Loss spike | Sudden large loss spike | Bad batch, LR too high, gradient explosion | Gradient clipping (max_norm=1.0), reduce LR, skip bad batches |
| Slow training | Low GPU utilization | DataLoader bottleneck, small batch | Increase num_workers, increase batch_size, prefetch data |
