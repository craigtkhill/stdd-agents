---
name: stdd
description: Specification-Test-Driven Development workflow - write spec first, then tests, then implementation - uses spec and tdd skills
---

# Spec-TDD Development Workflow

When developing ANY new feature or functionality, follow this strict workflow:

## Workflow Steps

### 1. Write Specification FIRST (spec.md)
**Use the `spec` skill to write specifications following project conventions.**

The spec skill provides detailed guidelines for:
- Feature user story format (As a... I want... So that...)
- Requirements organization and naming (REQ-XXX-NNN)
- Requirement writing guidelines (atomic, testable, present tense)
- Scenario writing (Given/When/Then format)
- Proper spec structure and sections

After writing spec:
- Get user approval on spec before proceeding to tests

### 2. Write Tests SECOND (before implementation)
- Write tests based on the spec requirements
- One test per assertion (performance costs permitting)
- Test naming: `test_should_{expected_behavior}`
- Test files: `tests/test_{feature}/test_{module}.py`

### 3. Implement Code LAST
- Write minimal code to make tests pass
- Follow patterns from spec
- Reuse existing infrastructure where possible
- Update todo list as you work
- **CRITICAL: Update spec requirement markers as you complete each requirement**
  - After writing test: Mark test column with `U` (unit test) or `A` (acceptance test)
  - After implementing code: Mark code column with `X` (implemented)
  - Example: `[O][O]` → `[U][O]` (test written) → `[U][X]` (code implemented)

## Commit Workflow

- Use conventional commits style (feat:, fix:, test:, docs:, refactor:)
- Check for remote updates before committing

## Do NOT Proceed Without

1. ❌ Do NOT write implementation code before spec
2. ❌ Do NOT write implementation code before tests
3. ❌ Do NOT skip writing tests
4. ❌ Do NOT write multiple assertions per test (unless justified)
5. ✅ DO write spec → tests → implementation in that order
6. ✅ DO get user approval on spec before proceeding
7. ✅ DO use TodoWrite to track progress