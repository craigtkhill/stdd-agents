---
name: install-dependencies
description: Use when adding project dependencies. Defines dependency management rules and language-specific patterns.
---

# Install Dependencies

## Philosophy

**Core Principle**: Let package managers resolve versions, then pin the exact version they resolved to in the dependency file. This gives you fully reproducible builds.

## Why This Approach

1. **Package managers are smarter**: Modern package managers (uv, npm, cargo) resolve compatible versions automatically
2. **Pinning after resolution**: Recording the exact resolved version ensures builds are reproducible even without a lock file
3. **Explicit updates**: Dependencies only change when you actively choose to update them
4. **No surprises**: A fresh install always gets exactly what was tested

## Universal Rules

### ✅ DO:
- Add the dependency name without a version to the dependency file
- Run the package manager to resolve and install
- Read the resolved version from the install output or lock file
- Update the dependency file to pin the exact resolved version
- Keep dependencies in alphabetical order
- Commit both the dependency file and the lock file

### ❌ DON'T:
- Guess version numbers before running the resolver
- Use loose ranges (`>=`, `~=`, `^`) — pin exactly what was resolved
- Skip the resolution step and manually look up versions

## Workflow

1. **Add dependency name** (no version) to the dependency file
2. **Run the package manager** to resolve and install
3. **Read the resolved version** from the install output
4. **Update the dependency file** with the exact resolved version
5. **Verify**: Run the package manager again to confirm everything is consistent
6. **Commit**: Both the dependency file and the lock file

## Language-Specific Details

For language-specific syntax and examples:
- Python: See [PYTHON.md](PYTHON.md)
- TypeScript/JavaScript: See [TYPESCRIPT.md](TYPESCRIPT.md)
- Rust: See [RUST.md](RUST.md)
