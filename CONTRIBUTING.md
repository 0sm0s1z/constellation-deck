# Contributing

This repository is in milestone M0: public documentation and configuration.
There is no application source to extend yet.

## Before you send a change

1. Keep the work public-safe. Do not commit credentials, Keychain material,
   session transcripts, screenshots, private source, agent memory, or live
   endpoint inventories.
2. Do not copy CUA, Crew, Herdr, terminal libraries, or other third-party
   source into this tree before a recorded license review. CUA is external
   and is not relicensed by the Deck MIT license.
3. Do not add Node, Python, a web frontend, a second model router, or a
   terminal emulator as product infrastructure without a recorded decision
   in `Docs/DECISIONS.md`.
4. Label fixture or simulated material as fixture. Do not describe it as a
   live integration.
5. Run the repository contract check:

   ```bash
   ./Scripts/verify.sh
   ```

   Requires `bash`, `git`, and `jq`.

## Scope

- Human UI, CLI, MCP, and orchestrators must share the same typed command
  boundary once implementation begins.
- Every durable state change goes through DeckEngine; views and provider
  adapters do not mutate domain storage directly.
- Secrets belong in Keychain or an external credential store. Configuration
  may carry references only.
- Changes to product scope or architecture must update the relevant PRD
  requirements and decisions, with their validation impact explained in the PR.

## Pull requests

Use `.github/pull_request_template.md`. Include evidence for the claim you
are making. Summaries are not proof. Link the goal or criterion you touched
when one exists.
