# Constellation Deck MVP delivery record

## Objective and contract

Deliver the native Mac supervision workspace defined in [PRD.md](../../PRD.md). The current requested unit is M0: create the project/repository, publish basic configuration, and establish an exhaustive MVP specification. M1–M5 implementation is planned and has not been performed by this bootstrap.

Completion means the M5 real integration and pilot gates pass; no fixture, build, or documentation check substitutes for them. User-facing name: Constellation Deck (working name).

## Stack and scaffold

Stack: Swift 6 / SwiftUI / AppKit / per-user Swift service, selected from the operator's native Mac requirement. SQLite persistence behind an adapter. Apple Silicon, macOS 26 integration profile.

Detector: `agent-base stack recommend --product medium-ui --requested-stack '<native Swift stack>'` returned the requested stack, `source=explicit_user_request`, and `needs_clarification=false` on October 3, 2026. This records stack precedence, not a completed build.

Scaffold: documentation/configuration at M0; no application targets, Swift source, installer, dependency lockfile, or fake executable. Add an actual SwiftPM package/module graph with the M2 native shell; qualify service packaging and integration choices in M1.

Current validation: `./Scripts/verify.sh` for required files, public example configuration, CI contract, shell syntax, and whitespace. Native validation planned for M2: `swift build`, `swift test`, signed/debug app launch, and interactive fixture scenarios, all surfaced through the documented verification entry point when implemented.

## Delivery status

| Milestone | Status | Evidence / next gate |
| --- | --- | --- |
| M0 — Repository and specification | Complete | Public MIT repository; local validation and published specification CI passed; evidence below |
| M1 — Integration qualification | Not started | External bot wakeup, real Herdr/CUA control, licensing, service packaging |
| M2 — Visible native prototype | Not started | Fresh native window, explicitly labeled synthetic project, navigation and evidence |
| M3 — Live project loop | Not started | Real external orchestrator and Herdr, durable receipts, local/remote identities |
| M4 — Verification and recovery | Not started | CUA checks, bounded corrections, takeover, reconnect/crash scenarios |
| M5 — MVP acceptance | Not started | Full release scenario, independent review, pilot report |

GitHub Actions on the exact commit is the authority for remote M0 checks. This document deliberately does not infer an app build or live integration from documentation CI.

### M0 evidence — October 3, 2026

- Public repository: [0sm0s1z/constellation-deck](https://github.com/0sm0s1z/constellation-deck).
- Published specification and stricter verifier: commit `05fbbc4dd31aa36ba973e2505872b328ad048d4b`.
- [GitHub verification run 37157719489](https://github.com/0sm0s1z/constellation-deck/actions/runs/37157719489) completed successfully for that commit.
- Local `./Scripts/verify.sh` passed. Thirteen local Markdown references resolved, 59 requirement IDs were unique, and 20 acceptance scenarios were specified.
- Independent read-only Grok review inspected the PRD, architecture/status documents, config, verifier, workflow, templates, and Git state. Parent resolved publication-status ambiguity and added S02's explicit continuation-authorization precondition before publication.
- Reviewed and corrected the bootstrap's temporary missing-document warnings into required-file failures; example configuration rejects unexpected keys. No third-party implementation was copied and no real credentials/endpoints or runtime artifacts were included.
- App build, native UI, service installation, live adapters, and pilot are not implemented or verified. They remain M1–M5 gates.

## First bounded implementation handoff: M1

**Goal:** Prove the minimum control loop before committing to an embedded terminal or desktop architecture.

**Scope:** One existing test repository, two isolated worker worktrees, a supported external orchestrator, a selected Herdr/harness version, and one user-authorized CUA environment. Record capabilities and revisions. Start with discovery/read-only probes; install or expose services only within the operator's implementation authorization and established machine scope.

**Deliverables:** A reproducible integration note under `Docs/Qualification/`; a pinned compatibility matrix; real delivery/completion/wakeup receipts; viewer/takeover observations; one browser/app verification result; unknown-delivery recovery evidence; ADRs resolving D02–D07. Use synthetic or redacted public evidence.

**Non-goals:** New model router, cloud hosting, CUA fork, full editor, team sharing, broad UI implementation, production deployments, or claiming the MVP complete.

**Acceptance:** ORCH-03/05, ADAPT-01/02/04/06/09, and the feasible real S08/S12/S13 checks. A unsupported path must produce a documented narrowed proposal. Do not substitute a simulated success.

**Report:** Changes, software versions, observed behavior, validations by gate, unresolved risks, exact evidence locations, and recommended M2 surface choices.

## Delivery discipline

Every implementation unit cites PRD requirement IDs and its falsification test. Parallel writers use disjoint paths or worktrees. Record scoped commits, inspected diffs, validation, and review outcomes. Never mark a milestone complete because time or budget is exhausted.

For product/runtime regressions, stop advancement and repair the failing gate. For external API or license gaps, preserve the adapter boundary and make an explicit scope decision. Do not silently lower the acceptance criteria.
