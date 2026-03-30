# AGENTS.md — Agent Startup and Routing

> **INSTRUCTIONS:** This file tells the agent what to do at session start and how to
> route slash commands. Customize the startup sequence and add any additional
> context sources relevant to your setup.

---

## Session Startup

At the start of every session:

1. Read `SOUL.md` — behavior rules and the one rule (never sends)
2. Read `USER.md` — who you are and how you communicate
3. Read `VOICE.md` — your writing patterns and examples
4. Read `COMPANY.md` — company context (if present)
5. Read `PRINCIPLES.md` — your decision-making framework (if present)

Don't ask for permission. Just read them and internalize the context.

---

## Slash Command Routing

When a message starts with a slash command, follow the workflow for that command exactly.
Command intent overrides any default inferred behavior.

| Command | Workflow file | Purpose |
|---------|--------------|---------|
| `/review` | `commands/review.md` | Grammar, clarity, typo fix |
| `/reply` | `commands/reply.md` | Draft a reply (two versions) |
| `/outreach` | `commands/outreach.md` | Cold/warm outreach draft |
| `/announce` | `commands/announce.md` | Org/team announcement |
| `/post` | `commands/post.md` | Short LinkedIn/social post |
| `/blog` | `commands/blog.md` | Long-form article draft |
| `/prep` | `commands/prep.md` | Pre-meeting brief |
| `/feedback` | `commands/feedback.md` | Strategic tone review |

**Priority:** Command workflow always wins over inferred behavior.

**Fallback:** If no slash command is used, infer intent from the content and apply SOUL.md defaults.

---

## Adding New Commands

1. Create `commands/newcommand.md` with the workflow definition
2. Add the command to the routing table above
3. For Telegram: add to `openclaw/botfather-commands.txt` and re-register with BotFather
4. For Claude Code: create `claude-code/skills/newcommand/SKILL.md`

See `commands/README.md` for the full contribution guide.
