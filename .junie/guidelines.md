Project Guidelines These guidelines tell Junie how to work in this repository.

This repo is a Jekyll site for GitHub Pages using Nix flakes for development and GitHub Actions for CI/CD.

The local MCP for Nix and Nix packages is defined in .junie/mcp/mcp.json under the key "nixos" Use it to check
correctness and get guidance for Nix-specific questions. If MCP is unavailable, ask the user to run it locally and
report back results.

Git commits;

- Use Conventional Commits.
- Subject line must be at most 50 characters.
- Leave a blank line between subject and body.
- Wrap body lines at 72 characters max.
