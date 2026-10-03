# Constellation Deck — MVP product requirements

| Field | Value |
| --- | --- |
| Document version | 0.1 |
| Date | October 3, 2026 |
| Status | Proposed implementation baseline; M0 documentation and configuration |
| Product name | Constellation Deck (working name; rename without changing architecture) |
| Primary platform | Native macOS; Apple Silicon first |
| Audience | Individual developers supervising agentic development across their own machines |
| License | MIT for Deck-owned code; third-party components retain their own licenses |
| Completion target | M5 acceptance demonstrated on real integrations; earlier fixture milestones are not the MVP |

## 1. Product decision

Build a project-centered supervision workspace in which a developer and an orchestrator share goals, observable development sessions, evidence, and decisions. Deck keeps development work inspectable while making completion an explicit, evidence-backed state.

The first version attaches an existing external orchestrator to visible Herdr worker sessions and a CUA environment. Constellation Router remains the authority for inference routing, subscription seats, and supported context policy. Deck owns project state, dispatch receipts, continuation constraints, evidence, and acceptance. It must not become another model router or require a new coding harness.

The primary user asks their orchestrator for an outcome, watches as much of the work as they choose, intervenes when useful, and receives a report linked to the actual result. Worker turn completion starts evaluation; it does not prove the requested outcome.

This repository starts with specification and configuration. No statement in this document establishes that a feature has shipped. Delivery evidence belongs in `programs/mvp/PROGRAM.md` and milestone records.

## 2. Problem and product hypothesis

### 2.1 Current problem

An operator uses an assistant such as Grok Bot or Hermes to drive coding TUIs through Herdr. The visible terminals make the work understandable and allow takeover. The operator nevertheless repeatedly supplies continuation prompts, finds missing validation, reconstructs state after disconnects, and compares a worker's claims with the actual application.

Fragmented conversations, terminals, computers, issue trackers, and model settings obscure the relationship between intent and result. Additional agents can increase coordination overhead unless their work has shared identity and explicit acceptance criteria.

### 2.2 Hypothesis

If durable goals and verification requirements sit above replaceable workers and computers, an orchestrator can close routine feedback loops while the operator retains visibility and control. A concise report backed by inspectable evidence can reduce active supervision without hiding execution.

### 2.3 What we must prove

1. An external orchestrator can use Deck through supported interfaces and receive work-result notifications reliably enough to continue a development loop.
2. Two workers can make bounded progress without corrupting a shared checkout or competing for the same surface.
3. A stopped worker cannot silently satisfy an incomplete goal.
4. A real browser or application check can reject a plausible but incorrect completion claim.
5. Closing the window or losing a network connection preserves accepted intent and does not duplicate side effects.
6. The operator can understand and take control of the exact session the orchestrator is driving.

### 2.4 Reasons to stop or narrow the product

Reassess after the integration spike if external bot wakeup is unavailable, the chosen worker cannot be observed and interrupted safely, CUA's chosen revision cannot support the required desktop interaction, or the integration's license is incompatible with public distribution. Preserve the project/evidence layer and reduce the adapter set rather than rebuilding all upstream infrastructure.

Reassess after the pilot if coordination costs exceed saved supervision, completion reports are routinely misleading, or the same value is available through a small extension to an existing tool. A attractive dashboard alone does not validate the product hypothesis.

## 3. Users and jobs

### 3.1 Primary user

A single technical operator with a Mac, one or more development hosts, existing coding harness subscriptions, an external orchestrator, and a working Constellation Router. They prefer assigning outcomes to an orchestrator over continuously prompting worker TUIs. They want direct access to execution when a report is insufficient.

### 3.2 Secondary user

An open-source contributor using fixture mode or a compatible local setup without Constellation, CUA, or a paid subscription. They must be able to build and explore the product without access to the original operator's infrastructure. Live inference and computer capabilities remain unavailable until configured.

### 3.3 Jobs to be done

- Start a bounded change with a shared definition of done.
- Follow multiple workers without reading every terminal continuously.
- Discover which task needs a decision and why.
- See the running product that was actually verified.
- Take over a terminal or computer, then hand it back without conflicting input.
- Continue after app relaunch, bot reconnection, or host failure without guessing what happened.
- Share the relevant conversation and evidence with another agent without assuming identical native session state.
- Audit why a goal is marked verified, rejected, or accepted.

## 4. Scope and boundaries

### 4.1 MVP topology

One operator; one Mac application and its local background service; one project in the release acceptance scenario; two worker sessions; one local host and one remote development host; one attached CUA validation environment; one qualified external-orchestrator integration. The data model supports additional projects and environments, but the MVP makes no unlimited-scale claim.

Grok Bot is the preferred first orchestrator because it reflects the primary workflow. M1 must establish a supported delivery/wakeup path. If unavailable, qualify Hermes through the same interface and record Grok Bot as unsupported for autonomous wakeup. Do not describe manual copy/paste or an unimplemented callback as integration success.

### 4.2 Must ship

| Area | MVP obligation |
| --- | --- |
| Native shell | Project sidebar, overview, live work, evidence, conversation, decisions, and settings |
| Project goals | Versioned intent, criteria, assignments, budgets, explicit acceptance |
| External orchestration | Scoped tools/CLI, durable command receipts, event cursor, reconnect and wakeup strategy |
| Herdr | Attach real sessions, inspect state/output, send prompts, wait, interrupt where supported, open exact live session |
| CUA | Attach an existing environment, negotiate capabilities, view it, run bounded verification, preserve provenance |
| Router | Configured Constellation access and capability/health reporting; no duplicate routing policy |
| Evidence | Structured check results, artifacts, revision identity, stale/expired states, report links |
| Continuation | Bounded correction loop, repeated-failure detection, explicit blocked and decision states |
| Recovery | App relaunch, reconnect, ambiguous delivery, stale leases, journal replay |
| Human control | Explicit takeover/release and prevention of competing automated input |
| Developer access | Public documentation, fixture mode, reproducible native build and verification |

### 4.3 Deferred

- Built-in general-purpose orchestrator and bot marketplace.
- Provider credentials, seat scheduling, skill-selection intelligence, or a model-routing engine implemented in Deck.
- Hosting desktops as a service, managing cloud billing, creating a fleet, or bundling a CUA fork.
- Automatic migration of a live provider conversation between arbitrary harnesses.
- Multi-user shared editing, organizations, public report links, mobile app, and cross-device Deck database sync.
- Full code editor, language-server platform, terminal emulator, remote-desktop codec, or replacement multiplexer.
- Autonomous production deployments, automatic merges, purchases, or external communications enabled by default.
- General browser automation of consumer chat products as the primary orchestrator transport.
- Local S1 inference, continuous video interpretation, unlimited work fan-out, and automated issue-tracker synchronization.
- Automatic git conflict resolution across workers or writable shared network checkouts.

### 4.4 Work boundary

Workers operate on an explicitly selected repository checkout and branch/worktree on a named environment. A local folder name is not sufficient identity for a remote checkout. Parallel writers require separate worktrees or an explicitly validated disjoint-file contract; the default is separate worktrees. Only a designated integration run combines changes. Deck does not equate a shared repository URL with shared filesystem state.

## 5. Product principles

1. **Evidence before acceptance.** A worker statement, a green spinner, or elapsed time cannot establish success.
2. **Visible when useful.** A readable report is the default; exact live sessions and raw evidence remain reachable.
3. **One command boundary.** Human UI, CLI, MCP, and orchestrators use the same authorization and state transitions.
4. **Replaceable intelligence and execution.** Agent identity, goal state, harness session, model route, and computer instance are separate.
5. **Truthful uncertainty.** Unknown, disconnected, stale, partial, unsupported, and simulated are visible states.
6. **Durable intent.** Closing the UI does not cancel accepted work. Recovery reconciles external state before writing again.
7. **Bounded autonomy.** Continuation is useful only within scope, permission, time, and retry limits.
8. **Human control is enforceable.** A takeover button changes write admission, not merely its label.
9. **Own the narrow product.** Use established terminals and computer interfaces; avoid rebuilding them for visual consistency.

## 6. End-to-end experience

### 6.1 First launch

The app explains its current mode and offers an explicitly labeled fixture workspace or connection setup. Fixture mode uses synthetic content and performs no external actions. The user can inspect a running, failed, blocked, and accepted example without credentials.

Connection setup is stepwise: register project; attach Herdr; attach CUA; configure optional Constellation; connect the orchestrator. Each connection displays capabilities and the last successful observation. Unsupported capabilities remain disabled with an explanation. A health check must not install software, launch agent authentication, or mutate a host.

### 6.2 Assign work

The operator creates a goal with intent, target checkout, acceptance criteria, allowed environments, and continuation limits. Deck displays a reviewable goal contract before enabling autonomous dispatch. The external orchestrator can propose that contract, but cannot silently broaden the scope later.

The orchestrator creates bounded assignments and dispatches them to attached workers. The overview shows each assignment, its controller, branch/worktree, current state, and linked live surface. A command acknowledgement means the request was recorded; execution has a separate status.

### 6.3 Verify and correct

A worker reports completion. Deck enters verification-pending and evaluates required checks. Automated checks execute through a constrained verifier with recorded inputs/results. Subjective checks explicitly require human judgment. Missing or failed evidence prevents verified status.

A correction prompt includes the failed criterion, observed result, evidence, target revision, remaining scope, and attempt budget. Deck records the attempt before delivery. The orchestrator does not receive an unbounded generic continue instruction. A repeated failure or exhausted budget changes the goal to blocked or needs-decision, with a concrete explanation.

### 6.4 Inspect and take over

The operator opens the exact worker surface or CUA computer from a report. Requesting takeover first closes automated write admission for that surface and cancels queued writes. Already dispatched actions are allowed to settle or reported as in-flight; the UI does not promise control until the barrier is established. Reads and observations may continue.

On release, Deck creates a new control generation, refreshes the surface observation, and resumes only after explicit operator intent. The worker receives a summary of material human changes where available. Unsupported takeover remains unavailable rather than simulated.

### 6.5 Return later

On reopening the window, the service supplies a durable snapshot plus subsequent events. The app reconciles attached sessions. Completed verification remains linked to its revision; a newer revision marks relevant evidence stale. Offline environments remain visible and cannot be silently replaced by a local checkout.

### 6.6 Accept or reject

The operator opens a report, inspects required evidence, and accepts the verified goal or requests a scoped revision. Acceptance records actor, goal version, criteria version, revision, and evidence manifest. Acceptance is distinct from deployment, merge, or issue closure. A material edit to an accepted goal starts a new goal version and preserves the prior decision.

## 7. Information architecture and interface

### 7.1 Window anatomy

Sidebar: projects and attention counts. Main region: selected project view. Optional trailing inspector: selected run, criterion, artifact, or decision. Persistent project header: goal state, active controller, connectivity, pause, and open-live-work actions.

The main views are Overview, Live work, Evidence, and Conversation. Decisions are an accessible project queue surfaced in Overview and the inspector. Settings contains connections and defaults; it does not hide active permission requests.

### 7.2 Overview

Show the active objective and acceptance progress first, followed by decisions/failures, active work, and the latest result. Use a sentence describing the current activity, its start/observation time, and its source. A count of passed checks is accompanied by failed, missing, stale, and human-required checks. Do not collapse them into a misleading percentage.

Reports contain: outcome summary, completed criteria, unresolved criteria, material changes, evidence links, revision/environment identity, and next action. Model-authored prose is labeled as a summary. Machine facts come from check records. Unsupported summary generation falls back to a deterministic template.

### 7.3 Live work

Show up to four live tiles in the MVP qualification profile; one expanded surface receives the primary interaction focus. Each tile identifies project, goal/run, host, session, branch/worktree, observed state, observation age, and controller. Hidden surfaces reduce capture frequency or detach video; process lifetime is unaffected.

For Herdr, embedded live terminal rendering is optional in the first working slice. An exact-session attach/open action plus a current structured output view is acceptable only if it reaches the same live session and takeover works there. A fabricated terminal transcript is not an interactive session. M1 decides the supported embedding strategy before visual implementation promises it.

For CUA, use an existing supported viewer or independently licensed integration. In-app streaming is preferred but subject to the licensing gate. The accepted fallback opens the exact authenticated external viewer with a clear indication that control has moved there; Deck still records evidence and controller state. Never expose auth tokens in viewer URLs or screenshots.

### 7.4 Evidence view

Group by criterion, then attempt. A result row shows pass/fail/error/unknown, actual subject revision, observer, timestamp, duration, and artifacts. Open structured details without loading every log. Diff text, images, and supported plain text render in bounded viewers; arbitrary agent HTML/scripts never execute as reports. Downloads and unsupported types have explicit open actions.

Keep original evidence immutable. Annotations and summaries create derived artifacts linked to originals. Redaction creates an explicitly marked derivative; it never changes an original while keeping its old digest.

### 7.5 Conversation

The project conversation collects operator/orchestrator messages and selected worker updates. Raw worker transcripts are separate references, not automatically merged into one apparent speaker. Show author, originating session, timestamp, and whether content is imported, live, summarized, or synthetic.

Provide follow-up, attach evidence, propose criterion, and create handoff actions. Imported text is source material and cannot grant permissions or become a command without an authorized actor's action.

### 7.6 Empty, degraded, and accessibility states

| State | Required behavior |
| --- | --- |
| No project | Explain the product and offer fixture exploration or project registration |
| No worker | Offer connection instructions; no pretend active tiles |
| No CUA | Show unavailable computer verification; terminal checks remain usable |
| Missing credential | Name the connection requiring setup without displaying a secret |
| Offline host | Retain last observation with stale/offline label; disable writes |
| Permission denied | Explain which action was refused and how the operator can change policy |
| Unknown delivery | Stop automatic retry and present reconciliation status |
| Failed summary | Keep evidence and deterministic report available |
| Service unavailable | Show reconnect/restart actions; do not wipe local project state |
| Corrupt history | Open recoverable read-only mode and provide an explicit repair/export route |

Target a usable 1,024 × 700 window with collapsible inspector; larger screens permit side-by-side evidence and live work. Support keyboard navigation, VoiceOver labels, system text sizing where applicable, increased contrast, reduced motion, light/dark appearance, and non-color state cues. A live surface must not trap keyboard focus. Destructive controls are distinguishable from stop/pause.

## 8. Functional requirements

Requirement IDs are stable. Changing intent requires a versioned edit and migration/acceptance impact review. All requirements below are MVP musts unless explicitly marked deferred.

### 8.1 Project and goal management

| ID | Requirement | Acceptance evidence |
| --- | --- | --- |
| PROJ-01 | Register a repository and environment-specific checkout identity without modifying it | Attach fixture and real checkout; observe no checkout mutation |
| PROJ-02 | Persist goals with title, intent, scope, criteria, assignments, policy, and versions | Restart and reproduce the exact goal contract |
| PROJ-03 | Require criterion type, verifier, expected result, subject, and required/optional flag | Invalid incomplete criteria rejected with actionable errors |
| PROJ-04 | Record changes to intent/criteria and invalidate affected evidence | Edit criterion and observe verification reopen |
| PROJ-05 | Give each writing worker an owned checkout/worktree | Conflicting ownership rejected; independent worktrees accepted |
| PROJ-06 | Support pause, resume, cancel, archive, and export with explicit semantics | Scenario matrix preserves history and does not delete checkouts |

### 8.2 Orchestrator integration

| ID | Requirement | Acceptance evidence |
| --- | --- | --- |
| ORCH-01 | Expose scoped CLI and MCP adapters over the same command service | Equivalent commands produce equivalent authorized transitions |
| ORCH-02 | Authenticate connections and bind each to allowed projects/capabilities | A connection cannot operate outside its grant |
| ORCH-03 | Qualify one real external orchestrator for dispatch, observation, and continuation | Recorded real run, not a scripted model transcript |
| ORCH-04 | Provide durable event cursor and snapshot/reconciliation APIs | Consumer reconnect observes missing changes without duplicate dispatch |
| ORCH-05 | Qualify event wakeup or bounded polling with an explicit ownership/liveness contract | Lost notification recovered; idle orchestrator reported honestly |
| ORCH-06 | Accept idempotent commands and expose delivery/execution receipts | Duplicate command returns same receipt and one effect |
| ORCH-07 | Separate imported conversation text from executable authority | Imported request to expand permissions has no effect |
| ORCH-08 | Support reference and structured handoff; advertise native resume only when supported | Unsupported resume rejected before external mutation |

### 8.3 Worker and computer adapters

| ID | Requirement | Acceptance evidence |
| --- | --- | --- |
| ADAPT-01 | Discover attached Herdr sessions with version and capabilities | Exact session/occupant identities visible; missing capabilities explicit |
| ADAPT-02 | Prompt/read/wait on pinned worker occupants through supported Herdr APIs | Replaced pane occupant cannot satisfy old wait or receive old command |
| ADAPT-03 | Keep worker lifetime independent from the Deck window | Close/reopen UI while the worker continues |
| ADAPT-04 | Attach existing CUA environments through supported APIs | Capability handshake and exact environment identity stored |
| ADAPT-05 | Show a real desktop and capture evidence from the selected target | Evidence identifies environment/window and actual observed result |
| ADAPT-06 | Use capability negotiation, not assumptions from platform name | Unsupported input shape returns refusal, never an optimistic success |
| ADAPT-07 | Keep session lifecycle ownership singular | Herdr-owned run is never independently started/stopped by CUA agent lifecycle APIs |
| ADAPT-08 | Qualify local and remote paths using the same domain commands | Same operation on two environments preserves identity and policy |
| ADAPT-09 | Attach/open the exact live Herdr or CUA surface | Operator verifies same session, including interaction and return |

### 8.4 Verification and evidence

| ID | Requirement | Acceptance evidence |
| --- | --- | --- |
| VERIFY-01 | Treat worker completion as a claim requiring evaluation | Deliberately incomplete worker remains unverified |
| VERIFY-02 | Run an automated command check with argv/cwd/timeout/output/exit status | Pass, failure, timeout, and execution error distinguished |
| VERIFY-03 | Run a real browser or native application scenario and inspect resulting state | Seeded UI defect rejected despite successful build |
| VERIFY-04 | Bind results to criterion version and exact checkout/deployed build identity | Revision mismatch marks stale or inconclusive |
| VERIFY-05 | Preserve immutable evidence artifacts and digest-based manifests | Modified artifact detected; report cannot silently reference replacement bytes |
| VERIFY-06 | Mark human-only criteria and require explicit judgment | Automated observer cannot satisfy human-required criterion |
| VERIFY-07 | Keep summaries subordinate to structured checks | Positive summary over failed check cannot advance goal |
| VERIFY-08 | Invalidate evidence after relevant code/config/environment changes | Relaunch against older deployed build cannot establish current success |
| VERIFY-09 | Require all mandatory current criteria for verified status | Missing, stale, expired, error, and unknown results block transition |
| VERIFY-10 | Record explicit operator acceptance independently from verification | Accepted receipt identifies exact evidence manifest and actor |

### 8.5 Continuation and control

| ID | Requirement | Acceptance evidence |
| --- | --- | --- |
| LOOP-01 | Automatic continuation is off until enabled for a reviewed goal contract | Default fixture/live setup dispatches no autonomous correction |
| LOOP-02 | Default maximum is three corrective attempts and 60 minutes per goal execution cycle, including corrections | Exhaustion becomes blocked, without a fourth correction or a correction resetting the deadline |
| LOOP-03 | Stop after two equivalent failures without material progress | Repeated identical failure produces a decision with evidence |
| LOOP-04 | Correction prompts cite failed criterion and current evidence | Prompt omits stale evidence and preserves assigned scope |
| LOOP-05 | Pause disables new dispatch; cancellation requests active-run interruption | Pending stop confirmation remains visible until reconciled |
| LOOP-06 | Takeover blocks automated input with a control-generation fence | Queued old-generation write rejected after takeover |
| LOOP-07 | Release requires fresh observations and explicit resumption | Agent cannot act from a pre-takeover screenshot |
| LOOP-08 | Side effects requiring approval cannot be authorized by an agent's prose | Direct adapter call cannot bypass the command authorization gate |

### 8.6 Persistence, reports, and interoperability

| ID | Requirement | Acceptance evidence |
| --- | --- | --- |
| DATA-01 | Commit events, projections, command receipts, and pending effects atomically | Crash-point tests show no acknowledged intent lost |
| DATA-02 | Replay persisted history with versioned events | Clean projection rebuild matches original state |
| DATA-03 | Reconcile ambiguous external delivery before retry | Disconnect after send produces no blind second send |
| DATA-04 | Keep external provider payloads behind adapters | Domain fixtures contain normalized types only |
| DATA-05 | Export a bounded project manifest, selected messages, report, and artifacts | Import as reference preserves provenance and grants no execution rights |
| DATA-06 | Support artifact retention and explicit deletion/tombstones | Expired evidence is visibly unavailable; acceptance history remains honest |
| DATA-07 | Provide deterministic reports without an LLM | Router outage does not hide checks or block reading state |
| DATA-08 | Correlate router decisions when supplied without fabricating telemetry | Missing cost/route data displays unavailable, not zero |

## 9. Completion model

### 9.1 Goal state

`draft → ready → running → verification_pending → verified → accepted`

Additional states: `needs_decision`, `blocked`, `paused`, `cancel_requested`, `cancelled`, and `archived`. Connectivity is a separate health dimension. A disconnected host must not convert running work into success, failure, or cancelled without evidence.

| Transition | Authority and precondition |
| --- | --- |
| draft → ready | Operator approves complete intent/criteria/policy contract |
| ready → running | Authorized dispatch accepted; execution starts or remains explicitly queued |
| running → verification_pending | Worker completion claim or planned verification checkpoint |
| verification_pending → running | Authorized bounded correction with remaining budget |
| verification_pending → verified | Engine evaluates all required current criteria as satisfied |
| verified → accepted | Operator records acceptance of the exact verified manifest |
| any active → needs_decision | A concrete unresolved operator choice is recorded |
| any active → blocked | Dependency unavailable, repeated failure, or budget exhausted |
| active → paused | New dispatch disabled; active effect status retained |
| active → cancel_requested → cancelled | Stop requested, then acknowledged/reconciled for relevant effects |
| terminal/paused → archived | Operator hides project/goal without deleting execution resources |

A materially changed goal has a new version; old accepted history remains immutable. Verified is revocable by invalidation before acceptance. If new contrary evidence appears after acceptance, flag the accepted result as challenged and create a follow-up; do not rewrite the historical acceptance.

### 9.2 Worker state and check state

Worker states include connecting, ready, working, waiting-for-input, turn-finished, stopped, failed, disconnected, and unknown. Turn-finished is not goal-verified. Model tokens stopping is not a reliable turn-finished signal by itself.

Check results include pending, running, passed, failed, error, inconclusive, stale, and expired. Error indicates the verifier failed to execute correctly; failed indicates the expected behavior was observed to be false. Required subjective checks use a recorded human decision.

### 9.3 Bounded continuation algorithm

1. Read the current goal version, receipt state, lease, and latest observations.
2. Reconcile in-flight/ambiguous effects. Do not generate a new attempt while prior delivery is unknown.
3. Evaluate missing/failed criteria and determine whether a correction is actionable within scope.
4. Check permission, retry count, elapsed budget, repeated failure, dependency health, and human control.
5. Persist corrective intent with a unique attempt ID, cause event, and remaining budget.
6. Dispatch once through the adapter; store native run/session references.
7. Observe completion and verify again, or surface an explicit decision/blocker.

Wall-clock budgets use persisted deadlines; closing the app does not reset them. A manual retry requires a new explicit command and records any budget adjustment. Failure equivalence uses stable check/error fingerprints with conservative rules; a model may explain a failure but cannot alone reset the counter.

## 10. Domain model and public contract

### 10.1 Domain entities

| Entity | Required identity and relationships |
| --- | --- |
| Project | ID, display name, repository identity, registered checkouts, policy reference |
| Checkout | ID, project, environment, canonical local path on that environment, branch/worktree, observed revision |
| Goal | ID/version, project, intent, scope, criteria version, budget, state |
| Criterion | ID/version, goal, type, subject, expected result, verifier, required flag |
| Assignment | ID, goal version, bounded scope, worker/session, owned checkout, dependency IDs |
| Run/attempt | ID, assignment, causal event, dispatch key, native run reference, timestamps, state |
| Agent identity | Stable display identity, role, connection reference; separate from model or machine |
| Session | ID, adapter, native session/occupant identity, environment, capabilities |
| Environment | ID, provider, opaque provider identity, capabilities, connection health |
| Surface | ID, session/environment target, presentation type, controller lease |
| Check result | Criterion version, attempt, observer, inputs, outcome, subject fingerprint, artifacts |
| Artifact | ID/digest, media type, byte count, provenance, storage reference, retention state |
| Decision | ID, requested choice, permitted answers, requester, scope, resolved actor/time |
| Handoff | Source references, goal/criteria, current revision, decisions, evidence, open work |

### 10.2 Command envelope

Commands carry schema version, command ID/idempotency key, actor/connection identity, project scope, expected project or goal version where relevant, correlation/causation IDs, command type, typed payload, and optional control-generation precondition. Authentication determines the actor; never trust a caller-supplied author field alone.

Receipts distinguish rejected, recorded, dispatch-pending, delivered, execution-confirmed, completed, failed, and delivery-unknown where relevant. Retrying the same key and same payload returns the existing receipt. Reusing a key with different arguments is rejected.

### 10.3 Event envelope

Events carry event ID, per-project monotonic sequence, schema version, occurrence/recording timestamps, actor, causal command/event, entity IDs, and typed payload. There is no assumed global ordering across machines. External native IDs are adapter-owned references. Persisted schema changes require migration/replay compatibility tests.

### 10.4 Proposed tools

Names below are a design baseline, not a shipped API. M1 freezes the versioned schemas before adapter implementation.

| Family | Actions |
| --- | --- |
| Read | project.list/get, goal.get, session.list/read, evidence.list/get, events.read, receipt.get |
| Plan | goal.propose/update, assignment.propose, handoff.create |
| Execute | run.dispatch, run.interrupt, verification.request |
| Report | worker.report, artifact.register, report.publish |
| Human/policy | goal.authorize, goal.accept, goal.pause/resume/cancel, decision.resolve, surface.take/release |

Only the trusted verifier can publish a verification result as observed proof. A worker's artifact or report is a claim until matched to an authorized observation. Human-only commands remain unavailable to ordinary worker credentials even if their names appear in an imported transcript.

CLI and MCP adapters translate into these commands. They never write the database directly. Support event reading from a cursor plus periodic polling; optional notification delivery is an optimization around the durable source. Expired cursors return an explicit resnapshot requirement.

## 11. System architecture

### 11.1 Selected stack

- Swift 6, strict concurrency; Apple Silicon is the initial release qualification target.
- macOS 26 for the MVP integration profile, aligning with the current CUA Spaces app. Older macOS support is deferred rather than implicitly promised.
- SwiftUI shell with AppKit platform bridges, following familiar Mac navigation and accessibility behavior.
- SwiftPM module graph; XcodeGen added when creating the app/service packaging targets.
- A per-user Swift background service owns DeckEngine, persistence, adapter connections, and the continuation coordinator. The UI is a client. Use launchd service management; qualify the signing/installation approach in M1.
- SQLite behind DeckStore for an append-only event table, materialized projections, receipts, and transactional outbox. Artifacts are content-addressed files outside SQLite. Select a SQLite library through an ADR before adding a production dependency.
- Unix-domain local command transport; remote exposure disabled by default. A host-local connector can forward scoped messages over an explicitly configured SSH channel. Remote RPC design is qualified in M1, not inferred from local MCP availability.

### 11.2 Planned modules

| Module | Owns | Must not own |
| --- | --- | --- |
| DeckDomain | IDs, values, policies, goal/check states | UI or vendor SDKs |
| DeckProtocol | Versioned commands/events/receipts and codecs | External side effects |
| DeckEngine | Authorization, transition decisions, acceptance rules | Provider-specific protocols |
| DeckStore | Event transaction, projections, receipts/outbox, artifact metadata | Product decisions |
| DeckRuntime | Effect execution, reconciliation, continuation scheduling | Alternate authorization paths |
| DeckHerdr | Herdr capability/identity/prompt/event adapter | VM lifecycle or inference routing |
| DeckCUA | CUA connection, capability, viewer/evidence adapter | Worker lifecycle already owned by Herdr |
| DeckConstellation | Health/capabilities, inference/context metadata adapter | Seat scheduler or routing policy |
| DeckVerification | Bounded check execution and evidence capture | Self-approval by workers |
| DeckPlatform | Keychain, launchd, file access, native opening/capture bridges | Goal state mutation |
| DeckUI | Presentation, navigation, rendering, commands | Direct filesystem/provider mutations |
| DeckService/DeckMac/deckctl/deckmcp | Composition roots and entry points | Duplicate domain engines |

Keep interfaces small. These boundaries do not require creating every module as an empty target in M0. Extract a module when its first implementation and contract exist.

### 11.3 Persistence and side effects

Validate a command, decide events, then commit events/projections/receipt/outbox in one transaction. Publish events only after commit. An effect worker performs I/O after intent is durable and reports its result through the command/event boundary.

External systems do not necessarily offer exactly-once execution. For a timeout after prompt delivery, record delivery-unknown, query the pinned native session and correlate known identifiers/output, and require a decision if reconciliation is inconclusive. Never claim that local idempotency makes an arbitrary remote shell command exactly-once.

A dead UI connection does not stop the service. Service restart reconciles Herdr/CUA state and resumes safe queued effects; it does not automatically replay actions that may have happened. A sleeping Mac cannot run its coordinator. Remote workers may continue; the app says supervision is suspended and reconciles on wake. Always-on coordination on another host is deferred.

### 11.4 Adapter contract and capability negotiation

Each adapter implements connect/disconnect, health, capabilities, snapshot, observation, scoped command execution, cancellation where supported, and reconciliation. Advertise per-operation support and limitations, including native resume, interrupt, takeover, structured output, desktop stream, accessibility, background input, and evidence capture. Capability absence must disable the relevant action before execution.

Pin versions for accepted integration runs and store them with evidence. Older/newer endpoints negotiate known capabilities; unknown protocol versions fail with upgrade guidance rather than silently decoding incompatible data.

### 11.5 Constellation boundary

Deck does not reproduce seat selection or provider-specific billing. Compatible inference requests identify project, goal, role, available tools, and supported context metadata. Router decisions are recorded only when the router actually returns them. The initial adapter may use the existing compatible inference API; richer metadata is optional and negotiated.

External bots that cannot use Constellation can still control Deck within their grant; the UI states which inference path is externally managed. Do not promise centralized context enforcement for a harness that does not cooperate. When no summarizer is available, deterministic reports preserve the essential experience.

## 12. Integration decisions and qualification gates

### 12.1 Herdr

Use the installed version's documented CLI/schema/socket as authority. Subscribe before snapshot/reconciliation where required by the upstream contract. Treat event notifications as invalidations and use authoritative reads; do not treat them as Deck's durable journal. Pin the actual agent occupant, not just a reusable pane label. Prefer atomic prompt-and-wait where supported.

M1 must prove session discovery, external control, a real visible TUI, a worker completion signal, interruption, and human takeover for one chosen harness. Screen scraping is a labeled fallback with lower confidence and cannot establish task acceptance.

### 12.2 CUA

Attach a user-provided environment; do not provision cloud infrastructure in the MVP. Use capability discovery before input/capture. Prefer semantic or native browser operations when qualified; use desktop input for workflows that require it. Verification observes the application result rather than assuming successful input delivery means task success.

The open-source Deck repository must not vendor or statically link FSL Spaces, streaming, Keyvault, or app components until a documented license decision permits the intended distribution. User-installed CUA is an optional external dependency; this separation is an engineering choice, not a legal assurance. An MIT SDK does not automatically make every called component MIT. Consult actual component license files at the pinned revision.

M1 must decide whether to use the MIT SDK, generated protocol clients, CLI, or external viewer for each required operation. Teleport/session copying and a Deck-owned credential vault are deferred. Existing CUA permissions and sign-in flows remain in their owning application.

### 12.3 Orchestrator wakeup

Qualify one of: supported callback into a live bot session; a bot-owned scheduled consumer polling Deck's durable feed; or a documented connector process that wakes the bot through its supported API. Record authentication, lost-notification recovery, cancellation, and idle/busy behavior. Human polling is a useful development fallback but does not satisfy ORCH-05.

Use at most one active dispatcher for a goal. Multiple observer bots may read the same project; they do not gain independent write authority. Changing the orchestrator revokes the old dispatch lease and carries unresolved receipts into the new handoff.

### 12.4 Existing projects

Use Cue's human/agent command parity and evidence composition as design references. Crew's command/event/runtime separation is a potential implementation reference. Do not assume either repository is production-complete or licensed for copying; inspect the selected source and license before reuse. This is a new repository and product scope, not an implicit resumption or modification of Crew's backlog.

## 13. Security, authorization, and privacy

### 13.1 Threat and trust boundaries

Protect against accidental wrong-host actions, conflicting controllers, imported prompt instructions, unauthorized local/remote clients, secret leakage through reports, duplicate side effects, and workers claiming false completion. A worker with arbitrary shell access to the same OS user is not isolated from that user's files or processes. Product policy cannot create an OS security boundary; use separate Spaces/users when that isolation is required.

### 13.2 Credentials and access

Store Deck credentials in Keychain; configuration contains references only. Inherit access to external tools through explicit integrations, never by scanning or copying credential files. Local sockets use user-only permissions and per-connection capabilities where applicable. Remote connection requires an explicit authenticated tunnel and scoped identity; no public unauthenticated listener.

Scopes distinguish read, propose, worker dispatch, verification request, surface input, and human/policy actions. Approval is bound to action arguments, goal version, environment, and expiry. A changed target invalidates approval. Recording an approval must not automatically approve a downstream provider's different request.

### 13.3 Evidence and content

Treat terminal output, repositories, web pages, artifacts, and imported conversations as untrusted content. They cannot alter application policy. Render reports as bounded native content or sanitized non-executable Markdown. Avoid shell interpolation of prompts and paths; pass structured arguments or protected input streams.

Normal operational logs contain IDs, event types, timing, adapter error categories, and safe version information. They exclude raw prompts, terminal buffers, screenshots, file contents, secrets, and full sensitive paths. User-requested diagnostics are previewable and redact known secrets before export.

### 13.4 Retention and deletion

Continuous recording is off. Capture evidence for checks or explicit user requests. The proposed artifact retention default is 30 days; before expiry, indicate which accepted results will lose viewable evidence. Preserve metadata/digests and explicit expiry/deletion tombstones, never imply deleted evidence remains verifiable from bytes. The user may pin evidence locally and may explicitly delete a project and its local artifacts after a preview of affected data. Archiving alone never deletes data or remote resources.

No telemetry upload by default. Pilot metrics stay local and are exported deliberately. Public repository fixtures contain synthetic data only. Public repository creation does not authorize publishing private project reports or recordings.

## 14. Nonfunctional requirements

Targets below are acceptance budgets to measure on a documented reference machine, not current performance claims. Use a current Apple Silicon Mac with at least 16 GB memory, one remote host on a stable private network, two active workers, and a 10,000-event project fixture.

| ID | Target | Measurement |
| --- | --- | --- |
| NFR-01 | Warm project navigation p95 below 200 ms | Instrument interaction-to-render over 100 transitions |
| NFR-02 | Local durable command acknowledgement p95 below 250 ms | Exclude external execution; include storage commit |
| NFR-03 | Connected state update visible within 2 s p95 | Adapter observation to UI; polling-only integrations state their interval |
| NFR-04 | Reopen 10,000-event project within 3 s | Materialized snapshot plus lazy history; record hardware/build |
| NFR-05 | Quiescent app/service memory below 300 MB target | Exclude worker harnesses, VMs, external viewers; investigate regressions |
| NFR-06 | UI remains responsive during noisy output | Bound queues; truncate previews with exact artifact access |
| NFR-07 | No acknowledged command lost on service crash | Fault injection around transactional boundaries |
| NFR-08 | No duplicate effect in deterministic retry/reconnect fixtures | Receipt/outbox and adapter reconciliation scenario suite |
| NFR-09 | Complete keyboard path through goal, decision, evidence, takeover | Manual accessibility checklist and automated labels where feasible |
| NFR-10 | Fixture mode works without network or credentials | Offline build/run acceptance scenario |

Default capture limits for implementation planning: 10 MB rendered text/log preview per artifact, 25 MB imported artifact, and 250 MB export bundle. Larger data requires explicit selection or external viewing; limits must be enforced before unbounded allocation. Store a truncation indicator and original size where known. Disk-full conditions reject new durable work, retain existing readable history, and show recovery guidance.

## 15. Validation strategy and release acceptance

### 15.1 Validation layers

1. Domain tests: state transitions, criterion versioning, budgets, permissions, control-generation fences.
2. Persistence tests: atomic receipts/events/outbox, crash boundaries, migrations, replay, corruption/read-only behavior.
3. Adapter contract tests: capabilities, identity pinning, failures, cancellation, reconnect, ambiguous delivery.
4. Native UI verification: navigation, accessibility, visible state, decisions, fixture labels, evidence opening, real takeover.
5. Real integration run: chosen external bot, actual Herdr workers, actual CUA environment, configured router where supported.
6. Pilot comparison: representative real tasks against the existing workflow.

Swift Testing is the default for native unit/contract tests; XCTest/XCUITest where platform UI automation requires it. Do not make synthetic fixtures pass by special-casing the acceptance runner. Fake providers are explicit implementations with the same conformance contract.

### 15.2 Required scenario matrix

| Scenario | Required observation |
| --- | --- |
| S01 — Happy path | Two assignments, verification, report, and explicit acceptance at the recorded revision |
| S02 — Premature done | With continuation explicitly enabled for a reviewed goal contract, worker stops with missing criterion; Deck remains unverified and dispatches bounded correction. The default continuation-off setup instead presents the next action without dispatch. |
| S03 — Build passes, UI fails | Real interaction exposes seeded defect; report says failed and cites evidence |
| S04 — Stale runtime | Running application has previous build; verification cannot pass for the new revision |
| S05 — Disconnect after send | Delivery becomes unknown; reconciliation prevents blind duplicate prompt |
| S06 — UI close/reopen | Worker and service continue; same goal/receipts/evidence restored |
| S07 — Service crash | Durable intent survives; unsafe effects require reconciliation |
| S08 — Human takeover | Old-generation automated write refused; fresh observation required after release |
| S09 — Wrong occupant | Replaced pane cannot receive old command or satisfy its wait |
| S10 — Repeated failure | Two equivalent failures block continuation with a concrete decision |
| S11 — Exhausted budget | No fourth automatic correction and no reset after restart |
| S12 — Unsupported capability | Refusal is visible; no simulated desktop/control success |
| S13 — Host offline | Last observation labeled stale; no automatic local substitution |
| S14 — Conversation handoff | Another session gets relevant source/evidence with provenance; no permission import |
| S15 — Router outage | Evidence/report remain readable; missing inference capability is explicit |
| S16 — Expired or corrupt artifact | Result shows unavailable/corrupt bytes; digest/history not silently rewritten |
| S17 — Unauthorized actor | Project or human-only command refused through UI-equivalent service gate |
| S18 — Public-safe export | Previewed selected data only; synthetic fixture contains no credentials/private paths |
| S19 — Sleep/wake | Supervisor suspension is explicit; remote work reconciled before further dispatch |
| S20 — Criterion edit | Old evidence becomes stale for new criterion version; prior acceptance history preserved |

### 15.3 Release gate

The MVP is accepted only when the pinned build passes native checks, the required scenario matrix is demonstrated, one real external orchestrator closes a correction loop, the operator can view/take over actual work, and all mandatory criterion evidence is recorded. The gate includes signing/install/relaunch of the tested app and compatibility/license records for selected dependencies.

A successful build, passing mocks, a polished demo video, or a worker's clean report does not substitute for real integration acceptance. Independent review is required for authorization, persistence/recovery, external dispatch, and other risky runtime changes. Record exact reviewed commits and unresolved findings.

### 15.4 Pilot metrics

Choose approximately 20 representative tasks, balanced across UI work, bug fixes, multi-file edits, and verification-heavy tasks. Record task difficulty and exclusions before comparison. Compare against the current external-orchestrator/Herdr workflow using paired or reasonably matched tasks; avoid claiming causality from a small uncontrolled sample.

Measure operator interventions, active supervision minutes, time to accepted completion, corrective attempts, false completion claims, missed seeded defects, reconnect recovery, and reported inference usage when actually available. Initial target: at least 50% fewer manual continuation prompts without worse false acceptance or substantially higher total completion time. No missed seeded verification failures in the pilot is required; it is not a universal reliability claim. Publish only synthetic or explicitly reviewed results.

## 16. Delivery plan

| Milestone | Scope | Exit evidence |
| --- | --- | --- |
| M0 — Repository and contract | Public repo, MIT license, PRD, decisions, research, config example, static verification, CI | Clean committed/pushed source; configuration/docs checks pass; no app claim |
| M1 — Integration qualification | Prove bot delivery/wakeup, Herdr APIs/visibility/takeover, CUA capabilities/viewer/license, Swift service packaging | Reproducible real spike receipts; selected versions and integration decisions; fail/narrow report for unsupported paths |
| M2 — Visible native prototype | SwiftPM app/service/domain skeleton, fixture project, four views, decisions, evidence detail, native navigation | Fresh app launches; offline fixture tour works and is labeled; keyboard/VoiceOver baseline |
| M3 — Live project loop | Durable goals/receipts, real Herdr, first external orchestrator, live observation, local/remote identity | One actual bounded assignment survives UI relaunch and produces observable work |
| M4 — Verification and recovery | CUA check, evidence identity, bounded correction, control leases, crash/reconnect handling | S02–S20 relevant real/fixture matrix passes with honest coverage labels |
| M5 — MVP acceptance | End-to-end two-worker scenario, packaging, review, documentation, pilot | Release gate and pilot report; known limitations and rollback guide |

M1 is timeboxed to one to two engineer-weeks. If it fails, produce a narrower revised contract before a large UI investment. M2 can explore fixture UI after the interface contracts are stable, but cannot claim unsupported integration behavior. Planning range: 6–10 engineer-weeks total to personal MVP and 12–20 to a dependable private beta, assuming a working router and reused external runtimes. These estimates will be replaced with measured throughput after M1; they are not deadlines or commitments.

The first visible prototype is M2, explicitly earlier than accepted MVP. Do not wait for every integration to be polished before giving the operator a native interface to inspect, and do not use that visible milestone to skip live acceptance.

## 17. Configuration and distribution

`Config/deck.example.json` is the proposed human-readable configuration shape. M0 validates it as documentation; no runtime consumes it yet. Later the service validates schema version, rejects unknown security-sensitive settings, stores credentials separately, and exposes resolved safe configuration to the app.

Defaults: fixture mode; integrations disabled; external orchestrator; automatic continuation off; three corrective attempts; 60-minute run budget; two repeated failures; continuous recording off; 30-day artifact retention; local Unix transport; remote access off. User setup enables live capabilities explicitly. Configuration references identify Keychain/external connections, never embedded secrets.

Use a per-user Application Support directory for state, cache directories for disposable previews, and standard logs for safe diagnostics. The workspace/repository holds source and intentional fixture data only. No transcripts, captures, agent credentials, actual endpoint inventory, or mutable runtime database belongs in Git.

M0 CI validates documentation/configuration and shell syntax. M2 extends the same verification entry point with native build/tests on a pinned supported macOS runner/toolchain, recording SDK prerequisites. App distribution uses a signed/notarized build when credentials are supplied through the release process; local debug builds clearly identify their revision. Installer changes never kill unrelated Herdr sessions or remove user-owned CUA environments.

Rollback restores a prior app/service build only when its schema compatibility is established. Back up local metadata before migrations; irreversible migrations need an explicit export/restore path. Removing Deck leaves externally owned worker environments and repositories intact unless separately selected for deletion by the operator.

## 18. Open decisions and risk register

| ID | Decision or risk | Default / resolution gate |
| --- | --- | --- |
| D01 | Working product name | Constellation Deck; rename is cosmetic, not a scope reopening |
| D02 | First external bot | Grok Bot preferred; qualify Hermes if supported wakeup cannot be proven in M1 |
| D03 | Herdr live rendering | Exact external attach acceptable initially; choose embedding only after real session/control proof |
| D04 | CUA viewer and license | External user-installed integration initially; audit exact components before linking/distribution |
| D05 | Background service packaging | Per-user Swift launchd service; signing/installation proof in M1 |
| D06 | SQLite wrapper | Select through ADR based on transactions, migrations, Swift concurrency, and license |
| D07 | Remote bot connector | Authenticated scoped SSH/local bridge first; no public service or invented bot API |
| D08 | Crew reuse | Design references initially; source reuse requires current correctness/license review |
| D09 | Upstream churn | Pin accepted versions, capability negotiation, adapter conformance, explicit incompatibility |
| D10 | Correlated verification errors | Use independent observations and deterministic checks; same-model agreement is not proof |
| D11 | Excessive reporting cost | Event-triggered summaries, bounded context, deterministic fallback, actual usage when available |
| D12 | Scope growth | No new hosting, router, editor, team platform, or bot marketplace before M5 |

## 19. Requirement traceability

| Milestone | Primary requirements | Primary scenarios |
| --- | --- | --- |
| M0 | Documentation and proposed defaults only | Static configuration/document checks |
| M1 | ORCH-03/05, ADAPT-01/02/04/06/09, LOOP-06 | Qualified integration spikes; S08/S12/S13 evidence |
| M2 | PROJ-02/03, DATA-07, interface/accessibility, NFR-10 | Explicit fixture versions of S01/S02/S03/S17 |
| M3 | PROJ-01/05, ORCH-01/02/04/06, ADAPT-03/07/08, DATA-01/04 | S01/S05/S06/S09/S17 |
| M4 | Remaining PROJ/ORCH/VERIFY/LOOP/DATA requirements | S02 through S20; documented real vs deterministic coverage |
| M5 | All required functional and nonfunctional gates | Complete matrix, real release scenario, pilot |

Each implementation issue must cite requirement IDs, owned scope, dependencies, proposed validation, and what would falsify completion. Use milestone records for execution status rather than silently changing requirement text to match incomplete code.

## 20. Research basis

Research was reviewed on October 3, 2026. Upstream documentation is evidence of described interfaces, not local proof. Exact release compatibility and licenses remain M1 gates. See `Docs/RESEARCH.md` for sources and limitations, and `Docs/DECISIONS.md` for the initial architecture decisions.

The motivating evidence is the operator's repeated continuation/validation work in an external-orchestrator/Herdr workflow; existing CUA and Herdr capabilities make a focused integration plausible. The product's business viability is not established by this PRD. The MVP is a falsifiable personal-workflow experiment that can grow if its measured results justify expansion.
