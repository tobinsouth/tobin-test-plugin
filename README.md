<p align="center"><img src="logo.svg" width="96" alt="tobin-test-plugin logo"></p>

# tobin-test-plugin

A small Claude Code plugin for testing plugin install, review, and MCP flows.

## What's inside

| Component | Path | Purpose |
|---|---|---|
| Skill: `hello-world` | `skills/hello-world/SKILL.md` | Confirms skills load; pings the MCP server's `echo` tool |
| Skill: `repo-summary` | `skills/repo-summary/SKILL.md` | Quick orientation to the current repo |
| Hook: SessionStart | `hooks/hooks.json` → `hooks-handlers/session-start.sh` | Injects a note into context so you can see the hook fired |
| MCP server: `everything` | `.mcp.json` | The reference `@modelcontextprotocol/server-everything` test server (needs Node/npx) |
| Logo | `logo.svg` | Plugin icon |

## Install

```
/plugin marketplace add tobinsouth/tobin-test-plugin
/plugin install tobin-test-plugin@tobin-test-plugin
```

Then start a new session and ask "is the test plugin working?".

## License

MIT
