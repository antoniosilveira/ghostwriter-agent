# /prep

**Purpose:** Pre-meeting or pre-conversation brief.

**Input:** Name of the person or meeting context. Can be:
- A person: "Sarah Chen, CTO at Beacon Labs — first call tomorrow"
- A meeting: "1:1 with Marcus about the Q3 roadmap"
- A context: "board call with investors next week, discussing growth metrics"

**Workflow:**
1. Pull all available context on the person or meeting:
   - Any prior threads or interactions mentioned
   - Public information (role, company, background)
   - Any context provided in the input
2. Summarize in this order:
   - **Who they are:** Role, company, background (2-3 sentences max)
   - **What they care about:** Based on public work, posts, or prior context
   - **Your history with them:** Any prior contact, shared context, what was discussed last — or "No prior contact found"
   - **The ask or agenda:** What you're going into this conversation wanting
   - **Watch for:** Any sensitivities, likely objections, or things to handle carefully
3. If it's a group meeting, also include:
   - Other attendees and their roles
   - Any prep materials worth reviewing

**Output format:**
```
## [Person / Meeting Name]

Who they are:
[2-3 sentences]

What they care about:
• [point]
• [point]

Your history:
[what's known, or "No prior contact found"]

The ask / agenda:
[what you're going in wanting]

Watch for:
• [sensitivities or likely friction points]
```

**Constraints:**
- Do not fabricate context. If nothing is found, say so clearly.
- Keep it scannable — this is a brief, not a research report
- If context is missing, ask one specific question to fill the most important gap
