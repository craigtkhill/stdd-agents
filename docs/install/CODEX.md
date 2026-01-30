# Codex Setup

Run all commands from your **project root**.

This setup will:
1. Clone STDD Agents to `.codex/` directory, creating `.codex/AGENTS.md`
2. Create a symlink `AGENTS.md` in the project root pointing to `.codex/AGENTS.md`
3. Codex will read `AGENTS.md` and access the skills index

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .codex

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to submodule's AGENTS.md for Codex (from project root)
ln -s .codex/AGENTS.md AGENTS.md
```

See [Update Instructions](../update/CODEX.md) for how to update STDD Agents.
