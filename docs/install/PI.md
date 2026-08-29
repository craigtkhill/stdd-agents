# Pi Setup

Run all commands from your **project root**.

This setup will:
1. Clone STDD Agents to `.pi/` directory, creating `.pi/AGENTS.md`
2. Create a symlink `AGENTS.md` in the project root pointing to `.pi/AGENTS.md`
3. Pi will read `AGENTS.md` and access the skills index

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .pi

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to submodule's AGENTS.md for Pi (from project root)
ln -s .pi/AGENTS.md AGENTS.md
```

See [Update Instructions](../update/PI.md) for how to update STDD Agents.
