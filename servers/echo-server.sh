#!/usr/bin/env bash
# Minimal stdio MCP server with a single "echo" tool, written in plain bash so
# the plugin runs no downloaded packages. Messages are newline-delimited JSON-RPC.
set -u

respond() { printf '{"jsonrpc":"2.0","id":%s,"result":%s}\n' "$1" "$2"; }
fail() { printf '{"jsonrpc":"2.0","id":%s,"error":{"code":%s,"message":"%s"}}\n' "$1" "$2" "$3"; }

while IFS= read -r line; do
  [[ $line =~ \"method\"[[:space:]]*:[[:space:]]*\"([^\"]+)\" ]] || continue
  method=${BASH_REMATCH[1]}
  # Notifications carry no id and must not get a response.
  [[ $line =~ \"id\"[[:space:]]*:[[:space:]]*(\"[^\"]*\"|[0-9]+) ]] || continue
  id=${BASH_REMATCH[1]}

  case $method in
    initialize)
      version="2025-06-18"
      if [[ $line =~ \"protocolVersion\"[[:space:]]*:[[:space:]]*\"([^\"]+)\" ]]; then
        version=${BASH_REMATCH[1]}
      fi
      respond "$id" "{\"protocolVersion\":\"$version\",\"capabilities\":{\"tools\":{}},\"serverInfo\":{\"name\":\"tobin-test-echo\",\"version\":\"0.1.0\"}}"
      ;;
    ping)
      respond "$id" '{}'
      ;;
    tools/list)
      respond "$id" '{"tools":[{"name":"echo","description":"Echo back the given message","inputSchema":{"type":"object","properties":{"message":{"type":"string","description":"Text to echo"}},"required":["message"]}}]}'
      ;;
    tools/call)
      if [[ ! $line =~ \"name\"[[:space:]]*:[[:space:]]*\"echo\" ]]; then
        fail "$id" -32602 "Unknown tool"
        continue
      fi
      message=""
      # The captured value is still JSON-escaped, so it can be embedded as-is.
      if [[ $line =~ \"message\"[[:space:]]*:[[:space:]]*\"(([^\"\\]|\\.)*)\" ]]; then
        message=${BASH_REMATCH[1]}
      fi
      respond "$id" "{\"content\":[{\"type\":\"text\",\"text\":\"Echo: $message\"}]}"
      ;;
    *)
      fail "$id" -32601 "Method not found"
      ;;
  esac
done
