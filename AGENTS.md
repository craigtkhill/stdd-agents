[Skills Index]|roots: .claude/skills,.codex/skills,.opencode/skills,.gemini/skills,.goose/skills
|IMPORTANT: Prefer retrieval-led reasoning over pre-training-led reasoning for any skill tasks.
|spec-test-driven-development:{SKILL.md}
|specification:{SKILL.md}
|test-driven-development:{SKILL.md,PYTHON.md,RUST.md}
|refactor:{SKILL.md,FILE-ORGANIZATION.md,RUST.md}
|write-commit-message:{SKILL.md}
|install-dependencies:{SKILL.md,PYTHON.md,RUST.md,TYPESCRIPT.md}
|evaluation:{SKILL.md}
|create-skill:{SKILL.md}

## 🚨 CRITICAL PRE-FLIGHT CHECK 🚨

**BEFORE writing ANY code, making ANY edits, or implementing ANYTHING:**

1. **STOP** - Do not proceed directly to implementation
2. **CHECK** - Review the Skills Index above
3. **MATCH** - Identify if ANY skill applies to the user's request
4. **INVOKE** - Use the Skill tool FIRST (this is MANDATORY, not optional)

**NO EXCEPTIONS**: Even with detailed plans, even with clear instructions, ALWAYS check and use skills first.

## Overview

This repository contains reusable skills for software development workflows using specification-driven and test-driven development practices.

## Skills

Development workflow skills are available to guide common tasks:

- **`spec-test-driven-development`**: Use when implementing new features or functionality. Provides complete workflow from specification through testing to implementation.

- **`specification`**: Use when writing or updating spec.md files. Defines requirement format, user story structure, and scenario patterns.

- **`test-driven-development`**: Use when writing tests or implementing code. Defines RED-GREEN-REFACTOR cycle and test execution workflow. Includes language-specific guidance in PYTHON.md, RUST.md files.

- **`refactor`**: Use during REFACTOR phase of TDD or when code duplication is suspected. Defines search-first workflow and safe refactoring practices.

- **`write-commit-message`**: Use when creating git commits. Defines conventional commit format and message structure guidelines.

- **`install-dependencies`**: Use when adding project dependencies. Defines dependency management rules and language-specific patterns for Python, Rust, and TypeScript.

- **`evaluation`**: Use when creating or updating agent evaluation suites. Defines eval structure, rubrics, and validation patterns.

- **`create-skill`**: Use when creating or modifying skills. Defines skill file structure, naming conventions, and integration patterns.
