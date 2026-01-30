# Goose Setup

Run all commands from your **project root**.

This setup will:
1. Clone STDD Agents to `.goose/` directory, creating `.goose/AGENTS.md`
2. Create a symlink `AGENTS.md` in the project root pointing to `.goose/AGENTS.md`
3. Goose will read `AGENTS.md` and access the skills index

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .goose

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to submodule's AGENTS.md for Goose (from project root)
ln -s .goose/AGENTS.md AGENTS.md
```

See [Update Instructions](../update/GOOSE.md) for how to update STDD Agents.
