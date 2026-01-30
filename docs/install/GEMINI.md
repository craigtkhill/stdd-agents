# Gemini CLI Setup

## Installation

```bash
# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .gemini

# Initialize the submodule
git submodule update --init --recursive

# Create symlink to GEMINI.md for Gemini CLI
ln -s .gemini/AGENTS.md .gemini/GEMINI.md
```

Gemini CLI will read the skills index from the GEMINI.md symlink.

## Update

```bash
cd .gemini
git pull origin main
cd ..
git add .gemini
git commit -m "chore: update stdd-agents submodule"
```
