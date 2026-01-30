# OpenCode Setup

Run all commands from your **project root**.

This setup will:
1. Clone STDD Agents to `.opencode/` directory, creating `.opencode/AGENTS.md`
2. Create a symlink `AGENTS.md` in the project root pointing to `.opencode/AGENTS.md`
3. OpenCode will read `AGENTS.md` and access the skills index

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .opencode

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to submodule's AGENTS.md for OpenCode (from project root)
ln -s .opencode/AGENTS.md AGENTS.md
```

See [Update Instructions](../update/OPENCODE.md) for how to update STDD Agents.
