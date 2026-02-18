---
name: update-dependencies
description: Use when updating existing pinned dependencies. Defines unpin-resolve-repin workflow with test verification and rollback on failure.
---

# Update Dependencies

Updates pinned dependency versions safely by letting the package manager resolve new versions, then repinning and verifying with tests.

## Scope

Decide what to update before starting:

- **Single package**: Update one specific dependency
- **All packages**: Update every dependency in the project

## Workflow

### 1. Snapshot current state

Save the current dependency file and lock file so you can rollback:

```bash
git stash --include-untracked -m "pre-dependency-update"
```

Or simply rely on `git checkout` if the working tree is clean.

### 2. Unpin versions

Remove version pins from the dependencies you want to update:

- **Single package**: Remove the version pin from that one entry
- **All packages**: Remove version pins from all entries

### 3. Resolve new versions

Run the package manager to resolve and install the latest compatible versions.

- **Single package**: Use the package manager's targeted upgrade command
- **All packages**: Use the package manager's full upgrade command

### 4. Read resolved versions

Read the resolved versions from the install output or lock file.

### 5. Repin exact versions

Update the dependency file with the exact versions the resolver chose.

### 6. Verify resolution is consistent

Run the package manager again to confirm the pinned versions match.

### 7. Run tests

Run the full test suite to verify nothing broke.

### 8. Handle test failure

If tests fail after updating:

1. Identify which dependency caused the failure
2. Rollback to the previous state
3. Report which dependency and version caused the issue
4. Consider updating dependencies individually to isolate the problem

## Language-Specific Details

- Python: See [PYTHON.md](PYTHON.md)
