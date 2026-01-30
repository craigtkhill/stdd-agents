# OpenCode Setup

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .opencode

# Initialize the submodule
git submodule update --init --recursive
```

OpenCode will automatically discover all skills in the `.opencode/skills/` directory.

## Update

```bash
cd .opencode
git pull origin main
cd ..
git add .opencode
git commit -m "chore: update stdd-agents submodule"
```
