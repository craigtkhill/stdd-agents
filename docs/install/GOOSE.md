# Goose Setup

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .goose

# Initialize the submodule
git submodule update --init --recursive
```

Goose uses YAML recipe files for configuration. You can reference skills from the STDD Agents directory in your recipes.

## Example Recipe

Create a `.goose/recipe.yaml` file:

```yaml
steps:
  - name: Run tests with TDD workflow
    description: Use STDD Agents test-driven-development skill
    # Reference the skill from the submodule
```

For more information on creating Goose recipes, see the [Goose documentation](https://block.github.io/goose/docs/).

## Update

```bash
cd .goose
git pull origin main
cd ..
git add .goose
git commit -m "chore: update stdd-agents submodule"
```
