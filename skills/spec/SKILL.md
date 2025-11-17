---
name: spec
description: Write specifications following project conventions - includes requirement format, scenario structure, and Given/When/Then patterns
---

# Specification Writing Skill

This skill defines how to write specifications that follow the project's conventions.

## Specification Format

Every spec.md file must follow this structure:

### 1. Feature Header
```markdown
# {Feature Name} Specification

## Feature: {Brief Feature Title}
As a {user role}
I want to {capability}
So that {benefit}
```

### 2. Requirements Section
```markdown
## Requirements
Format: `[IS-TEST-IMPLEMENTED][IS-CODE-IMPLEMENTED] IDENTIFIER: example case`
- U = implemented via unit test
- A = implemented via acceptance test
- X = implemented
- O = not yet implemented
```

### 3. Organized Requirements
Group requirements into logical sections:

**Requirement format:**
```markdown
- [O][O] REQ-XXX-001: {Specific, testable requirement}
- [O][O] REQ-XXX-002: {Another specific requirement}
```

**Requirement naming:**
- Use feature-specific prefix
- Number sequentially starting from 001
- Keep requirements atomic and testable
- One requirement per line

### 4. Scenarios

**Use Given/When/Then format:**
- **Given** - Setup/preconditions
- **When** - User action/trigger
- **Then** - Expected outcome/verification
- **And** - Additional clauses for any section

**Describe WHAT, not HOW:**
- Focus on user behavior and system outcomes
- Avoid implementation details (field names, status codes, internal states)
- Describe the value and intent, not the mechanics
- Keep scenarios at a high level of abstraction

**Cover end-to-end flows:**
- Start with user perspective
- Verify final state

## Integration with STDD Workflow

This spec skill is **STEP 1** of the spec-test-driven development workflow:

1. **Write Spec** ← (this skill)
2. Write Tests (based on spec requirements)
3. Implement Code (to pass tests)

After completing the spec:
1. Get user approval
2. Proceed to writing tests based on requirements using TDD
3. Follow stdd skill for remaining steps
