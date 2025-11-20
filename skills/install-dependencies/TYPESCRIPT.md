# TypeScript/JavaScript Dependency Management

## File Location

TypeScript/JavaScript dependencies are declared in `package.json`:

```json
{
  "dependencies": {
    "package-name": "*"
  }
}
```

## ❌ WRONG - Do NOT specify versions:

```json
{
  "dependencies": {
    "react": "^18.0.0",      // ❌ NO!
    "axios": "~1.6.0",       // ❌ NO!
    "typescript": ">=5.0.0"  // ❌ NO!
  }
}
```

## ✅ CORRECT - Use wildcard or "latest":

```json
{
  "dependencies": {
    "react": "*",            // ✅ YES!
    "axios": "latest",       // ✅ YES!
    "typescript": "*"        // ✅ YES!
  }
}
```

## Package Manager Commands

This project uses **npm** for TypeScript/JavaScript dependency management:

### Add a dependency:
```bash
# Just add the name to package.json dependencies, then:
npm install
```

### Update dependencies:
```bash
npm update
```

### Install project:
```bash
npm install
```

## Lock File

npm uses `package-lock.json` to lock resolved versions. Always commit this file after adding/updating dependencies.

## Alphabetical Ordering

Keep dependencies in alphabetical order for easier management:

```json
{
  "dependencies": {
    "axios": "*",
    "react": "*",
    "typescript": "*"
  }
}
```

## Dev Dependencies

For development dependencies, use the same approach:

```json
{
  "devDependencies": {
    "jest": "*",
    "prettier": "*",
    "eslint": "*"
  }
}
```
