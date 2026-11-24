runofsho MCP server: a hosted MCP endpoint that lets Claude, ChatGPT, Cursor and other AI assistants build, edit and check run of show rundowns through the runofsho API.

<p><img src="assets/runofsho-logo.svg" alt="runofsho" height="40"></p>

**Endpoint:** `https://api.runofsho.com/mcp` (Streamable HTTP) · **Docs and setup:** [runofsho.com/mcp](https://runofsho.com/mcp/?utm_source=github&utm_medium=repo&utm_campaign=mcp) · **Version:** 1.0.0

This repository is the public documentation for the runofsho MCP server: client config files, example rundowns, a prompt library and the `server.json` for MCP directories. The server is hosted by runofsho; there is nothing here to install or run, and the application source is private.

If you are an AI agent working out how to call the server, read [AGENTS.md](AGENTS.md) and [llms.txt](llms.txt).

## Quick connect

1. In [runofsho](https://app.runofsho.com/), open **API keys** in the app menu and create a key. Scope `read` lets the assistant look; `manage` lets it create and edit rundowns. Name it after the assistant ("Claude", "Cursor"): every change it makes is in the rundown history under that name.
2. Add the server to your client with the key as `Authorization: Bearer rd_live_…`:

```bash
# Claude Code
claude mcp add --transport http runofsho https://api.runofsho.com/mcp \
  --header "Authorization: Bearer rd_live_your_key"
```

```json
// Cursor: ~/.cursor/mcp.json
{
  "mcpServers": {
    "runofsho": {
      "url": "https://api.runofsho.com/mcp",
      "headers": { "Authorization": "Bearer rd_live_your_key" }
    }
  }
}
```

Ready-made files for Claude Desktop, Claude Code, the ChatGPT desktop app and Codex, Cursor, VS Code and Windsurf are in [`clients/`](clients/). Step-by-step instructions: [runofsho.com/mcp](https://runofsho.com/mcp/?utm_source=github&utm_medium=repo&utm_campaign=mcp#connect-your-assistant).

**Sign-in (OAuth) is not available yet.** claude.ai and ChatGPT on the web only connect custom MCP servers by sign-in or with no authentication, so they connect once runofsho sign-in ships. Use a desktop or coding client until then; Claude organizations with the Request headers beta for custom connectors can add an `authorization` header instead.

## Tools

| Tool | What it does | Kind |
|---|---|---|
| `list_events` | Events and their rundowns, with planned starts and service times | Read |
| `get_rundown` | A rundown as a timed table (human-readable lengths and ISO 8601 times), paginated, with gap, overlap and over-target checks | Read |
| `get_room_status` | What each room is playing now: current cue, time left, on air or not | Read |
| `get_timing_report` | Planned against actual after a show, or service against service (Studio plan) | Read |
| `search_library` | Saved elements and rundown templates to reuse | Read |
| `create_event` | A new event and rundown, empty or from a template | Plan |
| `import_rundown` | Rows from a run-of-show doc, email or CSV/TSV paste | Plan |
| `edit_rows` | Changes, inserts, moves and deletes in one batch, shown as a diff | Plan |
| `set_service_times` | The 9:00 and 11:00 services of a repeated show | Plan |
| `duplicate_rundown` | A copy of a rundown or a whole event | Plan |

Plan tools that change existing rows work in two steps: the first call returns a preview and a `preview_token` and changes nothing; the assistant applies it by calling again with `confirm: true` and the token. If someone edits the rundown in between, the apply is refused rather than overwriting their work. Creating and duplicating take an `idempotency_key`, so a retry never makes a second copy.

**No live control in v1.** The server cannot start, pause, skip or stop a timer, cue the next row or message the stage. Playback stays with the show caller in runofsho and with integrations built on the [API](https://runofsho.com/developers/?utm_source=github&utm_medium=repo&utm_campaign=mcp).

Also included: four prompts ([`prompts/`](prompts/)) and three resources the assistant can read: `runofsho://docs` (an index of runofsho guides), `runofsho://schema` (the data model) and `runofsho://style-guide` (rundown conventions).

## Worked example

A producer's email, pasted into Claude:

> Final-ish flow for Thursday, Hall A. We start at 9 sharp. Dana does the welcome (5 min tops), then the sponsor video (2:30). Keynote is Sam Lee, he's asking for 40 but let's say 35. Then the panel with Ana moderating, 45 incl. Q&A. Coffee 15. Breakouts start at 11:00 hard, the venue flips the room. Lunch 12:30. Thanks, Priya

The assistant calls `create_event`, then `import_rundown` (preview, then apply after you confirm), and `get_rundown` returns:

| # | Start | Length | Title | Flags |
|---|---|---|---|---|
| 1 | 09:00 | 5m | Welcome | |
| 2 | 09:05 | 2m 30s | Sponsor video | |
| 3 | 09:07:30 | 35m | Keynote | |
| 4 | 09:42:30 | 45m | Panel and Q&A | |
| 5 | 10:27:30 | 15m | Coffee break | |
| 6 | 11:00 | 1h 30m | Breakouts | hard start 11:00 (gap 17m 30s) |
| 7 | 12:30 | 1h 00m | Lunch | hard start 12:30 |

> Gap: 17m 30s of nothing before the hard start 11:00 of #6 Breakouts; the rows before it end at 10:42:30.

This is the server's real output for that email, trimmed to fit. More starting points: [`examples/`](examples/) has a conference, a worship service, a live broadcast and a webinar as CSV and Markdown that `import_rundown` accepts.

## Limits and plans

- The API, and so the MCP server, is on every runofsho plan, including Free. Tool calls count against the API key's per-minute budget: 60 requests on Free, 600 on Pro and Studio, 3,000 with API Plus. They never use the separate budget for playback commands. See [pricing](https://runofsho.com/pricing/?utm_source=github&utm_medium=repo&utm_campaign=mcp).
- Plan limits apply as in the app: Free rundowns hold 10 rows, spreadsheet import (`import_rundown` with `content`) needs Pro or higher, and timing reports need Studio. Errors say which plan is needed and link to pricing.
- The server is stateless and keeps no copy of your data. The assistant sees only what its key can see; revoke the key at any time.

## Learn more

- [runofsho MCP server](https://runofsho.com/mcp/?utm_source=github&utm_medium=repo&utm_campaign=mcp): setup for every client, FAQ
- [How to build a run of show](https://runofsho.com/guides/how-to-build-a-run-of-show/?utm_source=github&utm_medium=repo&utm_campaign=mcp)
- [Back-timing and hard outs](https://runofsho.com/guides/back-timing-and-hard-outs/?utm_source=github&utm_medium=repo&utm_campaign=mcp)
- [Planning multiple church services](https://runofsho.com/guides/multiple-church-services/?utm_source=github&utm_medium=repo&utm_campaign=mcp)
- [Run of show templates](https://runofsho.com/templates/?utm_source=github&utm_medium=repo&utm_campaign=mcp)
- [runofsho API documentation](https://runofsho.com/developers/?utm_source=github&utm_medium=repo&utm_campaign=mcp) and [API reference](https://api.runofsho.com/docs)

## Support

Email [support@runofsho.com](mailto:support@runofsho.com) or open an issue in this repository for documentation problems.

runofsho is made by Moondust Studios, Inc. This documentation is MIT licensed; the runofsho service is covered by its [terms](https://runofsho.com/terms/?utm_source=github&utm_medium=repo&utm_campaign=mcp).
