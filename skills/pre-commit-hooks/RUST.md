# Pre-Commit Hooks: Rust

Rust projects use the following hooks. Pre-commit hooks run on every commit; pre-push hooks run on push.

## Pre-Commit Hooks

### cargo-fmt

Enforces consistent code formatting.

```yaml
- id: cargo-fmt
  name: cargo fmt
  entry: cargo fmt --all --check
  language: system
  pass_filenames: false
  types: [rust]
```

### cargo-clippy

Runs the Rust linter and fails on any warnings.

```yaml
- id: cargo-clippy
  name: cargo clippy
  entry: cargo clippy --all-targets -- -D warnings
  language: system
  pass_filenames: false
  types: [rust]
```

### tests-above-impl

Enforces that `#[cfg(test)]` modules appear before any `pub fn` / `pub async fn` in every staged Rust source file. Reinforces test-first development by keeping tests visible at the top of the file.

```yaml
- id: tests-above-impl
  name: tests above impl
  entry: scripts/check-tests-above-impl.sh
  language: script
  types: [rust]
  exclude: ^target/
```

#### Hook Script

Save as `scripts/check-tests-above-impl.sh`:

```bash
#!/usr/bin/env bash
# Enforce that #[cfg(test)] modules appear before any pub fn / pub async fn
# in every staged Rust source file.
set -euo pipefail

failed=0

for file in "$@"; do
    [[ "$file" == *.rs ]] || continue

    test_line=$(grep -n '#\[cfg(test)\]' "$file" 2>/dev/null | head -1 | cut -d: -f1 || true)
    impl_line=$(grep -n '^\s*pub\(\(super\)\|(crate)\)\?\s\+\(async\s\+\)\?fn ' "$file" 2>/dev/null | head -1 | cut -d: -f1 || true)

    # No test module at all — skip (not every file needs tests)
    [[ -z "$test_line" ]] && continue

    # Has tests but no pub fn — fine
    [[ -z "$impl_line" ]] && continue

    if (( impl_line < test_line )); then
        echo "FAIL $file: pub fn at line $impl_line appears before #[cfg(test)] at line $test_line"
        failed=1
    fi
done

exit $failed
```

## Pre-Push Hooks

### cargo-test

Runs the full test suite before pushing.

```yaml
- id: cargo-test
  name: cargo test
  entry: cargo test
  language: system
  pass_filenames: false
  stages: [pre-push]
```

### cargo-audit

Checks dependencies for known security vulnerabilities.

```yaml
- id: cargo-audit
  name: cargo audit
  entry: cargo audit
  language: system
  pass_filenames: false
  stages: [pre-push]
```

### cargo-deny

Checks dependency licenses, bans, and advisories.

```yaml
- id: cargo-deny
  name: cargo deny
  entry: cargo deny check
  language: system
  pass_filenames: false
  stages: [pre-push]
```

### cargo-llvm-cov

Enforces a minimum line coverage threshold.

```yaml
- id: cargo-llvm-cov
  name: cargo coverage
  entry: cargo +nightly llvm-cov --lib --fail-under-lines <threshold>
  language: system
  pass_filenames: false
  stages: [pre-push]
```
