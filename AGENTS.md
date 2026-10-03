# Constellation Deck agent contract

## Product and authority

Deck is a native macOS project supervision workspace for human operators and external orchestrators. Read `PRD.md` before implementation. Its numbered requirements and milestone exit criteria are the product contract. `Docs/DECISIONS.md` records architecture decisions; `programs/mvp/PROGRAM.md` records delivery status. A plan is not implementation evidence.

## Stack

Swift 6 with strict concurrency; SwiftUI chrome and AppKit only behind platform adapters. SwiftPM owns module definitions; add XcodeGen when packaging the first app. The durable service is Swift. SQLite is the intended event/metadata store, through a reviewed adapter. This documentation/configuration bootstrap contains no app implementation yet. Do not introduce Node, Python, a web frontend, a second model router, or a terminal emulator as product infrastructure without a recorded architecture decision.

## Invariants

- Human UI, CLI, MCP, and orchestrators use the same typed command boundary.
- Every state change goes through DeckEngine; views and provider adapters cannot mutate domain storage directly.
- Record durable intent before external effects. Commands carry idempotency keys; ambiguous external delivery is reconciled, never blindly repeated.
- Worker completion, verification, and human acceptance are distinct states.
- Bind evidence to its goal/criterion version, checkout, revision or dirty-tree fingerprint, environment, and observer. Summaries are not proof.
- Constellation owns inference routing and seat policy. Harnesses execute tools; Deck owns project state, capability authorization, and acceptance.
- Herdr owns its terminal processes; CUA owns attached computer capabilities. Never give both lifecycle ownership of the same worker.
- One controller holds a surface lease at a time. Human takeover revokes automated writes and requires fresh observations before resumption.
- Secrets stay in Keychain or external credential stores. Never commit credentials, session transcripts, screenshots, actual endpoint inventories, private source, or agent memory.
- Deck-owned code is MIT. Do not copy Crew, CUA FSL components, terminal libraries, or other third-party source before license review. CUA is optional and external during MVP.
- Fixture data must be visibly labeled. Never describe a simulated run as a live integration.

## Execution

Follow the operator's multi-model routing policy when supplied. Delegated workers do only their assigned paths and do not delegate again. Parallel writers require disjoint paths or separate worktrees. Commit completed scoped changes; never skip hooks or force-push. Push only when requested or when the active task explicitly includes publication.

For any change, inspect the final diff and run `./Scripts/verify.sh`. Once Swift code exists, extend that entry point with native build/test checks; documentation validation alone never establishes app acceptance. UI changes require a freshly built app and interactive evidence. Risky runtime changes require independent review. Update delivery status only with actual evidence and state unverified gates explicitly.

## Scope

Deliver M0 through M5 from the PRD in order except documented independent work. The current task is M0: public repository, configuration, and exhaustive MVP specification. No installation of CUA/Herdr, access to development hosts, VM creation, credential changes, or production deployment is implied by this bootstrap.
