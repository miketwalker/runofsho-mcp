# Client config files

Copy the file for your assistant, replace `rd_live_your_key` with a runofsho API key (create one under **API keys** in the runofsho app menu), and restart the client. Full instructions for each client: [runofsho.com/mcp](https://runofsho.com/mcp/?utm_source=github&utm_medium=repo&utm_campaign=mcp#connect-your-assistant).

| Client | File | Where it goes |
|---|---|---|
| Claude Desktop | [`claude-desktop.json`](claude-desktop.json) | Settings → Developer → Edit config (`claude_desktop_config.json`). Uses the `mcp-remote` bridge, which needs Node.js. |
| Claude Code | [`claude-code.sh`](claude-code.sh) | Run it once; check with `/mcp` inside Claude Code. |
| ChatGPT desktop app and Codex | [`codex-chatgpt-desktop.config.toml`](codex-chatgpt-desktop.config.toml) | `~/.codex/config.toml`, with `RUNOFSHO_API_KEY` set in the environment. |
| Cursor | [`cursor.mcp.json`](cursor.mcp.json) | `~/.cursor/mcp.json` (all projects) or `.cursor/mcp.json` (one project). |
| VS Code | [`vscode.mcp.json`](vscode.mcp.json) | `.vscode/mcp.json` in your workspace. VS Code asks for the key and stores it securely. |
| Windsurf | [`windsurf.mcp_config.json`](windsurf.mcp_config.json) | `~/.codeium/windsurf/mcp_config.json`. |

**claude.ai and ChatGPT on the web** need no file: add `https://api.runofsho.com/mcp` as a custom connector (claude.ai) or a custom MCP server with OAuth (ChatGPT) and sign in with your runofsho account. See [Quick connect](../README.md#quick-connect).

Never commit a file with a real key in it. Use a `read`-scope key if the assistant only needs to look.
