# STDD Agents

```
   _____ __________ ____     ___                     __
  / ___//_  __/ __ / __ \   /   | ____ ____  ____  / /______
  \__ \  / / / / / / / / /  / /| |/ __ `/ _ \/ __ \/ __/ ___/
 ___/ / / / / /_/ / /_/ /  / ___ / /_/ /  __/ / / / /_(__  )
/____/ /_/ /_____/_____/  /_/  |_\__, /\___/_/ /_/\__/____/
                                 /____/

          Spec-Test-Driven Development Agents
```

**Agents and configs following a Spec-Test-Driven Development process**

This repository is designed for **Agentic Terminal User Interfaces (ATUIs)** like:
- **Claude Code**
- **Codex**
- **OpenCode**
- **Gemini CLI**


STDD Agents provides a structured workflow for developing applications using ATUIs, emphasizing specification-first development with comprehensive testing to ensure stability while moving with higher velocity.

*Note.* The aspiration is to make this toolkit ATUI agnostic. However, it is currently heavily configured for Claude Code.

## Quick Start

### Bootstrap Your Project with STDD Agents

Add STDD Agents to your project as a git submodule in the `.claude/` directory:

```bash
# In your project root
# First, ensure your project is a git repository
git init

# Add STDD Agents as a submodule
git submodule add https://github.com/craigtkhill/stdd-agents.git .claude

# Initialize and update the submodule
git submodule update --init --recursive
```

### Update STDD Agents

To get the latest updates:

```bash
cd .claude
git pull origin main
cd ..
git add .claude
git commit -m "chore: update stdd-agents submodule"
```

### Install as Claude Code Plugin

```bash
/plugin marketplace add https://github.com/craigtkhill/stdd-agents
/plugin install stdd-agents@stdd-agents
```
