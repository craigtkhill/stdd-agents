# File Organization for Rust

Rust-specific guidelines for organizing files and modules.

## Rust Module System Basics

**Key concepts:**
- Each file or directory is a module
- `mod.rs` or `lib.rs` are module entry points
- `pub` controls visibility
- `pub use` creates convenience re-exports

## Rust Module Organization

### Single File Module

**Before splitting (`src/feature.rs`):**
```rust
// src/feature.rs
pub struct Model { }
pub fn handle() { }
fn internal_helper() { }
```

**Usage:**
```rust
use crate::feature::{Model, handle};
```

### Directory Module

**After splitting (`src/feature/`):**

```rust
// src/feature/mod.rs
pub mod models;
mod internal;

pub use models::Model;
pub use internal::handle;
```

```rust
// src/feature/models.rs
pub struct Model { }
```

```rust
// src/feature/internal.rs
pub fn handle() { }
fn helper() { }  // Private to this module
```

**Usage (unchanged):**
```rust
use crate::feature::{Model, handle};  // Still works!
```

## Splitting a Rust File

### Step 1: Create Module Directory

```bash
# For src/feature.rs becoming src/feature/
mkdir src/feature
```

### Step 2: Create mod.rs

```rust
// src/feature/mod.rs
pub mod models;
pub mod handlers;

// Re-export for backwards compatibility
pub use models::{Model1, Model2};
pub use handlers::handle_action;
```

### Step 3: Move Code to Submodules

**Extract models:**
```rust
// src/feature/models.rs
pub struct Model1 { }
pub struct Model2 { }
```

**Extract handlers:**
```rust
// src/feature/handlers.rs
use super::models::Model1;

pub fn handle_action(model: &Model1) { }
```

### Step 4: Update Parent Module

```rust
// src/lib.rs or src/main.rs
pub mod feature;  // Points to src/feature/mod.rs now

// Re-exports still work
pub use feature::{Model1, handle_action};
```

### Step 5: Run Tests

```bash
cargo test
cargo clippy
cargo build
```

## Visibility Control

### Public Module, Public Items
```rust
// mod.rs
pub mod models;  // Module is public

// models.rs
pub struct Model { }  // Item is public
```
**Result**: `crate::feature::models::Model` accessible

### Public Module, Re-exported
```rust
// mod.rs
pub mod models;
pub use models::Model;  // Convenience re-export

// models.rs
pub struct Model { }
```
**Result**: Both `crate::feature::Model` and `crate::feature::models::Model` work

### Private Module, Re-exported
```rust
// mod.rs
mod models;  // Module is private
pub use models::Model;  // But re-export the type

// models.rs
pub struct Model { }
```
**Result**: Only `crate::feature::Model` accessible (encapsulation)

## Common Rust Patterns

### Pattern 1: Public API Module

```rust
// mod.rs - clean public API
pub mod api;
mod internal;

pub use api::{PublicType, public_function};
// internal not exposed
```

### Pattern 2: Tests in Same File

```rust
// models.rs
pub struct Model { }

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_model() { }
}
```

**Note**: Tests add lines but that's OK. Consider splitting at 400-500 for files with tests.

### Pattern 3: Feature Modules

```rust
// lib.rs
pub mod user;
pub mod order;
pub mod payment;

// user/mod.rs
pub mod authentication;
pub mod authorization;
pub mod profile;

pub use authentication::login;
pub use authorization::check_permission;
```

## Rust-Specific Best Practices

### Use `mod.rs` for Orchestration

```rust
// feature/mod.rs - orchestrates submodules
pub mod models;
pub mod services;
pub mod utils;

// Re-export main API
pub use models::MainModel;
pub use services::MainService;
// utils stays internal
```

### Keep Private by Default

```rust
// Only expose what's needed
mod internal;  // Private module

pub mod public_api;  // Public module
pub use public_api::PublicType;  // Convenient access
```

### Use `pub(crate)` for Internal APIs

```rust
// Visible within crate but not externally
pub(crate) struct InternalHelper { }
pub(crate) fn internal_utility() { }
```

### Avoid Circular Dependencies

```rust
// ❌ BAD: Circular dependency
// a.rs
use crate::b::TypeB;

// b.rs
use crate::a::TypeA;  // Circular!

// ✅ GOOD: Extract common types
// types.rs
pub struct TypeA { }
pub struct TypeB { }

// a.rs
use crate::types::TypeB;

// b.rs
use crate::types::TypeA;
```

## Testing After Split

### Verify Module Structure

```bash
# Build to check module resolution
cargo build

# Run clippy for issues
cargo clippy

# Run all tests
cargo test

# Check for unused imports
cargo clippy -- -W unused_imports
```

### Common Errors

**"unresolved import"**
- Missing `pub` on module
- Missing `pub` on type
- Missing `mod` declaration

**"private type in public interface"**
- Type is pub but module is private
- Solution: Make module pub or use `pub use`

**"circular dependency"**
- Modules import each other
- Solution: Extract common types

## CI Integration

**In `.github/workflows` or similar:**

```yaml
- name: Check file lengths
  run: |
    ./scripts/check-file-lengths.sh 300 500
    if [ $? -ne 0 ]; then
      echo "Some files exceed recommended length"
      exit 1
    fi
```

## Cargo.toml Considerations

**When splitting affects Cargo.toml:**

```toml
# If creating new library crates
[workspace]
members = ["core", "api", "cli"]

# If feature-gating modules
[features]
user-management = []
order-processing = []
```

## Migration Checklist

When splitting a Rust file:

- [ ] Create module directory
- [ ] Create `mod.rs` with declarations
- [ ] Move code to submodules (one at a time)
- [ ] Add `pub` modifiers as needed
- [ ] Add `pub use` re-exports for compatibility
- [ ] Update parent `mod`/`lib.rs` declarations
- [ ] Run `cargo build`
- [ ] Run `cargo test`
- [ ] Run `cargo clippy`
- [ ] Check for unused imports
- [ ] Commit working code
- [ ] Remove old file when done

## Example: Splitting `utils.rs`

**Before (single file):**
```rust
// src/utils.rs (400 lines)
pub fn parse_input() { }
pub fn format_output() { }
pub fn validate_email() { }
pub fn hash_password() { }
// ... 390 more lines
```

**After (module directory):**
```rust
// src/utils/mod.rs
pub mod parsing;
pub mod formatting;
pub mod validation;
pub mod crypto;

// Re-exports for backwards compatibility
pub use parsing::parse_input;
pub use formatting::format_output;
pub use validation::validate_email;
pub use crypto::hash_password;
```

```rust
// src/utils/parsing.rs
pub fn parse_input() { }
// ... related parsing functions

#[cfg(test)]
mod tests {
    use super::*;
    // parsing tests
}
```

```rust
// src/utils/validation.rs
pub fn validate_email() { }
// ... related validation functions

#[cfg(test)]
mod tests {
    use super::*;
    // validation tests
}
```

**Result**: Same public API, better organization, easier to maintain.