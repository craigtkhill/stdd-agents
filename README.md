# ATUI Tools

```
    ___    ________  __  ______   ______            __
   /   |  /_  __/ / / / /  _/   /_  __/___  ____  / /____
  / /| |   / / / / / /  / /      / / / __ \/ __ \/ / ___/
 / ___ |  / / / /_/ / _/ /      / / / /_/ / /_/ / (__  )
/_/  |_| /_/  \____/ /___/     /_/  \____/\____/_/____/

         Agentic Terminal User Interface Tools
```

**Agentic Terminal User Interface tools, agents and configs following a Spec-Test-Driven Development process**

## What are ATUIs?

**Agentic Terminal User Interfaces (ATUIs)** are AI-powered development environments that combine terminal capabilities with agentic pair programmers. Examples include:

- **Claude Code**
- **Codex**
- **OpenCode**

ATUIs act as intelligent pair programmers, understanding context, executing commands, reading/writing files, and following structured workflows to help developers build software more efficiently.

## What is ATUI Tools?

ATUI tools provides a structured workflow for developing applications using these ATUIs, emphasizing specification-first development with comprehensive testing.

*Note.* The aspiration is to make this toolkit ATUI agnostic. However, it is currently heavily configured for Claude Code.

## Quick Start

### Bootstrap Your Project with ATUI Tools

Add ATUI Tools to your project as a git submodule in the `.claude/` directory:

```bash
# In your project root
git submodule add https://github.com/craigtkhill/atui-tools.git .claude

# Initialize and update the submodule
git submodule update --init --recursive
```

### Update ATUI Tools

To get the latest updates:

```bash
cd .claude
git pull origin main
cd ..
git add .claude
git commit -m "chore: update atui-tools submodule"
```
