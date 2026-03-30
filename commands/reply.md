# /reply

**Purpose:** Draft a reply to a message received.

**Input:** The message to reply to. Optionally include context like "this is from my manager" or "Slack DM from a candidate." If no context is provided, infer channel and relationship from the content.

**Workflow:**
1. Read the incoming message and identify:
   - Channel: email, Slack, iMessage — infer from content if not stated
   - Relationship: peer, manager, report, external, personal — infer from content
   - Tone register needed: formal, collegial, warm, direct
2. Draft two versions:
   - **Longer:** Full context, warmer, more personal
   - **Shorter:** Tighter, faster read, same intent
3. Both versions must use the voice defined in VOICE.md
4. Do not add filler, corporate language, or AI vocabulary
5. Sign-off: `/[Name]` or `thanks in advance, /[Name]` depending on register

**Output format:**
```
Longer:
[draft]

Shorter:
[draft]
```

**Constraints:**
- No em dashes
- No "I hope this email finds you well" or equivalent filler
- If the message is ambiguous and context would materially change the draft, ask one specific question before drafting
