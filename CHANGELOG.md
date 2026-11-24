# Changelog

All notable changes to the runofsho MCP server. The server is hosted; versions here match `serverInfo.version` and `server.json`.

## 1.1.0 (2026-11-24)

- Sign-in with a runofsho account (OAuth 2.1 with PKCE, dynamic client registration, protected resource metadata), so claude.ai and ChatGPT on the web can connect. The consent page picks one team; scopes are `read` and `edit`, with no playback scope. API keys keep working.
- A request without a credential now gets `401` with a `WWW-Authenticate` header that points to the sign-in metadata. `initialize` and `tools/list` used to answer without a key; MCP directories can read `server.json` or the [server card](https://runofsho.com/.well-known/mcp/server-card.json) instead.
- `server.json`: the `Authorization` header is optional, and the publisher-provided `_meta` declares the OAuth sign-in (protected resource and authorization server metadata, scopes). The server card on runofsho.com declares the same.
- Disconnecting an assistant in runofsho takes effect within 20 minutes.

## 1.0.0 (2026-11-24)

First release.

- Hosted Streamable HTTP endpoint at `https://api.runofsho.com/mcp`, authenticated with runofsho API keys.
- Read tools: `list_events`, `get_rundown`, `get_room_status`, `get_timing_report`, `search_library`.
- Plan tools: `create_event`, `import_rundown`, `edit_rows`, `set_service_times`, `duplicate_rundown`, with preview-then-confirm diffs, version checks and idempotency keys.
- Prompts: `build_rundown_from_doc`, `post_show_timing_report`, `prep_next_service`, `check_timing_gaps`.
- Resources: `runofsho://docs`, `runofsho://schema`, `runofsho://style-guide`.
- No live playback control.
