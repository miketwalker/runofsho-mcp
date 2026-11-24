#!/bin/sh
# Adds the runofsho MCP server to Claude Code. Replace the key, or export RUNOFSHO_API_KEY first.
claude mcp add --transport http runofsho https://api.runofsho.com/mcp \
  --header "Authorization: Bearer ${RUNOFSHO_API_KEY:-rd_live_your_key}"
