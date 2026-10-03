# Initial architecture decisions

Date: October 3, 2026. These decisions establish the M0 baseline. Implementation and validation remain separate gates in [the PRD](../PRD.md).

## ADR-001 — Native Mac application and durable Swift service

**Decision:** Swift 6, strict concurrency, SwiftUI presentation, AppKit behind platform adapters, SwiftPM modules, and a per-user Swift background service. Target macOS 26 and Apple Silicon for the first integration profile. Introduce XcodeGen with app/service packaging in M2. Use SQLite through a reviewed adapter for durable events, metadata, receipts, and an outbox; content-addressed files hold artifacts.

**Reason:** The user explicitly wants a native Mac application similar in quality and interaction to their existing native tools. CUA Spaces currently requires macOS 26. A service allows UI closure without losing coordination. One native language minimizes cross-runtime contracts before there is a demonstrated need for a separate host daemon.

**Alternatives:** Electron/Tauri shell; Go service; UI-owned execution. These remain possible future decisions, but are not the baseline. No Swift package or stub executable is required for documentation-only M0.

**Evidence:** `agent-base stack recommend` selected the requested native stack with `source=explicit_user_request` and no clarification requirement. Native Swift details are project architecture decisions; the operator's explicit requirement was a native Mac experience.

**Validation:** M1 qualifies launchd/service packaging and supported toolchain. M2 builds and launches the first real native shell. See NFR-01 through NFR-10.

## ADR-002 — Project goals and evidence are the product's durable center

**Decision:** A project holds versioned goals and acceptance criteria; sessions and environments are attached resources. Worker completion, verification, and human acceptance are distinct. Historical acceptance records refer to immutable manifests, and later contrary evidence challenges rather than rewrites history.

**Reason:** The motivating friction is repeated supervision and unsupported completion claims. A terminal manager or conversation viewer alone cannot resolve it.

**Consequence:** State transitions, provenance, and recovery precede broad UI polish. Reports render structured facts and can add optional generated summaries; summaries never establish proof.

## ADR-003 — External orchestrator first; common command contract

**Decision:** Qualify one existing orchestrator in M1. Prefer Grok Bot, with Hermes as a documented fallback if the supported wakeup path cannot be proven. UI, CLI, MCP, and a future internal orchestrator use the same typed command service and authorization boundary. The future internal orchestrator is deferred from MVP.

**Reason:** The product should improve the operator's existing workflow without requiring replacement intelligence. Tool access alone does not establish asynchronous wakeup or reliable continuation.

**Consequence:** Delivery/wakeup is a real qualification gate. Manual prompting is a development fallback and cannot satisfy ORCH-05. Proposed tool names in the PRD are not claims of existing third-party APIs.

## ADR-004 — One owner for each execution lifecycle

**Decision:** Herdr owns its coding TUI processes. CUA supplies attached environment, desktop, and computer-use capabilities. Deck owns intent, dispatch, leases, and acceptance. Constellation owns inference routing/seat/context policy for compatible requests.

**Reason:** Duplicate ownership creates conflicting starts, stops, retries, and uncertain recovery. Harness behavior remains material even when inference routes through Constellation.

**Consequence:** CUA's agent-start APIs are an alternate execution-adapter option, not a second controller for the same Herdr-owned process. No CUA provisioning, terminal emulator, router rewrite, or credential migration in MVP.

## ADR-005 — MIT core with optional external dependencies

**Decision:** Publish Deck-owned files under MIT. Treat CUA Spaces as an optional user-installed integration. Do not copy or link FSL components into Deck until the selected operation, component license, and intended distribution have been reviewed. Do not copy Crew or other local repositories based solely on access to their source.

**Reason:** CUA has MIT and FSL components; the actual FSL competing-use restriction includes commercial products and services. Root repository descriptions do not settle every component's license. External integration is not itself a legal exemption.

**Consequence:** M1 may choose an external viewer for live surfaces. Exact authenticated viewing plus truthful control/evidence behavior is preferable to an unlicensed embedded implementation. No third-party code is vendored in M0.

## ADR-006 — Durable intent with reconciliation of uncertain effects

**Decision:** Persist events, materialized state, command receipt, and outbox intent atomically before external I/O. Use idempotency keys locally and adapter-specific reconciliation for delivery uncertainty. Per-project sequences order local history; remote clocks are not a global ordering authority.

**Reason:** Retrying a command after a timeout can duplicate work. An outbox cannot make an arbitrary external side effect exactly-once.

**Consequence:** Unknown delivery is a user-visible state. Reconnection may require a decision before another write. A sleeping Mac suspends its local coordinator even when remote workers remain alive.

## ADR-007 — First visible slice uses explicit fixtures

**Decision:** M2 provides a native overview/live-work/evidence/conversation experience using synthetic fixtures, then M3/M4 connect qualified real adapters. M1 resolves critical integration uncertainty before those interfaces are promised.

**Reason:** The operator should see and shape the experience early. A fixture demo must not be presented as a working autonomous MVP.

**Consequence:** Fixture mode is labeled everywhere and has no external effects. M5 requires actual bot, Herdr, CUA, and verification evidence. The M0 configuration is documentation only.

## Change control

Supersede an ADR with a dated decision that explains the trigger, considered alternatives, changed PRD requirements, compatibility consequences, and validation. Do not silently change the stack or remove an acceptance gate to make an implementation appear complete.
