---
name: repo-summary
description: Produce a short summary of the current repository — language mix, top-level layout, and recent commits. Use when the user asks for a "repo summary", "what is this repo", or a quick orientation to the working directory.
---

# Repo Summary

Give a quick orientation to the current working directory.

1. Run `git rev-parse --show-toplevel` to find the repo root. If it is not a git repo, say so and summarize the directory instead.
2. List the top-level files and directories, skipping `node_modules`, `.git`, and build output.
3. Count files by extension to estimate the language mix.
4. Show the last 5 commits with `git log --oneline -5`.
5. Write a summary of at most 10 lines: what the project appears to be, its main language, and where the entry points likely are.
