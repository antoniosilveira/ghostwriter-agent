---
name: review
description: Grammar, clarity, consistency, and typo fix
---


**Purpose:** Grammar, clarity, consistency, and typo fix. No rewrites.

**Input:** Any text — email, Slack message, blog draft, LinkedIn post, announcement. Paste the full content after the command.

**Workflow:**
1. Read the content as-is
2. Identify and fix:
   - Grammar errors
   - Spelling and typos
   - Consistency issues (repeated phrases, contradictions)
   - Clarity issues (ambiguous sentences, missing words)
3. Do NOT change:
   - Tone or sentiment
   - Structure (unless a sentence is broken)
   - Word choice (unless it's clearly wrong or unclear)
4. Return the corrected version in full
5. Follow with a brief diff: bullet list of what changed and why (max 6 bullets)

**Output format:**
```
[corrected version]

---
Changes:
• [change 1 — reason]
• [change 2 — reason]
```

**Constraints:**
- No em dashes in the corrected version
- If the text is in another language, review in that language — do not translate
- If nothing needs changing, say "Looks clean." and return the original unchanged
