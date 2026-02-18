# Python Dependency Updates

## Single Package Update

### Step 1: Remove the version pin from pyproject.toml
```toml
# Before
"requests==2.31.0",
# After
"requests",
```

### Step 2: Resolve with targeted upgrade
```bash
uv sync --upgrade-package requests
```

### Step 3: Read the resolved version from the output
```
Installed 1 package in 50ms
 + requests==2.32.3
```

### Step 4: Repin in pyproject.toml
```toml
"requests==2.32.3",
```

### Step 5: Verify
```bash
uv sync
```

### Step 6: Run tests
```bash
uv run pytest -v
```

## All Packages Update

### Step 1: Remove all version pins from pyproject.toml
Remove `==X.Y.Z` from every dependency entry.

### Step 2: Resolve with full upgrade
```bash
uv sync --upgrade
```

### Step 3: Read resolved versions
```bash
uv pip list --format=columns
```

### Step 4: Repin all versions in pyproject.toml
Update each dependency with the exact version from the output.

### Step 5: Verify
```bash
uv sync
```

### Step 6: Run tests
```bash
uv run pytest -v
```

## Rollback on failure

```bash
git checkout -- pyproject.toml uv.lock
uv sync
```
