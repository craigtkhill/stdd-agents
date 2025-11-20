# Python Dependency Management

## File Location

Python dependencies are declared in `pyproject.toml`:

```toml
[project]
dependencies = [
    "package-name",
]
```

## ❌ WRONG - Do NOT specify versions:

```toml
dependencies = [
    "pydantic>=2.0",                      # ❌ NO!
    "requests~=2.31.0",                   # ❌ NO!
]
```

## ✅ CORRECT - Omit versions entirely:

```toml
dependencies = [
    "pydantic",                  # ✅ YES!
    "requests",                  # ✅ YES!
]
```

## Package Manager Commands

This project uses **uv** for Python dependency management:

### Add a dependency:
```bash
# Just add the name to pyproject.toml dependencies list, then:
uv sync
```

### Update dependencies:
```bash
uv sync --upgrade
```

### Install project:
```bash
uv sync
```

## Lock File

Python uses `uv.lock` to lock resolved versions. Always commit this file after adding/updating dependencies.

## Alphabetical Ordering

Keep dependencies in alphabetical order for easier management:

```toml
dependencies = [
    "boto3",
    "logfire",
    "mlflow",
    "pydantic",
    "pydantic-ai",
    "python-dotenv",
]
```
