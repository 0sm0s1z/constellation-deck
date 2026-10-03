# Research basis and integration unknowns

Reviewed October 3, 2026. This record summarizes documentation/source inspection preceding the MVP. It is not a benchmark or a completed integration test. Mutable upstream links must be pinned to qualified releases/commits during M1.

## Sources

| Source | Observed capability or constraint | How Deck uses it |
| --- | --- | --- |
| [CUA repository](https://github.com/trycua/cua) | Spaces, Driver, SDKs, Lume, and specialist decision models | Separate computer infrastructure from project supervision |
| [CUA agent API](https://github.com/trycua/cua/blob/main/docs/content/docs/cua-sdk/reference/spaces/agents.mdx) | Agent start/status/events/message/interrupt/stop | Potential alternate worker adapter; do not duplicate Herdr ownership |
| [CUA persistent agents](https://github.com/trycua/cua/blob/main/docs/content/docs/spaces/guides/persistent-agents.mdx) | Named memory homes, daemon routines, notifications, per-agent computer grants | Understand existing overlap; memory portability is not native conversation migration |
| [Cua Bots example](https://github.com/trycua/cua/blob/main/docs/content/docs/spaces/examples/cua-bots.mdx) | Native bot/computer/report experience; disclosed sample limits | Avoid recreating a generic bot desktop; distinguish sample behavior from daemon capabilities |
| [CUA Swift SDK](https://github.com/trycua/cua/blob/main/libs/cua/swift/README.md) | Swift bindings over a Rust SDK | Candidate native adapter; packaging/license verification remains required |
| [CUA spacesd](https://github.com/trycua/cua/blob/main/libs/cua-spacesd/README.md) | Process/files/desktop/stream capabilities and authenticated access | Use capability discovery and supported connection paths |
| [CUA platform support](https://cua.ai/docs/cua-driver/concepts/platform-support) | Background input/browser/native behavior differs by platform/toolkit | Qualify actual OS/application combinations rather than a generic computer-use claim |
| [CUA license map](https://github.com/trycua/cua/blob/main/LICENSING.md) | MIT and FSL component boundaries | Audit concrete dependencies before redistribution |
| [Spaces license text](https://github.com/trycua/cua/blob/main/apps/cua-spaces-macos/LICENSE) | FSL permitted purposes and competing commercial product/service restriction | Personal use and open-source distribution decisions are distinct |
| [CUA commercial guidance](https://github.com/trycua/cua/blob/main/COMMERCIAL.md) | Hosted/managed offerings require commercial licensing | Hosting is outside Deck MVP |
| [CUA-S1 model card](https://github.com/trycua/cua/blob/main/libs/cua-s1/MODEL_CARD.md) | Closed-candidate research models; checkpoint-specific evidence and limitations | Defer local decision models and do not use them as acceptance authorities |
| [Herdr site](https://herdr.dev/) | Persistent coding terminals and connected machines | Preserve the operator's existing visible worker workflow |
| [Herdr API](https://herdr.dev/docs/api/) | Agent prompt/wait, occupant pinning, snapshots, events and reconciliation | Build an adapter instead of simulating a TUI or scraping every frame |
| [T3 Code](https://github.com/pingdotgg/t3code) | Harness control surface across clients/environments | Multi-machine UI alone is not differentiation |
| [T3 architecture](https://github.com/pingdotgg/t3code/blob/main/docs/internals/overview.md) | Durable events, receipts/outbox, adapter boundaries, separate finalization | Reference for recovery semantics; no source copied |
| [T3 remote access](https://github.com/pingdotgg/t3code/blob/main/docs/user/remote-access.md) | Multiple environments and placement of new threads | Distinguish host selection from active conversation migration |
| [T3 provider constraints](https://github.com/pingdotgg/t3code/blob/main/docs/internals/providers.md) | Provider-specific credentials, sessions, approvals, and capabilities | A model router does not eliminate harness differences |
| [MaxQ Grok Bot/Herdr article](https://maxq.cxn.sh/#shareables/articles/grokbot-herdr-dev-loop) | Prompt → pane → signal → continuation workflow; prototype copy | Motivation and operating hypothesis, not measured reliability evidence |

## Important distinctions

- CUA supplies both infrastructure and some agent lifecycle features; it does not establish that a development goal meets its criteria.
- Cua Bots' published screenshots use scripted model replies, and its sample rules are prompt instructions. These are disclosed limitations of that sample, not a blanket claim about all CUA enforcement.
- CUA persistent-agent memory movement excludes categories such as sessions and credentials. Deck handoffs preserve portable intent/evidence without promising native session equivalence.
- Herdr events invalidate observations and require reconciliation. Deck owns its own durable domain history.
- CUA-S1 includes newer 4B checkpoints with broader measured behavior than the original forms profile, but remains a bounded research capability with explicit limits. None is a substitute for project acceptance.
- Some CUA high-level license descriptions differ, including media components. Resolve this from each selected component's actual license at the qualified revision.

## Local project assessment

Cue and Crew were inspected as design references. Cue establishes useful patterns for human/agent command parity and evidence composition. Crew defines command/event boundaries, separate computer/agent abstractions, and Constellation integration. Selected multiplexer code also contained placeholder behavior, so design similarity does not prove reusable production implementation. No source from either repository was copied into Deck during M0. Do not publish private local paths, credentials, or operational inventories in future research notes.

## Questions M1 must answer with actual runs

1. What supported mechanism can wake the chosen external orchestrator after a worker event, and how does it recover a missed notification?
2. Which Herdr/harness versions support stable occupant identity, interruption, exact live attach, and a provable human control barrier?
3. Which CUA operation/viewer path is compatible with the chosen environment and Deck's distribution goals?
4. Can a verifier distinguish the requested revision from a stale running application reliably?
5. Can the service recover an interrupted dispatch without sending the task twice?
6. Which Constellation metadata fields are actually available, and which must remain unknown?
7. What app/service signing and startup behavior is reproducible on a clean supported Mac?

Record the command/API shape, software versions, observed outcome, evidence references, and limitations for each answer. Avoid publishing real secrets or private endpoint details. A failed spike should change the adapter scope explicitly rather than become an undocumented fallback.
