---
name: acceptance-test
description: Use when writing acceptance tests or adding scenarios to spec.yaml. Defines Given/When/Then format and acceptance test patterns.
---

# Acceptance Test Skill

This skill defines how to write acceptance tests and scenarios that validate end-to-end feature behavior.

## When to Write Acceptance Tests

Write acceptance tests when the feature requires end-to-end testing across multiple modules or external dependencies.

- Testing complete user workflows that involve external APIs, databases, or services
- Verifying business requirements are satisfied across module boundaries
- Testing features that span multiple units within the feature
- When a test requires mocking dependencies, it should be an acceptance test

If the feature only involves isolated logic within a single module, use unit tests instead.

## Scenarios in spec.yaml

Scenarios live in the `scenarios` section of spec.yaml. Only add scenarios when the feature requires end-to-end testing with other modules. Ask the user if scenarios apply before adding them.

```yaml
scenarios:
  - name: Descriptive scenario name
    given: Setup/preconditions
    when: User action/trigger
    then: Expected outcome/verification
```

**Describe WHAT, not HOW:**
- Focus on user behavior and system outcomes
- Avoid implementation details (field names, status codes, internal states)
- Describe the value and intent, not the mechanics
- Keep scenarios at a high level of abstraction

**Cover end-to-end flows:**
- Start with user perspective
- Verify final state

## Acceptance Test Structure

Acceptance tests follow the Given/When/Then pattern from scenarios:

- **Given** — Setup/preconditions
- **When** — User action/trigger
- **Then** — Expected outcome/verification

Each acceptance test should map to a scenario in spec.yaml.

## Acceptance Tests vs Unit Tests vs Integration Tests

**Unit Tests:**
- Test individual functions/classes in isolation
- Fast, focused, and run frequently
- Marked with `test: unit` in spec.yaml

**Acceptance Tests:**
- Test complete features from a user/business perspective
- Verify requirements are met end-to-end within a feature
- Test scenarios from the spec (Given/When/Then)
- May involve multiple units working together
- Marked with `test: acceptance` in spec.yaml

**Integration Tests:**
- Test interactions between multiple modules or external systems
- Use sparingly and only for tactical purposes
- Located in `tests/` directory at project root

**Test hierarchy:** Default to unit tests. Use acceptance tests when you need end-to-end feature validation. Use integration tests sparingly for tactical external integration needs.

## Updating spec.yaml Markers

- After writing acceptance test that passes: `test: to-implement` → `test: acceptance`
- After code passes acceptance test: `code: to-implement` → `code: done`
- When acceptance test passes, mark related unit-tested features as implemented: `code: to-implement` → `code: done`
