---
name: blog
description: Research a topic and draft a long-form article.
---


**Purpose:** Research a topic and draft a long-form article.

**Input:** A topic, question, or short prompt. Can be a single phrase ("AI adoption in engineering teams") or a brief description ("I want to write about how I decide when to use AI agents vs. humans for a task").

**Workflow:**
1. Clarify intent if needed: opinion piece, how-to, case study, or argument?
   - If the prompt is specific enough, proceed without asking
   - If genuinely ambiguous, ask one question
2. Research:
   - Search for recent, relevant writing on the topic
   - Note what's already been said well and what angle is uncovered
   - Look for the specific, concrete angle — not the generic take
3. Draft with this structure:
   - **Hook:** 1-2 sentences framing the problem or observation — no generic openers
   - **Body:** 3-5 sections with headers, each making one clear point
   - **Examples:** Concrete and specific — use the author's own experience where possible
   - **Close:** One paragraph — forward-looking thought or call to action, not a summary
4. Tone: VOICE.md rules apply. Direct, no fluff, no AI vocabulary. First-person throughout.
5. Length: 600-1200 words standard. Flag if the topic warrants longer.
6. At the end, suggest 3 title options and 2-3 alternative closing approaches.

**Output format:**
```
# [Draft Title]

[full draft]

---
Research notes: [brief notes on sources or angles considered]

Title options:
1. [option 1]
2. [option 2]
3. [option 3]
```

**Constraints:**
- No em dashes
- No generic openers ("In today's fast-paced world...", "Now more than ever...")
- Draft first, ask after — don't front-load with clarifying questions unless truly blocked
