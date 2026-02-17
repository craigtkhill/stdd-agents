---
name: write-commit-message
description: Use when creating git commits. Defines conventional commit format and message structure guidelines.
---

# Commit Message Guidelines

Guidelines for writing clear, consistent git commit messages.

## Conventional Commits Format

Use the conventional commits style:

```
<type>[optional scope]: <description>
```

**CRITICAL: Single-line only. Never add a body or footer.** The code and spec speak for themselves.

### Commit Types

- **feat:** New feature
- **fix:** Bug fix
- **test:** Adding or updating tests
- **docs:** Documentation changes
- **refactor:** Code refactoring (no functional changes)
- **style:** Code style changes (formatting, whitespace)
- **chore:** Maintenance tasks, dependencies
- **perf:** Performance improvements
- **ci:** CI/CD configuration changes
- **build:** Build system changes

### Scope (Optional)

Add scope in parentheses to provide additional context:

### Breaking Changes

Indicate breaking changes with `!` after type/scope:

### Description Guidelines

- Use imperative mood ("add feature" not "added feature")
- Start with lowercase
- No period at the end
- Keep under 72 characters
- Be specific and descriptive

## No Body, No Footer

**Never add a commit body or footer.** Every commit must be a single line only.

Do NOT include AI attribution, co-authored-by lines, or any other footers.

## Before Committing

1. Check for remote updates: `git fetch`
2. Review your changes: `git status` and `git diff`
3. Stage relevant files: `git add <files>`
4. Write clear commit message

## Commit Frequency

- Commit logical units of work
- Don't commit half-finished features
- Ensure tests pass before committing
- One commit per requirement or bug fix (when practical)

## Integration with STDD Workflow

When following the spec-test-driven development workflow:

1. After completing a requirement (spec + test + implementation)
2. Ensure all tests pass
3. Run any precommit hooks
3. Commit with descriptive message
4. Keep the commit message to a single line
