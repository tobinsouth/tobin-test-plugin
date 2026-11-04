<p align="center"><img src="logo.svg" width="96" alt="tobin-test-plugin logo"></p>

# tobin-test-plugin

A small Claude Code plugin for testing plugin install, review, and MCP flows.

## What's inside

| Component | Path | Purpose |
|---|---|---|
| Skill: `hello-world` | `skills/hello-world/SKILL.md` | Confirms skills load; pings the MCP server's `echo` tool |
| Skill: `repo-summary` | `skills/repo-summary/SKILL.md` | Quick orientation to the current repo |
| Hook: SessionStart | `hooks/hooks.json` → `hooks-handlers/session-start.sh` | Injects a note into context so you can see the hook fired |
| MCP server: `echo` | `.mcp.json` → `servers/echo-server.sh` | Tiny stdio MCP server in plain bash with one `echo` tool; no packages downloaded |
| MCP server: `slack` | `.mcp.json` | Slack's hosted MCP server (`https://mcp.slack.com/mcp`); authenticates via OAuth on first use |
| MCP server: `australian-facts` | `.mcp.json` | [Australian Facts](https://australian-facts-mcp.tobin-south.workers.dev/docs) remote MCP server; OAuth with a pre-registered client ID (see below) |
| Icon | `.claude-plugin/icon.svg` (copy at `logo.svg`) | Plugin icon, 128×128 |

## Install

```
/plugin marketplace add tobinsouth/tobin-test-plugin
/plugin install tobin-test-plugin@tobin-test-plugin
```

Then start a new session and ask "is the test plugin working?".

## Australian Facts OAuth

`australian-facts` connects to `https://australian-facts-mcp.tobin-south.workers.dev/mcp` using a pre-registered OAuth client:

- `oauth.clientId` is the server's static client ID, and `oauth.callbackPort` pins the redirect to `http://localhost:33418/callback`.
- No client secret ships in this repo. The server accepts this client ID without a secret only for loopback redirects, and still requires PKCE plus a user sign-in and approval on its consent page.
- Run `/mcp`, pick `australian-facts`, and authenticate. A browser opens the sign-in page; after you approve, the tools `random_fact`, `search_facts` and `list_categories` become available.

## License

MIT
