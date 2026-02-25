# File Organization and Module Splitting

Guidelines for organizing code into files and modules, including when to split large files.

**Language-specific details:**
- Rust: See [RUST.md](RUST.md)

## When to Split Files

**Thresholds:**
- **Warning**: 300 lines - consider splitting
- **Critical**: 500 lines - should split
- **Exception**: Test files can be longer if well-organized

**Signs a file needs splitting:**
- Multiple distinct responsibilities
- Difficult to navigate
- Multiple logical groupings of functions
- Mix of public API and internal helpers
- Different levels of abstraction
- Single file doing too many things

## Checking File Lengths

Generic approach to find files needing attention:

```bash
# Find files over threshold
find src -name "*.ext" -type f -exec wc -l {} + | awk '$1 > 300' | sort -rn
```

## Module Organization Strategies

### Strategy: Feature-Based Organization

Split by domain/feature - group all code for a feature together.

**Structure:**
```
src/
  feature-name/
    index|mod      # Module entry point
    models         # Data structures
    handlers       # Business logic
    utils          # Feature-specific helpers
```

**When to use:**
- Clear feature boundaries
- Features are relatively independent
- Feature has multiple components

**Benefits:**
- Easy to find feature code
- Can develop features in isolation
- Clear ownership boundaries

## Splitting Process

### Step 1: Analyze Current File

**Questions to ask:**
1. What are the distinct responsibilities?
2. What are the natural groupings?
3. What's public API vs. internal implementation?
4. Are there clear module boundaries?
5. What will change together vs. separately?

**Red flags:**
- Scrolling through file to find things
- Hard to name the file's single purpose
- Multiple unrelated imports
- Mixing high and low-level abstractions

### Step 2: Plan Module Structure

**Create a plan:**
1. List logical groups of functions/classes
2. Identify dependencies between groups
3. Determine what stays public
4. Determine what becomes internal/private
5. Sketch module hierarchy

**Document the plan:**
- Why splitting (purpose)
- What goes where (organization)
- How imports change (migration)

### Step 3: Split Incrementally

**Incremental approach (CRITICAL):**
1. Create new module file
2. Move ONE logical group
3. Update imports/exports
4. Run all tests
5. Commit working code
6. Repeat for next group

**Do NOT:**
- Move everything at once
- Skip running tests
- Mix refactoring with feature work

### Step 4: Maintain Public API

**Preserve existing imports:**
- Re-export from entry point
- Avoid breaking changes
- Use deprecation warnings if needed

**Version the change:**
- Document in changelog
- Follow semantic versioning
- Communicate to team

### Step 5: Clean Up

**Final cleanup:**
- Remove empty files
- Update documentation
- Remove unused imports
- Check code formatting
- Verify no warnings

## Best Practices

### Keep Related Code Together
- Split at natural boundaries
- Don't split just for line count
- Code that changes together stays together
- Balance cohesion vs. file size

### Gradual Refactoring
- Small, incremental changes
- Test after each step
- Commit frequently
- Can pause and resume safely

### Clear Boundaries
- One clear purpose per file
- Minimal dependencies between files
- Clear public vs. private separation
- Logical organization that others understand

### Consistent Naming
- File names match contents
- Directory structure reflects architecture
- Follow language conventions
- Use descriptive names

## Module Size Guidelines

**Good file sizes:**
- 50-300 lines: ideal sweet spot
- 300-500 lines: acceptable if cohesive
- >500 lines: should split

**Good module sizes:**
- 3-7 files per directory: manageable
- >10 files: consider sub-grouping
- 1-2 files: might be over-fragmented

**Balance:**
- Too small: hurts navigation
- Too large: hurts comprehension
- Just right: easy to understand and navigate

## Common Patterns

### Pattern 1: Split by Responsibility

```
feature/
  api       # Public interface
  core      # Implementation
  internal  # Private helpers
```

**When**: Clear public/private boundary

### Pattern 2: Split by Data vs. Behavior

```
feature/
  types     # Data structures
  logic     # Functions/methods
```

**When**: Data and behavior are separable

### Pattern 3: Split by Workflow Stage

```
feature/
  input     # Input handling
  process   # Core processing
  output    # Output formatting
```

**When**: Clear pipeline or workflow

### Pattern 4: Split by Subfeature

```
feature/
  subfeature-a
  subfeature-b
  subfeature-c
```

**When**: Feature has distinct subfeatures

## Testing After Splitting

**Verification checklist:**
- [ ] All tests pass
- [ ] No new warnings
- [ ] Imports work correctly
- [ ] Public API unchanged (or versioned)
- [ ] Documentation updated
- [ ] No circular dependencies

**Common issues:**
- Broken imports
- Missing exports
- Circular dependencies
- Lost functionality
- Changed public API

## When NOT to Split

**Keep files together when:**
- File is <300 lines and cohesive
- Single, clear responsibility
- Splitting breaks logical flow
- Components are tightly coupled
- Would create too many tiny files
- Tests would become harder

**Sometimes duplication is OK:**
- Different contexts
- Will diverge in future
- Coupling would be worse

## Integration with Refactoring Workflow

**During code review:**
1. Check file lengths
2. Identify candidates for splitting
3. Plan module structure
4. Split incrementally
5. Verify with tests

**Regular maintenance:**
- Check file lengths periodically
- Refactor before files get too large
- Don't let technical debt accumulate
- Split as part of normal development

## Automation

**CI Integration:**
- Check file lengths in CI
- Fail or warn on violations
- Track metrics over time
- Prevent files from growing too large

**Pre-commit Hooks:**
- Check changed files
- Warn on large additions
- Suggest splitting opportunities