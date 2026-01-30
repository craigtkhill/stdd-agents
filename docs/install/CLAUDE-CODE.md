# Claude Code Setup

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .claude

# Initialize the submodule
git submodule update --init --recursive

# Create symlink for Claude Code
ln -s .claude/AGENTS.md .claude/CLAUDE.md
```

## Update

```bash
cd .claude
git pull origin main
cd ..
git add .claude
git commit -m "chore: update stdd-agents submodule"
```
