# Rust Dependency Management

## File Location

Rust dependencies are declared in `Cargo.toml`:

```toml
[dependencies]
package-name = "*"
```

## ❌ WRONG - Do NOT specify versions:

```toml
[dependencies]
serde = "1.0"           # ❌ NO!
tokio = "1.35"          # ❌ NO!
axum = ">=0.7.0"        # ❌ NO!
```

## ✅ CORRECT - Use wildcard for latest:

```toml
[dependencies]
serde = "*"             # ✅ YES!
tokio = "*"             # ✅ YES!
axum = "*"              # ✅ YES!
```

## Package Manager Commands

Rust uses **cargo** for dependency management:

### Add a dependency:
```bash
# Just add the name to Cargo.toml dependencies, then:
cargo build
```

### Update dependencies:
```bash
cargo update
```

### Install project:
```bash
cargo build
```

## Lock File

Rust uses `Cargo.lock` to lock resolved versions. Always commit this file after adding/updating dependencies.

## Alphabetical Ordering

Keep dependencies in alphabetical order for easier management:

```toml
[dependencies]
axum = "*"
serde = "*"
tokio = "*"
```
