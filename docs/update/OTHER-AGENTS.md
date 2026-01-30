# Update STDD Agents - Other ATUIs

Run these commands from your **project root**.

Replace `<atui-name>` with your ATUI's config directory name (e.g., `claude`, `cursor`, `codex`).

```bash
cd .<atui-name>
git pull origin main
cd ..
git add .<atui-name>
git commit -m "chore: update stdd-agents submodule"
```
