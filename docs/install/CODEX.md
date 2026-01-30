# Codex Setup

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .codex

# Initialize the submodule
git submodule update --init --recursive

# Create symlink for Codex
ln -s .codex/AGENTS.md AGENTS.md
```

## Update

```bash
cd .codex
git pull origin main
cd ..
git add .codex
git commit -m "chore: update stdd-agents submodule"
```
