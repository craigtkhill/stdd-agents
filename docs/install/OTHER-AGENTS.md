# Generic ATUI Setup

This guide covers the general pattern for setting up STDD Agents with any ATUI that isn't specifically documented.

## Installation Pattern

Most ATUIs follow this pattern for project-specific configuration:

```bash
# 1. Add STDD Agents as a git submodule in your ATUI's config directory
git submodule add https://github.com/craigtkhill/stdd-agents.git .<atui-name>

# 2. Initialize the submodule
git submodule update --init --recursive
```

Replace `<atui-name>` with your ATUI's config directory name (e.g., `claude`, `cursor`, `codex`).

## Discovery Mechanisms

Different ATUIs discover skills in different ways:

### AGENTS.md-based (Claude Code, Codex)
If your ATUI reads from `AGENTS.md` or a specific config file:

```bash
# Create a symlink in project root to the submodule's AGENTS.md
ln -s .<atui-name>/AGENTS.md <CONFIG-FILE>.md
```

### Directory scanning (OpenCode, Goose)
If your ATUI automatically scans subdirectories for skills, the submodule at `.<atui-name>/` will work directly.

### Custom config files
If your ATUI uses a different config file name (e.g., GEMINI.md):

```bash
# Create a symlink in project root to the submodule's AGENTS.md
ln -s .<atui-name>/AGENTS.md <YOUR-CONFIG-FILE>.md
```

See [Update Instructions](../update/OTHER-AGENTS.md) for how to update STDD Agents.

## Next Steps

Check your ATUI's documentation to understand:
1. Where its configuration directory is located
2. How it discovers agent skills or instructions
3. Whether it uses AGENTS.md or a different file format
