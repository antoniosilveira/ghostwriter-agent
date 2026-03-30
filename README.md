# ghostwriter-agent

A template for building a deterministic AI communications agent — one that reviews drafts, writes outreach, and prepares you for conversations in your voice and tone. This agent uses a series of slash commands that can add structure and reliability to the wiritng tasks you delate to it.

Works on two surfaces: **Telegram** via OpenClaw, and **Claude Code TUI** in the terminal.

## How This Was Built

This project is the companion code project for the blog post:  
[AI Communication Agent: How Slash Commands Make Claude Reliable for Writing](https://antonio.md/making-ai-communications-deterministic)

The post explains the design decisions behind this approach — why inference fails, why slash commands work, and how `VOICE.md` is the piece most people miss.

---

## The One Rule

**This agent never sends anything.**

It drafts, reviews, and prepares. Everything it produces is a draft until you take action on it. The agent has no context about timing, relationship dynamics, or what happened in a meeting an hour ago. You do.

The right mental model: the agent is a ghostwriter, not a sender.

---

## Why Slash Commands

Without commands, the agent has to infer what you want from how you phrase your request. Inference is fragile — the same input can produce different outputs depending on the state of your context.

Slash commands replace pure LLM inference with explicit intent. `/review` always means the same thing. The agent doesn't have to guess.

One command = one workflow. No ambiguity.

---

## Architecture

```
User types /review [text]
        │
        ▼
Agent identifies command
        │
        ▼
Loads VOICE.md + USER.md
        │
        ▼
Follows commands/review.md workflow
        │
        ▼
Returns corrected version + diff
        │
        ▼
User reviews and acts on it
(agent never sends)
```

The `sample/` files define your identity. The `commands/` files define the workflows. Both surfaces — OpenClaw and Claude Code — read from the same definitions.

---

## Built in Commands

| Command | Purpose | Output |
|---------|---------|--------|
| `/review` | Grammar, clarity, typo fix | Corrected version + diff |
| `/reply` | Draft a reply | Two versions (longer + shorter) |
| `/outreach` | Cold/warm outreach | Draft + channel note |
| `/announce` | Org/team announcement | Full draft (Slack or email) |
| `/post` | Short LinkedIn/social post | One draft |
| `/blog` | Long-form article | Full draft + title options |
| `/prep` | Pre-meeting brief | Structured brief |
| `/feedback` | Strategic tone review | Assessment + suggestions |

---

## Setup

### Option A — Telegram via OpenClaw

→ [openclaw/README.md](openclaw/README.md)

Requirements: OpenClaw installed, Telegram bot created via BotFather.

### Option B — Claude Code TUI

→ [claude-code/README.md](claude-code/README.md)

Requirements: Claude Code installed.

Quick install:
```bash
git clone https://github.com/antoniosilveira/ghostwriter-agent
cd ghostwriter-agent
bash install.sh
```

---

## Customizing for Your Voice

The `sample/` folder contains a fictional persona (John Doe at Acme Limited) as a starting point. Replace it with your own information.

**File guide:**

| File | What it does | Priority |
|------|-------------|----------|
| `VOICE.md` | Your writing style with real examples | 🔴 Critical |
| `USER.md` | Who you are, your role, your audiences | 🟡 Important |
| `SOUL.md` | Agent behavior rules and boundaries | 🟡 Important |
| `AGENTS.md` | Startup sequence and routing | 🟢 Optional |
| `PRINCIPLES.md` | How you think and decide | 🟢 Optional |
| `COMPANY.md` | Company/org context | 🟢 Optional |

**The most important file is `VOICE.md`.**

Generic instructions produce generic output. Real examples — actual messages you've sent that worked — produce output that sounds like you. The more specific the examples, the better the drafts.

See [sample/VOICE.md](sample/VOICE.md) for the format with inline instructions.

---

## Adding a New Command

Three steps:

1. Create `commands/newcommand.md` with the workflow definition
2. For Telegram: add to `openclaw/botfather-commands.txt`, re-register with BotFather
3. For Claude Code: create `claude-code/skills/newcommand/SKILL.md`

See [commands/README.md](commands/README.md) for the full contribution guide.

---

## License

MIT — use it, fork it, make it yours.
