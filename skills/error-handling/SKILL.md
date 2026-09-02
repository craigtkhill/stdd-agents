---
name: error-handling
description: Use when writing, reviewing, or refactoring a try/except (or try/catch) block, or any edge-case branch guarding against a failure. Defines when to add a handler, when to remove one, and how to justify keeping it.
---

# Exception Handling

## Overview

An exception handler (or an edge-case branch guarding against a failure) is a piece of code that exists to change behavior when something goes wrong. Like any other code, it must be justified — either it protects a boundary that requires it, or evidence shows the failure it guards against actually occurs. A handler with neither justification hides bugs, adds a dead code path, and makes the real failure (if it ever happens) harder to find.

**When to use this skill:**
- Writing a new `try/except` or edge-case branch
- Reviewing an existing one and unsure if it should stay
- During the REFACTOR phase of TDD, cleaning up handlers added during GREEN
- Auditing a file for handlers that no longer match how the code is used

## Process

### 1. Classify the handler

Before writing or keeping a handler, identify which case it is:

- **Boundary handling** — validates or catches at a trust boundary: user input, an external API call, a file/network operation, a documented error contract. Required regardless of whether the failure has been observed yet, because the boundary itself is the risk.
- **Defensive handling** — guards against a failure inside code you control, or a case "that could happen." Not required by a boundary; must be justified by evidence (see step 2).

### 2. For defensive handling, require evidence

Keep or add the handler only when evidence shows the case occurs:

- A log entry, error report, or monitoring alert showing the failure happened
- A bug report or support ticket describing the case
- A test that exercises the real case (not one written after the fact just to justify the handler)

Not evidence: "this could theoretically fail," "just in case," or habit carried over from another codebase.

### 3. Decide

- Boundary handling → keep it. Handle the specific documented failure mode, not a broad catch-all.
- Defensive handling with evidence → keep it. Reference the evidence in a comment only if the trigger is non-obvious from the code.
- Defensive handling without evidence → remove it. Let the failure propagate (exception surfaces, program errors loudly) until evidence justifies handling it.

### 4. Keep the handler narrow

- Catch the specific exception type or error case, not a broad catch-all (`except Exception`, `catch (e)`).
- Handle the failure at the point where something meaningful can be done about it (retry, fall back, surface to the user) — not just to swallow it.
- Don't catch an exception only to re-raise the same thing with a generic message; let it propagate instead.

## Related Skills

**Use the `refactoring-code` skill for the broader REFACTOR phase this fits into.**
