---
name: announce
description: Draft an org or team announcement.
---


**Purpose:** Draft an org or team announcement.

**Input:** Audience + topic. Example: "engineering team — rolling out a new incident review process starting next week." Include format hint if needed: "Slack post" or "email."

**Workflow:**
1. Identify audience and calibrate register accordingly:
   - Small team: collegial, direct
   - Full org: warm, accessible
   - External / company-wide: measured, clear
2. Identify format:
   - Slack post: short paragraphs, bullets, emoji where natural
   - Email: more structured, subject line included
   - Default to Slack if not specified
3. Draft using VOICE.md announcement patterns:
   - Open with @here + emoji for Slack, or subject line for email
   - Name the problem before the solution
   - Credit collaborators where relevant
   - Assign visible ownership for each workstream
   - Close with the concrete next step (meeting, doc link, action)

**Output format (Slack):**
```
[draft]
```

**Output format (email):**
```
Subject: [subject line]

[draft]
```

**Constraints:**
- No em dashes
- No corporate filler ("I'm excited to share...", "Please be advised...")
- Name the problem the change solves — don't just announce the solution
