# Skills

Each subdirectory is one Claude Code skill. The directory name becomes the `/slash-command`.

## Structure

```
skills/
├── review/
│   └── SKILL.md     → /review
├── reply/
│   └── SKILL.md     → /reply
└── ...
```

## How Skills Work

Each `SKILL.md` contains:
- **Frontmatter** (`name`, `description`) — used by Claude Code for discovery and autocomplete
- **Body** — the workflow prompt, copied from `commands/<name>.md`

The `description` field helps Claude load the skill automatically when relevant, even without the slash command.

## Adding a New Skill

1. Create `commands/newcommand.md` with the workflow (single source of truth)
2. Create `skills/newcommand/SKILL.md` with this template:

```markdown
---
name: newcommand
description: One sentence description shown in autocomplete.
---

[paste the contents of commands/newcommand.md here, minus the title and metadata]
```

3. Run `install.sh` again or copy the new skill directory manually to `~/.claude/skills/`
