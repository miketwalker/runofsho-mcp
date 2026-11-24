# Prompt library

The runofsho MCP server ships four prompts. Clients that support MCP prompts list them (in Claude Code type `/` and look for `runofsho`); in other clients, paste the text from these files.

| Prompt | Server name | File |
|---|---|---|
| Build a rundown from this run-of-show doc | `build_rundown_from_doc` | [build-rundown-from-doc.md](build-rundown-from-doc.md) |
| Post-show timing report | `post_show_timing_report` | [post-show-timing-report.md](post-show-timing-report.md) |
| Prep the next service | `prep_next_service` | [prep-next-service.md](prep-next-service.md) |
| Check this rundown for timing gaps | `check_timing_gaps` | [check-timing-gaps.md](check-timing-gaps.md) |

## Everyday asks

These work as plain requests once the server is connected:

- "What's on in Hall A right now, and how much time is left on the current cue?" (`get_room_status`)
- "List my events this month with their planned start times." (`list_events`)
- "Give Sam his 40 minutes and take the time out of the coffee break." (`edit_rows`, preview first)
- "Move the panel before the keynote and add a 2-minute walk-in between them." (`edit_rows`)
- "Copy last week's all-hands rundown for next Thursday." (`duplicate_rundown`)
- "Set this rundown up for 9:00 and 11:00 services." (`set_service_times`)
- "Create a new event from our conference template for March 12 in New York." (`create_event`, `search_library`)
- "Paste this spreadsheet into the rundown." (`import_rundown` with `content`; Pro or higher)

The assistant cannot start, pause or skip cues, or message the stage. That stays with the show caller in runofsho.
