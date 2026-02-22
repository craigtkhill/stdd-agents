---
name: specification
description: Use when writing or updating spec.yaml files. Defines requirement format and user story structure.
---

# Specification Writing Skill

This skill defines how to write specifications that follow the project's conventions.
**CRITICAL:** Stick to the Domain Specific Language in this document. Do not add your own extra keys or structure.

## Specification Location

**Specifications live close to the code** following the principle of locality of behavior:

- Spec filename: `spec.yaml`
- Location: In the same directory as the code it specifies, or in a feature-specific subdirectory
- Example: `src/feature/spec.yaml`

## Specification Format

Every spec.yaml file must follow this YAML structure:

```yaml
feature:
  name: Brief Feature Title
  as_a: user role
  i_want: goal/capability
  solutions:
    - Solution 1
    - Solution 2

requirements:
  - id: REQ-XXX-001
    test: to-implement
    code: to-implement
    description: Specific, testable requirement
  - id: REQ-XXX-002
    test: to-implement
    code: to-implement
    description: Another specific requirement
```

### Feature Section

The `feature` section captures the user story and possible solutions.

- `name`: Brief title for the feature
- `as_a`: The end user role (always from the user's perspective, never a system component)
- `i_want`: The goal or capability (what they want)
- `solutions`: List of possible implementation approaches

**Rationale for User Goals + Possible Solutions:**
- Focus on WHAT the user wants to achieve, not a specific HOW
- Acknowledge that multiple solutions may exist to meet the user's goal
- Solutions should be considered throughout implementation
- Design the codebase to be modular enough to swap solutions without major refactoring
- Keeps options open until implementation details are needed

### Requirements Section

**Status markers for `test` field:**
- `to-implement` = not yet implemented
- `unit` = implemented via unit test
- `acceptance` = implemented via acceptance test
- `wont-implement` = intentionally not tested

**Status markers for `code` field:**
- `to-implement` = not yet implemented
- `done` = implemented
- `wont-implement` = intentionally not implemented

**Requirements are a flat list — do NOT nest or group them.** Grouping by category creates artificial structure that encourages duplication and makes it harder to maintain sequential numbering.

**Requirement naming:**
- Use feature-specific prefix for the `id`
- Number sequentially starting from 001
- Sequentiality does not need to be enforced (reduce work renumbering)
  - You can skip numbers if a requirement is removed
  - Add characters if adding a requirement between other requirements
- Keep requirements atomic and testable
- One requirement per list item

**CRITICAL - Atomic Requirements:**
- Each requirement must test ONE specific thing
- If a requirement has "and" or lists multiple attributes, split it into separate requirements
- Each requirement should map to one test (or a small set of closely related tests)

**CRITICAL - User-Facing Requirements Only:**
- Requirements must describe FEATURES from the user's perspective
- Each requirement should be stated ONLY ONCE in the spec
- DO NOT create separate requirements for implementation details

**CRITICAL - No Implementation Details in Requirements:**
- Requirements must describe WHAT the system does, never HOW it does it
- DO NOT name specific libraries, frameworks, or tools in requirements
- Library/tool choices belong in the `solutions` list, not in requirements
- A requirement should remain valid even if the underlying implementation is swapped

**CRITICAL - Do Not Duplicate Existing Functionality:**
- Before writing any requirement, check whether the behavior is already implemented and tested in an existing module
- If the feature reuses existing infrastructure do NOT add requirements for that infrastructure
- Only specify behavior that is NEW to this feature

**Before adding a requirement, ask:**
1. Is this something the user directly experiences or cares about?
2. Have I already stated this requirement elsewhere in the spec or in another spec file?
3. Is this describing WHAT the system does for the user, or HOW it does it internally?
4. Is this behavior already implemented and tested in an existing module that this feature will reuse?

### Scenarios Section (Optional)

**Use the `acceptance-test` skill for writing scenarios and acceptance tests.**

Scenarios are only needed when the feature requires end-to-end testing across multiple modules. Ask the user if scenarios apply before adding them.

## Integration with STDD Workflow

This spec skill is **STEP 1** of the spec-test-driven development workflow:

1. **Write Spec** ← (this skill)
2. Write Tests (based on spec requirements)
3. Implement Code (to pass tests)

After completing the spec:
1. Get user approval
2. Proceed to writing tests based on requirements using TDD
3. Follow stdd skill for remaining steps
