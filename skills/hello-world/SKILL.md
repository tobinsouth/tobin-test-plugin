---
name: hello-world
description: Greet the user and confirm the tobin-test-plugin is installed and its skills load. Use when the user says "hello test plugin", "is the test plugin working", or asks to verify plugin skills.
---

# Hello World

Confirm that this plugin's skills are loading.

1. Reply with: "tobin-test-plugin is installed and the hello-world skill loaded."
2. List the other components this plugin ships: the `repo-summary` skill, the SessionStart hook, the `echo` MCP server, and the `slack` MCP server.
3. If the `echo` MCP server's tool is available (named `mcp__plugin_tobin-test-plugin_echo__echo`), call it with the message "hello from tobin-test-plugin" and show the result. If they aren't available, say so.
