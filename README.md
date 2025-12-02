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

**ATUI agents and configs following a Spec-Test-Driven Development process**

## What are ATUIs?

**Agentic Terminal User Interfaces (ATUIs)** are development environments that allow interaction with software engineering agents on the terminal. Examples include:

- **Claude Code**
- **Codex**
- **OpenCode**
- **Gemini CLI**

ATUIs help with understanding context, executing commands, reading/writing files, and following structured workflows to enable developers build software more efficiently.

## What is STDD Agents?

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
