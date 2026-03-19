# Refactoring Strategies

## Choosing a Strategy

### 1. Extract Function/Method
- When: Same code block appears multiple times
- Action: Extract to shared function
- Benefit: Single source of truth

### 2. Parameterize Function
- When: Similar functions with minor variations
- Action: Add parameters to handle variations
- Benefit: Reduces function count

### 3. Move Closer (Locality Fix)
- When: A helper is only ever called from one place
- Action: Move the helper next to its caller
- Benefit: Easier to understand and change together

### 4. Extract Common Interface/Trait
- When: Multiple types share similar behavior
- Action: Define shared interface
- Benefit: Polymorphic usage

### 5. Introduce Abstraction Layer
- When: Complex logic duplicated across features
- Action: Create abstraction that handles complexity
- Benefit: Simpler calling code

### 6. Use Existing Abstraction
- When: Functionality fits existing abstraction
- Action: Extend or modify existing abstraction
- Benefit: Consistency with codebase patterns

### 7. Keep Duplication
- When: Concepts are fundamentally different despite similar code
- When: Unification would increase coupling inappropriately
- When: Code will diverge in future
- Action: Document why duplication is intentional
- Benefit: Avoids premature abstraction

## Anti-Patterns

### Premature Abstraction
**Problem:** Creating abstractions before the pattern is understood
**Solution:** Follow "rule of three" — wait until duplication appears 3 times

### Over-Engineering
**Problem:** Creating overly complex abstractions for simple duplication
**Solution:** Keep refactoring simple and focused

### Breaking Encapsulation
**Problem:** Exposing internals to reduce duplication
**Solution:** Sometimes duplication is better than bad coupling

### Big Bang Refactoring
**Problem:** Changing too much at once
**Solution:** Small, incremental changes with test verification after each

### Refactoring Without Tests
**Problem:** Changing code without a safety net
**Solution:** Write tests first if they don't exist

### Cryptic Naming
**Problem:** Single-letter variables, abbreviations, or terse names that obscure intent (e.g. `d`, `tmp`, `val`, `mgr`)
**Solution:** Use full, descriptive names that reveal purpose — rename during the REFACTOR phase whenever cryptic names are encountered

### Locality Violation Through Deduplication
**Problem:** Extracting shared logic to a distant utility file when it only serves one context
**Solution:** Keep helpers close to their only consumer; extract only when genuinely shared
