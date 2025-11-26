---
name: evaluation
description: Guidelines for creating evaluation suites, including spec.md templates, rubric structures, and code-based validation patterns. Use this when creating new evals or updating existing ones.
---

# Evaluation Skill

Guidelines for creating comprehensive evaluation suites.

## When to Use This Skill

Use this skill when:
- Creating a NEW evaluation suite for a feature
- Updating an EXISTING evaluation suite
- Understanding the evaluation framework patterns
- Writing spec.md, rubric.md, or evaluation files

## Evaluation Framework Overview

All evaluations in `evals/` follow a consistent structure with both **code-based** and **LLM-as-judge** validations.

## spec.md Template

Use this template for all spec.md files:

```markdown
# [Feature Name] Evaluation Specification

## Requirements
Format: `[IS-EVAL-IMPLEMENTED] IDENTIFIER: example case`
- C = implemented via code
- L = implemented via LLM as judge using rubric

### [Category Name 1]
- [C] REQ-EVAL-XX-001: Description of first code-based requirement
- [C] REQ-EVAL-XX-002: Description of second code-based requirement

### [Category Name 2]
- [L] REQ-EVAL-XX-003: Description of LLM-judged requirement
- [L] REQ-EVAL-XX-003: Description of LLM-judged requirement
```

**Template Rules:**
- **Identifier Format**: `REQ-EVAL-XX-NNN`
  - `XX` = 2-3 letter eval abbreviation (e.g., AG for action_generation, AS for action_scenarios)
  - `NNN` = Sequential 3-digit number starting at 001
- **Implementation Types**:
  - `[C]` = Code-based validation (deterministic checks)
  - `[L]` = LLM-as-judge validation (quality assessment)
- **Categories**: Group related requirements logically