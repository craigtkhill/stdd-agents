---
name: tdd
description: Test-Driven Development workflow using RED-GREEN-REFACTOR cycle - write one test, see it fail, implement minimal code, verify all tests pass, repeat
---

# Test-Driven Development (TDD) Skill

This skill defines the proper TDD workflow: write ONE test, run it (RED), implement minimal code (GREEN), run ALL tests, repeat.

**Language-specific details**:
- For Python projects: See `tdd/PYTHON.md` for pytest patterns, running tests, and Python-specific examples
- Other languages: Add new files to `tdd/` directory as needed

## TDD Cycle: RED → GREEN → REFACTOR

### 1. RED: Write ONE Failing Test

Write a SINGLE test that fails.

**Key principle**: The test must fail for the right reason (missing implementation, not syntax error).

**Run the test - it MUST fail:**
- Run only the new test in isolation
- Verify it fails with expected error (import error, assertion failure, etc.)
- Expected outcome: RED (test fails)

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

### 4. REPEAT: Next Test

Only after all tests pass, write the NEXT single test and repeat the cycle.

## TDD Rules

### Rule 1: One Test at a Time
- ❌ Do NOT write multiple tests before implementing
- ❌ Do NOT write all tests upfront
- ✅ DO write ONE test → implement → verify → next test

### Rule 2: Always Run Tests
Every test goes through three runs:
1. Run new test **in isolation** to see it fail (RED)
2. Run same test **in isolation** to see it pass (GREEN)
3. Run **ALL tests** in the project to verify nothing broke (VERIFY)

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
- One assertion per test (unless performance-critical)
- Clear test names describe what's being tested

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
│ 1. Write ONE test for requirement              │
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
│ 3. Write minimal implementation                │
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
│ 5. Run ALL tests                               │
│    Expected: All PASS                          │
└────────────────┬────────────────────────────────┘
                 │
            All pass? ──No──> Fix broken tests
                 │
                Yes
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│ 6. More requirements? ──Yes──> Repeat          │
│                        │                        │
│                       No                        │
│                        │                        │
│                        ▼                        │
│                     Done                        │
└─────────────────────────────────────────────────┘
```

## Test Organization

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
- Tests with multiple assertions (test too broad)
- Tests that don't clearly document what they're testing

## Checklist Before Moving to Next Test

Use this checklist for EVERY test:

- [ ] Test written with clear name and documentation
- [ ] Test references specific requirement from spec
- [ ] Test run in isolation and failed (RED) ✓
- [ ] Minimal implementation written
- [ ] Test run in isolation and passed (GREEN) ✓
- [ ] ALL tests run and passed (VERIFY) ✓
- [ ] No broken tests
- [ ] Ready for next test

