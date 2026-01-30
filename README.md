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

### Installation

Choose your ATUI and follow the installation guide:

- **[Claude Code](docs/install/CLAUDE-CODE.md)** - Setup for Claude Code users
- **[Codex](docs/install/CODEX.md)** - Setup for Codex users
- **[OpenCode](docs/install/OPENCODE.md)** - Setup for OpenCode users
- **[Gemini CLI](docs/install/GEMINI.md)** - Setup for Gemini CLI users
- **[Goose](docs/install/GOOSE.md)** - Setup for Goose users
- **[Generic](docs/install/GENERIC.md)** - Setup for other ATUIs

### Install as Claude Code Plugin

```bash
/plugin marketplace add https://github.com/craigtkhill/stdd-agents
/plugin install stdd-agents@stdd-agents
```
