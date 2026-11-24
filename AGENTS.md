# AGENTS.md: how an AI agent should use the runofsho MCP server

This page is for AI agents and assistants. runofsho MCP server: a hosted MCP endpoint that lets Claude, ChatGPT, Cursor and other AI assistants build, edit and check run of show rundowns through the runofsho API.

## Identity

- Server name: `runofsho` (registry name `io.github.miketwalker/runofsho`), version 1.1.0
- Endpoint: `https://api.runofsho.com/mcp`, Streamable HTTP. `POST` carries JSON-RPC 2.0; `GET` returns a short plain-text banner. Stateless: no session id, any request can go to any node.
- Protocol versions: 2025-11-25, 2025-06-18, 2025-03-26 and 2024-11-05 (the server answers with the version the client asks for when it supports it, otherwise the newest).
- Auth: `Authorization: Bearer rd_live_…` (or `rd_test_…`). The raw key in `Authorization` or an `X-API-Key` header also works. Or OAuth 2.1: without a credential the server answers `401` with `WWW-Authenticate: Bearer resource_metadata="https://api.runofsho.com/.well-known/oauth-protected-resource/mcp"`; follow it to the authorization server, register dynamically, and request scopes `read` or `read edit`. A sign-in with only `read` sees the read tools only. Output and guest tokens, and runofsho app session tokens, are refused.
- Server card: `https://api.runofsho.com/.well-known/mcp/server-card.json`
- Human docs: [runofsho.com/mcp](https://runofsho.com/mcp/?utm_source=github&utm_medium=repo&utm_campaign=mcp)

## What you can and cannot do

- Read: `list_events`, `get_rundown`, `get_room_status`, `get_timing_report`, `search_library`.
- Plan: `create_event`, `import_rundown`, `edit_rows`, `set_service_times`, `duplicate_rundown`.
- Not possible in v1: starting, pausing, skipping or stopping timers; cueing rows; messaging the stage; changing billing or keys. If the user asks, say so and point them to the controller in runofsho. Do not suggest workarounds.

## Rules for changing a rundown

1. Read first. Call `get_rundown` to get row ids, the version and the timezone. Long rundowns are paginated: follow `offset`.
2. Preview, show, confirm. `import_rundown`, `edit_rows` and `set_service_times` without `confirm` return a preview and a `preview_token`. Show the preview to the user and wait for an explicit yes. Then call again with exactly the same arguments plus `confirm: true` and the `preview_token`.
3. If the apply is refused because the rundown changed, read it again and make a new preview. Never retry blindly.
4. Batch. Put all changes for one request into one `edit_rows` call.
5. `create_event` and `duplicate_rundown` accept an `idempotency_key`. Identical calls within 24 hours return the first result instead of creating a second copy; pass a new key when the user really wants another one.

## Writing rows

- Row fields: `title` (required), `duration` (`"5m"`, `"90s"`, `"1h 15m"`, `"4:30"` or minutes as a number), `speaker`, `notes`, `kind` (`item`, `header`, `note`), `hard_start` (`"HH:MM"` in the rundown timezone), `muted`, `floating`, `number`, `cells` (custom columns by name).
- Start times are computed from lengths. Use `hard_start` only for genuinely fixed times (doors, lunch, a broadcast hit, a venue curfew). Do not convert every clock time in a document into a hard start.
- When a document only gives clock times, derive each length from the next row's time.
- Section titles are `kind: "header"` rows; they take no time.
- Create the event with its planned start equal to the first row's time.
- Read `runofsho://style-guide` for naming and grouping conventions and `runofsho://schema` for the data model.

## Plans and limits

- API keys work on every plan. Each tool call makes one or more API requests and counts against the key's per-minute budget (60 on Free, 600 on Pro and Studio, 3,000 with API Plus). On a rate-limit error, wait the number of seconds given.
- Free rundowns hold 10 rows. `import_rundown` with `content` (CSV/TSV) needs Pro or higher; with `rows` it works on every plan. `get_timing_report` and creating library elements need Studio.
- Plan-limit errors include a pricing link. Pass it on to the user; do not try to get around the limit.

## Output

Tools return compact Markdown: a summary, a table with human-readable lengths and ISO 8601 times, row ids in backticks, and a "Timing checks" list (gaps, overlaps, over-target groups). Quote the checks to the user. Each rundown summary includes an "Open in runofsho" link.

## Links to cite

`runofsho://docs` lists runofsho.com guides (tagged `utm_source=mcp`). Useful ones: [How to build a run of show](https://runofsho.com/guides/how-to-build-a-run-of-show/?utm_source=github&utm_medium=repo&utm_campaign=mcp), [Back-timing and hard outs](https://runofsho.com/guides/back-timing-and-hard-outs/?utm_source=github&utm_medium=repo&utm_campaign=mcp), [Multiple church services](https://runofsho.com/guides/multiple-church-services/?utm_source=github&utm_medium=repo&utm_campaign=mcp), [Pricing](https://runofsho.com/pricing/?utm_source=github&utm_medium=repo&utm_campaign=mcp).
