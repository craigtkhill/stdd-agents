---
name: test-driven-development
description: Test-Driven Development workflow using RED-GREEN-REFACTOR cycle - write one test, see it fail, implement minimal code, verify all tests pass, repeat
---

# Test-Driven Development (TDD) Skill

This skill defines the proper TDD workflow: write ONE test, run it (RED), implement minimal code (GREEN), run ALL tests, repeat.

**Language-specific details**:
- For Python projects: See `test-driven-development/PYTHON.md` for pytest patterns, running tests, and Python-specific examples
- Other languages: Add new files to `test-driven-development/` directory as needed

## TDD Cycle: RED → GREEN → REFACTOR

### 1. RED: Write ONE Failing Test

Write a SINGLE test that fails.

**Key principle**: The test must fail for the right reason (missing implementation, not syntax error).

**CRITICAL - Run the test - it MUST fail:**
- ❌ DO NOT write implementation before running the test
- ❌ DO NOT skip the RED phase
- ✅ DO run the test immediately after writing it
- Run only the new test in isolation
- Verify it fails with expected error (import error, assertion failure, etc.)
- Expected outcome: RED (test fails)

**Why RED is mandatory:**
- Confirms the test actually tests something
- Prevents false positives (tests that always pass)
- Validates test setup is correct

### 2. GREEN: Write Minimal Implementation

Write the MINIMUM code to make the test pass.

**Key principle**: Don't add features not yet tested. Don't over-engineer.

**Run the SAME test again:**
- Run only the new test in isolation
- Verify it now passes
- Expected outcome: GREEN (test passes)

### 3. VERIFY: Run ALL Tests

**CRITICAL**: After each test passes, run ALL tests to ensure nothing broke.

**Key principle**: Never break existing functionality.

**Run complete test suite:**
- Run all tests in the project
- Verify all tests pass (new and existing)
- Expected outcome: All tests GREEN

### 4. REFACTOR: Improve Code Quality

After tests pass, consider refactoring to improve code quality.

**Use the `refactor` skill for detailed refactoring guidance.**

**Key principle**: Refactor only when tests are GREEN. Tests protect you during refactoring.

**When to refactor:**
- Code duplication exists
- Code is unclear or hard to understand
- Better patterns or abstractions are apparent
- Performance can be improved
- Before implementing new features that may duplicate existing patterns

**Refactoring safety:**
- Run ALL tests after each refactoring change
- If any test fails, revert and try a different approach
- Keep refactoring changes small and incremental

**Note**: Refactoring is optional on each cycle. You can skip if code is already clean.

### 5. REPEAT: Next Test

Only after all tests pass, write the NEXT single test and repeat the cycle.

## TDD Rules

### Rule 1: One Test at a Time
- ❌ Do NOT write multiple tests before implementing
- ❌ Do NOT write all tests upfront
- ❌ Do NOT write multiple tests in a single file edit
- ✅ DO write ONE test → run it → see result → update spec → next test
- ✅ Write exactly one test function, then stop
- ✅ After test passes, update SPEC.md to mark requirement as tested

**Updating SPEC.md markers:**
- After writing unit test that passes: `[O][O]` → `[U][O]` (test exists, code pending)
- After code passes unit test: `[U][O]` → `[U][X]` (test and code complete)
- After writing acceptance test that passes: `[O][O]` → `[A][O]` (acceptance test exists, code pending)
- After code passes acceptance test: `[A][O]` → `[A][X]` (acceptance test and code complete)
- When acceptance test passes, mark related unit-tested features as implemented: `[U][O]` → `[U][X]`

### Rule 2: Always Run Tests
**CRITICAL**: Every test MUST go through THREE runs:
1. **RED**: Run new test **in isolation** to see it FAIL (before implementing)
2. **GREEN**: Run same test **in isolation** to see it PASS (after implementing)
3. **VERIFY**: Run **ALL tests** in the project to verify nothing broke

❌ **NEVER skip the RED phase** - Always see the test fail before implementing

**Why run in isolation first?**
- Faster feedback loop
- Confirms the specific test behavior
- Clear signal that implementation fixed the exact test

**Why run all tests after?**
- Ensures no regression in existing functionality
- Catches unintended side effects
- Maintains confidence in full codebase

### Rule 3: Minimal Implementation
- Write ONLY enough code to make the current test pass
- Don't add features not yet tested
- Don't over-engineer solutions
- Prefer simple over clever

### Rule 4: Test One Thing
- Each test validates ONE behavior
- One assertion per test (unless assertions are intrinsically coupled)
- Clear test names describe what's being tested
- Multiple tests enable better parallelization

### Rule 5: Fail Fast
If all tests don't pass:
- Stop immediately
- Fix the broken test
- Don't move to next test until all tests GREEN

## TDD Workflow Diagram

```
┌─────────────────────────────────────────────────┐
│ Start: Pick next requirement from spec         │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 1. RED: Write ONE test for requirement         │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 2. Run test in isolation                       │
│    Expected: FAIL (RED)                        │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 3. GREEN: Write minimal implementation         │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 4. Run same test in isolation                  │
│    Expected: PASS (GREEN)                      │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 5. VERIFY: Run ALL tests                       │
│    Expected: All PASS                          │
└────────────────┬────────────────────────────────┘
                 │
            All pass? ──No──> Fix broken tests
                 │
                Yes
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 6. REFACTOR: Improve code          │
│    Run ALL tests after each change             │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 7. More requirements? ──Yes──> Repeat          │
│                        │                        │
│                       No                        │
│                        │                        │
│                        ▼                        │
│                     Done                        │
└─────────────────────────────────────────────────┘
```

## Test Organization

### Unit Tests vs Acceptance Tests vs Integration Tests

**Unit Tests:**
- Test individual functions/classes in isolation
- Fast, focused, and run frequently
- Located within the feature directory
- Should cover the vast majority of your testing needs
- Marked with `[U]` in SPEC.md

**Acceptance Tests:**
- Test complete features from a user/business perspective
- Verify requirements are met end-to-end within a feature
- Located within the feature directory
- Test scenarios from the spec (Given/When/Then)
- May involve multiple units working together within the same feature
- Marked with `[A]` in SPEC.md
- **When to use:**
  - Testing complete user workflows that require external APIs
  - Verifying business requirements are satisfied
  - Testing features that span multiple units within the feature
  - End-to-end validation of a feature

**Integration Tests:**
- Test interactions between multiple modules or external systems
- Slower, more complex, expensive to maintain
- Located in `tests/` directory at project root
- **Use sparingly and only for tactical purposes:**
  - When unit tests cannot adequately verify the behavior
  - Testing interactions with external dependencies (databases, APIs, LLMs)
  - End-to-end workflows that span multiple modules
  - Verifying third-party library integration (e.g., Pydantic AI model introspection)

**Test Hierarchy:**
1. **Default to unit tests** - fast, isolated, cover individual behaviors
2. **Use acceptance tests** - when you need end-to-end feature validation
3. **Use integration tests sparingly** - only for tactical external integration needs

### Test Grouping
Organize tests by requirement sections:
- Group related tests together
- Use clear section/class names
- Mirror the spec structure

### Test Naming
Follow project conventions for test names:
- Descriptive names that explain what's being tested
- Include requirement reference in documentation
- Use consistent naming pattern

### Test Documentation
Each test should have:
- Clear name describing behavior
- Documentation linking to spec requirement
- Arrange-Act-Assert structure (or Given-When-Then)

## Integration with STDD Workflow

TDD is **STEP 2** of the spec-test-driven development workflow:

1. Write Spec (use `spec` skill)
2. **Write Tests** ← (use this `tdd` skill)
3. Implement Code (minimal code to pass tests)

When writing tests:
1. Reference spec requirements in test documentation
2. Follow test organization from spec sections
3. Write tests in order of requirements
4. One test per requirement (sometimes multiple tests if complex)

## Common Mistakes to Avoid

### ❌ Writing Multiple Tests Before Implementing
**Wrong:**
```
Write test_1
Write test_2
Write test_3
Implement all features
Run all tests
```

**Correct:**
```
Write test_1 → Run (RED) → Implement → Run (GREEN) → Verify all tests
Write test_2 → Run (RED) → Implement → Run (GREEN) → Verify all tests
Write test_3 → Run (RED) → Implement → Run (GREEN) → Verify all tests
```

### ❌ Not Running Tests Enough
- Skipping the RED phase (not verifying test fails)
- Skipping the GREEN phase (not verifying test passes)
- Skipping the VERIFY phase (not running all tests)

### ❌ Over-Implementing
- Adding features not yet tested
- Writing more code than needed to pass the test
- Implementing based on assumptions rather than tests

### ❌ Writing Bad Tests
- Tests that don't fail when they should
- Tests with multiple assertions (unless intrinsically coupled)
- Tests that don't clearly document what they're testing

## Checklist Before Moving to Next Test

Use this checklist for EVERY test **in this exact order**:

1. [ ] Test written with clear name and documentation
2. [ ] Test references specific requirement from spec
3. [ ] **Test run in isolation and FAILED (RED)** ✓ ← DO NOT SKIP THIS
4. [ ] Minimal implementation written (ONLY after seeing RED)
5. [ ] Test run in isolation and PASSED (GREEN) ✓
6. [ ] ALL tests run and PASSED (VERIFY) ✓
7. [ ] **SPEC.md updated with test marker** ([U][O] or [A][O]) ✓
8. [ ] **SPEC.md updated with implementation marker** ([U][X] or [A][X]) if code complete ✓
9. [ ] Code refactored if needed (optional)
10. [ ] ALL tests still pass after refactoring
11. [ ] No broken tests
12. [ ] Ready for next test

**Critical reminder:** Steps 3-6 MUST happen in order:
- RED (test fails) → then implement → GREEN (test passes) → then VERIFY (all tests pass)

