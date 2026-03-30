# Setup: OpenClaw + Telegram

This guide sets up the Ghostwriter agent on OpenClaw with Telegram slash commands.

## Prerequisites

- [OpenClaw](https://openclaw.ai) installed and running
- A Telegram bot created via [@BotFather](https://t.me/BotFather)
- Your bot token from BotFather

---

## Step 1 — Copy your identity files

Copy the `sample/` files to your OpenClaw workspace and fill them in with your own information:

```bash
cp sample/VOICE.md ~/.openclaw/workspace/VOICE.md
cp sample/USER.md ~/.openclaw/workspace/USER.md
cp sample/SOUL.md ~/.openclaw/workspace/SOUL.md        # use openclaw/SOUL.md instead
cp sample/AGENTS.md ~/.openclaw/workspace/AGENTS.md
cp sample/PRINCIPLES.md ~/.openclaw/workspace/PRINCIPLES.md
cp sample/COMPANY.md ~/.openclaw/workspace/COMPANY.md
```

> **Important:** Use `openclaw/SOUL.md` (this directory), not `sample/SOUL.md`.
> The OpenClaw SOUL.md includes the command routing table.

Edit each file and replace the John Doe / Acme Limited placeholder content with your own.
`VOICE.md` is the most important — real examples produce real output.

---

## Step 2 — Copy the command definitions

```bash
cp -r commands/ ~/.openclaw/workspace/commands/
```

---

## Step 3 — Register commands with BotFather

1. Open [@BotFather](https://t.me/BotFather) in Telegram
2. Send `/setcommands`
3. Select your bot
4. Paste the contents of `openclaw/botfather-commands.txt`

You can also register via the Telegram API:

```bash
BOT_TOKEN="your_bot_token_here"

curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/setMyCommands" \
  -H "Content-Type: application/json" \
  -d '{
    "commands": [
      {"command": "review", "description": "Review for grammar, clarity, typos"},
      {"command": "reply", "description": "Draft a reply to email, Slack, or iMessage"},
      {"command": "outreach", "description": "Draft cold/warm outreach to a contact"},
      {"command": "announce", "description": "Draft an org or team announcement"},
      {"command": "post", "description": "Draft a short LinkedIn post"},
      {"command": "blog", "description": "Research + draft a long-form article"},
      {"command": "prep", "description": "Pre-meeting or pre-conversation brief"},
      {"command": "feedback", "description": "Strategic tone and framing review"}
    ]
  }'
```

---

## Step 4 — Configure OpenClaw

Add the commands to your OpenClaw Telegram config. In `openclaw.json`:

```json
"channels": {
  "telegram": {
    "customCommands": [
      {"command": "review", "description": "Review for grammar, clarity, typos"},
      {"command": "reply", "description": "Draft a reply to email, Slack, or iMessage"},
      {"command": "outreach", "description": "Draft cold/warm outreach to a contact"},
      {"command": "announce", "description": "Draft an org or team announcement"},
      {"command": "post", "description": "Draft a short LinkedIn post"},
      {"command": "blog", "description": "Research + draft a long-form article"},
      {"command": "prep", "description": "Pre-meeting or pre-conversation brief"},
      {"command": "feedback", "description": "Strategic tone and framing review"}
    ]
  }
}
```

---

## Step 5 — Test

Send a test message to your bot:

```
/review Hello team, I wanted to share a update's about our Q2 roadmap.
```

The agent should return a corrected version with a brief diff of changes.

---

## Troubleshooting

**Commands don't appear in Telegram autocomplete:** Re-register with BotFather using Step 3.

**Agent ignores the command workflow:** Make sure `AGENTS.md` is in your workspace and the routing table is populated.

**Output doesn't sound like you:** `VOICE.md` needs more specific examples. Add 2-3 real messages you've actually sent.
