# Innovation Methods

## Innovation Point Mining

### Combination Innovation
Two existing ideas that have never been combined. Key test: Can you articulate WHY combining them creates new value (not just "nobody has done it")?

### Observation-Driven Innovation
Start from an empirical finding, derive insight, design method from insight. Key test: Is the observation surprising? Does the insight explain something previously unexplained?

### Simplification Innovation
An existing method that works but is unnecessarily complex. Key test: Does simplification preserve performance? Can you prove the removed component was unnecessary?

### Scale Innovation
A method proven at one scale, applied to a new scale. Key test: Are there non-trivial challenges at the new scale? Does it require adaptation, not just bigger compute?

### Framework Innovation
Multiple fragmented approaches unified into one principled framework. Key test: Does the framework subsume existing methods as special cases? Does it reveal new methods?

## Novelty Check Decision Tree

1. Does EXACTLY the same work exist? (same problem + same method)
   → Yes: 🔴 Duplicated. Stop. Pivot to a different angle.
   → No: Continue to 2.

2. Does a very similar approach exist for the same problem?
   → Yes: What is your DIFFERENTIATION? If only "we also add X" → 🟡 Incremental
   → No: Continue to 3.

3. Does your method exist but for a DIFFERENT problem?
   → Yes: Is the transfer non-trivial? (requires adaptation, not just apply) → 🟢 Novel
   → No: Continue to 4.

4. Is this a genuinely new problem or approach?
   → Yes: 🟢 Clearly novel. Verify with concurrent work check.
   → Unclear: Search more broadly.

5. Concurrent work check: Search arXiv for last 6 months.
   → If concurrent work found: 🟡 Race condition. Emphasize your differentiation.
   → If no concurrent work: 🟢 Confirmed novel.

## Risk Assessment Framework

### Technical Risk
- 🟢 Method well-understood, implementation <2 weeks
- 🟡 Some unknowns, may need 2-4 weeks iteration
- 🔴 Unproven approach, high chance of failure

### Novelty Risk
- 🟢 Clear gap in literature, no concurrent work
- 🟡 Incremental but with clear differentiation
- 🔴 Close to existing work, "not novel enough" likely

### Feasibility Risk
- 🟢 Compute available, data public, framework exists
- 🟡 May need creative workarounds
- 🔴 Requires resources beyond availability
