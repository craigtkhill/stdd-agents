# Claude Code Setup

Run all commands from your **project root**.

This setup will:
1. Clone STDD Agents to `.claude/` directory, creating `.claude/AGENTS.md`
2. Create a symlink `CLAUDE.md` in the project root pointing to `.claude/AGENTS.md`
3. Claude Code will read `CLAUDE.md` and access the skills index

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .claude

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to submodule's AGENTS.md for Claude Code (from project root)
ln -s .claude/AGENTS.md CLAUDE.md
```

## Update

```bash
cd .claude
git pull origin main
cd ..
git add .claude
git commit -m "chore: update stdd-agents submodule"
```
