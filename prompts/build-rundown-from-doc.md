# Build a rundown from this run-of-show doc

Server prompt: `build_rundown_from_doc` (arguments: `document`, optional `event_name`, `start`, `timezone`).

If your client does not list MCP prompts, paste this and add your document at the end:

```text
Build a runofsho rundown from the run-of-show document below.
1. Extract the rows in show order: title, length, speaker, notes, and section headings. Write lengths like "5m" or "1h 15m". Where the document only gives clock times, work out each length from the next row's time. Use hard_start only for real fixed times (doors, lunch, a broadcast hit).
2. Find the event with list_events, or create it with create_event.
3. Call import_rundown with the rows and show me the preview. Tell me anything you guessed.
4. Only after I say go, apply it with confirm: true and the preview_token.
5. Read it back with get_rundown and tell me about gaps, overlaps and a late finish.

Document:
"""
(paste here)
"""
```

Try it with [`examples/conference.md`](../examples/conference.md) or a real producer email.
