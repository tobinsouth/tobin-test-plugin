#!/usr/bin/env bash
# Adds a note to the session context so it's easy to confirm the hook fired.
cat <<'JSON'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "tobin-test-plugin is active. Its SessionStart hook fired. Skills available: hello-world, repo-summary."
  }
}
JSON
