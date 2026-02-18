# Python Dependency Management

## File Location

Python dependencies are declared in `pyproject.toml`:

```toml
[project]
dependencies = [
    "package-name==1.2.3",
]
```

## Workflow Example

### Step 1: Add dependency name without version, then resolve:
```toml
dependencies = [
    "requests",
]
```

```bash
uv sync
```

### Step 2: Read the resolved version from the install output:
```
Installed 1 package in 50ms
 + requests==2.32.3
```

### Step 3: Pin the exact version in pyproject.toml:
```toml
dependencies = [
    "requests==2.32.3",
]
```

### Step 4: Verify:
```bash
uv sync
```

## Package Manager Commands

This project uses **uv** for Python dependency management:

### Install/sync project:
```bash
uv sync
```

### Update a specific dependency:
```bash
uv sync --upgrade-package package-name
```
Then update the pinned version in `pyproject.toml` to match.

### Update all dependencies:
```bash
uv sync --upgrade
```
Then update all pinned versions in `pyproject.toml` to match.

## Lock File

Python uses `uv.lock` to lock resolved versions. Always commit this file after adding/updating dependencies.

## Alphabetical Ordering

Keep dependencies in alphabetical order for easier management:

```toml
dependencies = [
    "boto3==1.40.20",
    "logfire==3.1.0",
    "pydantic==2.11.4",
]
```
