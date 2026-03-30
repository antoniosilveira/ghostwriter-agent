# Setup: Claude Code

This guide sets up the Ghostwriter agent for Claude Code TUI using skills and CLAUDE.md.

## Prerequisites

- [Claude Code](https://claude.ai/code) installed
- `claude` CLI available in your terminal

---

## Option A — Quick install (recommended)

Run the install script from the repo root:

```bash
bash install.sh
```

This copies all 8 skills to `~/.claude/skills/` and appends the routing section to `~/.claude/CLAUDE.md`. Review `install.sh` before running — it only copies files, nothing else.

---

## Option B — Manual setup

### Step 1 — Copy your identity files

```bash
mkdir -p ~/.claude
cp sample/VOICE.md ~/.claude/VOICE.md
cp sample/USER.md ~/.claude/USER.md
cp sample/SOUL.md ~/.claude/SOUL.md
cp sample/PRINCIPLES.md ~/.claude/PRINCIPLES.md  # optional
cp sample/COMPANY.md ~/.claude/COMPANY.md         # optional
```

Edit each file. Replace John Doe / Acme Limited with your own information.
`VOICE.md` is the most important — real examples produce real output.

### Step 2 — Copy skills

```bash
cp -r claude-code/skills/ ~/.claude/skills/
```

### Step 3 — Set up CLAUDE.md

```bash
cp claude-code/CLAUDE.md ~/.claude/CLAUDE.md
```

Edit `~/.claude/CLAUDE.md` to update the paths to your identity files if needed.

---

## Step 4 — Test

Start a Claude Code session and try a command:

```
/review Hello team, I wanted to share a update's about our Q2 roadmap.
```

You should see a corrected version plus a diff of changes.

Try:
```
/reply Hey, just wanted to follow up on the proposal I sent last week. Let me know if you have any questions. — Marcus
```

You should see two draft versions (longer and shorter).

---

## How Skills Work

Each skill in `~/.claude/skills/` becomes a `/slash-command` in the Claude Code TUI. Type `/` to see all available commands with autocomplete.

Claude Code also loads skills automatically when relevant — so even without the slash command, if you paste a draft and ask for a review, Claude may load the `/review` skill on its own.

---

## Troubleshooting

**Commands don't appear in autocomplete:** Make sure the skill directories are in `~/.claude/skills/` (not a subdirectory of a project).

**Output doesn't sound like you:** `VOICE.md` needs more specific examples. Add 2-3 real messages you've actually sent.

**Claude ignores the workflow:** Make sure `CLAUDE.md` has the routing table and the skill files are present.
