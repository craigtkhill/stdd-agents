---
name: refactoring-code
description: Use during REFACTOR phase of TDD (after GREEN), when logic is duplicated, or when locality of behavior is violated. Defines search-first workflow, duplication detection, locality principles, and safe refactoring practices.
---

# Refactoring Code Skill

This skill provides detailed guidance for the **REFACTOR** phase of the RED-GREEN-REFACTOR cycle and for any situation where code structure needs improvement without changing behavior.

**When to use this skill:**
- After tests pass (GREEN phase complete) — this is the standard TDD trigger
- When duplicated logic is identified anywhere in the codebase
- When behavior is scattered across distant locations (locality of behavior violated)
- Before implementing new features that may duplicate existing patterns
- During code reviews to improve code quality

## Core Principles

### 1. Refactor After GREEN in TDD

Refactoring belongs **exclusively** in the REFACTOR phase — never while RED or during GREEN.

```
RED   → Write a failing test (no refactoring here)
GREEN → Write minimal code to pass (no refactoring here)
REFACTOR → Improve structure NOW ← (this skill)
VERIFY → Run all tests again
REPEAT → Next test
```

The GREEN phase produces working but possibly messy code. The REFACTOR phase is the designated time to clean it up. Mixing feature work and refactoring in the same step makes both harder and riskier.

### 2. Duplicate Logic Must Be Refactored Out

Duplicated logic is not just a style concern — it is a correctness risk. When the same logic exists in two places, a bug fix or behavior change applied to one copy will silently leave the other broken.

**Triggers that require refactoring:**
- The same code block appears in two or more places
- Similar logic with only surface-level variation (different variable names, minor structural differences)
- Repeated error handling patterns
- Multiple implementations of the same algorithm
- Similar data validation or transformation logic in separate locations

**Apply the rule of three:** the first occurrence is fine, the second is a warning, the third is a mandate to extract.

### 3. Locality of Behavior

**Definition:** Behavior that belongs to a concept should live close to that concept. Code that changes together should live together.

**Locality of behavior means:**
- A function's validation logic lives next to the function, not in a distant utility module
- A component's event handling lives in the component, not spread across helpers
- Related transformations are grouped, not scattered across the codebase
- Side effects are co-located with the action that causes them

**Violations to watch for:**
- Logic split across many files with no clear home
- Behavior that only makes sense in context of X, but lives far from X
- Helpers that are only ever called from one place (pull them closer)
- Configuration and its consumer separated by many layers

**Balancing locality vs. deduplication:**
- When two distant pieces of code share logic, prefer extracting to a well-named shared location over copying
- When a helper is only used in one place, keep it local to that place
- When splitting a file, keep tightly coupled concepts in the same module

---

## Refactoring Workflow

### Phase 1: Search for Existing Patterns

**Always search before implementing new functionality.**

Use code search tools to find:
- Similar function names or patterns
- Duplicate logic or algorithms
- Existing abstractions that could be extended
- Related utilities or helpers

**Search strategies:**
- Grep for similar function/method names
- Search for similar algorithm patterns
- Look for related types or interfaces
- Check for existing error handling patterns
- Search for similar data transformations

### Phase 2: Analyze Duplication

When similar code is found, evaluate:

**Questions to ask:**
- Is this duplication intentional or accidental?
- Do these implementations handle the same concept?
- Can they be unified without increasing complexity?
- Is there a common abstraction that emerges?

**Red flags for duplication:**
- Copy-pasted code with minor variations
- Similar logic in different locations
- Repeated error handling patterns
- Multiple implementations of same algorithm
- Similar data validation or transformation logic

### Phase 3: Choose Refactoring Strategy

**1. Extract Function/Method**
- When: Same code block appears multiple times
- Action: Extract to shared function
- Benefit: Single source of truth

**2. Parameterize Function**
- When: Similar functions with minor variations
- Action: Add parameters to handle variations
- Benefit: Reduces function count

**3. Move Closer (Locality Fix)**
- When: A helper is only ever called from one place
- Action: Move the helper next to its caller
- Benefit: Easier to understand and change together

**4. Extract Common Interface/Trait**
- When: Multiple types share similar behavior
- Action: Define shared interface
- Benefit: Polymorphic usage

**5. Introduce Abstraction Layer**
- When: Complex logic duplicated across features
- Action: Create abstraction that handles complexity
- Benefit: Simpler calling code

**6. Use Existing Abstraction**
- When: Functionality fits existing abstraction
- Action: Extend or modify existing abstraction
- Benefit: Consistency with codebase patterns

**7. Keep Duplication**
- When: Concepts are fundamentally different despite similar code
- When: Unification would increase coupling inappropriately
- When: Code will diverge in future
- Action: Document why duplication is intentional
- Benefit: Avoids premature abstraction

### Phase 4: Refactor Safely

**Safety rules for refactoring:**

1. **All tests must be GREEN before starting**
   - Never refactor with failing tests
   - Tests are your safety net

2. **Make small, incremental changes**
   - One refactoring at a time
   - Run tests after each change
   - Commit frequently

3. **Run ALL tests after each change**
   - Ensures no regression
   - Catches unintended side effects
   - Maintains confidence

4. **If tests fail, revert immediately**
   - Don't try to fix forward
   - Revert and try a different approach
   - Take smaller steps if needed

5. **Keep refactoring separate from feature work**
   - Don't mix refactoring and new features in the same commit
   - Refactoring commits must not change behavior
   - Feature commits add new behavior

### Phase 5: Verify and Document

After refactoring:

**Verification checklist:**
- [ ] All tests still pass
- [ ] No new compiler warnings
- [ ] Code is more readable
- [ ] Variable and function names are descriptive (no single-letter or abbreviated names)
- [ ] Duplication is reduced or eliminated
- [ ] Locality of behavior is improved or preserved
- [ ] Performance is not degraded
- [ ] Documentation is updated

---

## Integration with TDD Workflow

Refactoring belongs in **Step 4** of the RED-GREEN-REFACTOR cycle:

1. **RED**: Write a failing test
2. **GREEN**: Write minimal code to pass
3. **VERIFY**: Run all tests
4. **REFACTOR**: Improve code quality ← (this skill)
5. **VERIFY**: Run all tests again
6. **REPEAT**: Next test

**When implementing new features:**
1. Search for existing similar patterns (use this skill)
2. Decide: refactor existing code vs. create new
3. If refactoring: do it before adding the new feature
4. Then proceed with the TDD cycle for the new feature

---

## Refactoring Anti-Patterns

### Premature Abstraction
**Problem:** Creating abstractions before the pattern is understood
**Solution:** Follow "rule of three" — wait until duplication appears 3 times

### Over-Engineering
**Problem:** Creating overly complex abstractions for simple duplication
**Solution:** Keep refactoring simple and focused

### Breaking Encapsulation
**Problem:** Exposing internals to reduce duplication
**Solution:** Sometimes duplication is better than bad coupling

### Big Bang Refactoring
**Problem:** Changing too much at once
**Solution:** Small, incremental changes with test verification after each

### Refactoring Without Tests
**Problem:** Changing code without a safety net
**Solution:** Write tests first if they don't exist

### Cryptic Naming
**Problem:** Single-letter variables, abbreviations, or terse names that obscure intent (e.g. `d`, `tmp`, `val`, `mgr`)
**Solution:** Use full, descriptive names that reveal purpose — rename during the REFACTOR phase whenever cryptic names are encountered

### Locality Violation Through Deduplication
**Problem:** Extracting shared logic to a distant utility file when it only serves one context
**Solution:** Keep helpers close to their only consumer; extract only when genuinely shared

---

## When NOT to Refactor

**Skip refactoring when:**
- Tests are not passing (fix tests first)
- Code will be deleted soon
- Time pressure is extreme (add a TODO instead)
- Concepts are fundamentally different despite similar code
- Refactoring would introduce inappropriate coupling

---

## Practical Checklist

Before writing new code:
- [ ] Search codebase for similar functionality
- [ ] Review existing abstractions in the area
- [ ] Check if existing code can be extended
- [ ] Consider refactoring existing code first
- [ ] Document decision (refactor vs. new code)

During refactoring:
- [ ] All tests passing before starting
- [ ] Make one small change at a time
- [ ] Run all tests after each change
- [ ] Commit working changes frequently
- [ ] Revert if tests fail

After refactoring:
- [ ] All tests still passing
- [ ] Code is more maintainable
- [ ] Duplication reduced or eliminated
- [ ] Locality of behavior preserved or improved
- [ ] Documentation updated
- [ ] No performance regression

---

## File Organization

**For guidance on splitting large files into modules:**
See [FILE-ORGANIZATION.md](FILE-ORGANIZATION.md) for guidelines on when and how to split files.
