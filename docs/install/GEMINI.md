# Gemini CLI Setup

Run all commands from your **project root**.

This setup will:
1. Clone STDD Agents to `.gemini/` directory, creating `.gemini/AGENTS.md`
2. Create a symlink `GEMINI.md` in the project root pointing to `.gemini/AGENTS.md`
3. Gemini CLI will read `GEMINI.md` and access the skills index

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .gemini

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to submodule's AGENTS.md for Gemini CLI (from project root)
ln -s .gemini/AGENTS.md GEMINI.md
```

See [Update Instructions](../update/GEMINI.md) for how to update STDD Agents.
