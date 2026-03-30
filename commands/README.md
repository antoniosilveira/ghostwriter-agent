# Commands

Each file in this directory defines one slash command workflow.
This is the single source of truth — both the OpenClaw/Telegram and Claude Code paths read from here.

## How Commands Work

When a slash command is sent (e.g. `/review some text`), the agent:
1. Identifies the command name
2. Loads the corresponding workflow from this directory
3. Applies the workflow to the content
4. Returns the output in the format defined here

## Adding a New Command

Three steps, always consistent:

**Step 1:** Create `commands/newcommand.md` with this structure:
```
# /newcommand

**Purpose:** One sentence.

**Input:** What the user provides.

**Workflow:** Numbered steps the agent follows.

**Output format:** Exactly what gets returned.

**Constraints:** Hard rules that always apply.
```

**Step 2 — Telegram:** Add to `openclaw/botfather-commands.txt` and re-register with BotFather:
```
newcommand - Short description under 60 chars
```

**Step 3 — Claude Code:** Create `claude-code/skills/newcommand/SKILL.md` referencing this file.

That's it. Three steps, both surfaces updated.
