
# CLAUDE.md

## Skills
Skills are organized into bucket folders under `skills/`:
- `engineering/` — daily code work
- `productivity/` — daily non-code workflow tools
- `personal/` — tied to my own setup, not promoted

## Hard rules
- **YOU MUST NOT commit or push to git EVER**
- Always activate `.venv` before running Python scripts (check `venv/`, `.venv/`, `env/`).
- Code fences **must** declare a language (`bash`, `python`, `json`, …) — the cross-reference check fails otherwise.
- External URLs must be reachable and stable. No ephemeral links.
- Mermaid diagrams must parse (validated pre-commit). Broken EPUB build is usually invalid Mermaid or no network to Kroki.


## Token Efficiency
- Never re-read files you just wrote or edited. You know the contents.
- Never re-run commands to "verify" unless the outcome was uncertain.
- Don't echo back large blocks of code or file contents unless asked.
- Batch related edits into single operations. Don't make 5 edits when 1 handles it.
- Skip confirmations like "I'll continue..." Just do it.
- If a task needs 1 tool call, don't use 3. Plan before acting.
- Do not summarize what you just did unless the result is ambiguous or you need additional input.
