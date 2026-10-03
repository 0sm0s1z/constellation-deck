# Constellation Deck

Deck is a native macOS project supervision workspace for human operators and
external orchestrators. It is intended to sit beside Constellation (inference
routing and seat policy), Herdr (terminal process ownership), and CUA (attached
computer capabilities), without taking lifecycle ownership of those workers.

This repository is milestone **M0**: public documentation and configuration
only. There is no application binary, Swift package, local service, or
installer here yet. Do not treat this checkout as a runnable product.

## Status

| Claim | Truth in this tree |
| --- | --- |
| Product specification | [MVP PRD](PRD.md), architecture decisions, and delivery milestones |
| Example configuration | `Config/deck.example.json` (proposed; unused) |
| Repository verification | `./Scripts/verify.sh` |
| macOS app / DeckEngine | Not implemented |
| Herdr or CUA installation | Not included and not implied |
| Live integration | None; example mode is `fixture` |

Fixture data and simulated runs must stay labeled. A passing documentation
check is not application acceptance.

## Documents

- [Product requirements](PRD.md)
- [Architecture decisions](Docs/DECISIONS.md)
- [Research](Docs/RESEARCH.md)
- [MVP program status](programs/mvp/PROGRAM.md)
- [Agent contract](AGENTS.md)
- [Proposed configuration](Config/README.md)
- [Contributing](CONTRIBUTING.md)
- [Security](SECURITY.md)

Numbered PRD requirements and milestone exit criteria are the product
contract. A plan is not implementation evidence.

## Setup

Repository contract checks require **bash**, **git**, and **jq**. No Node,
Python, or application toolchain is needed for M0.

```bash
./Scripts/verify.sh
```

The script confirms required files are present and nonempty, checks the
example configuration shape and defaults, validates its own bash syntax, and
runs `git diff --check`. It does not build, install, or launch Deck.

Copy `Config/deck.example.json` only when a future runtime exists. `null`
fields mean operator setup is required; do not commit local paths, secrets,
or live endpoints. See [Config/README.md](Config/README.md).

## License

Deck-owned files are MIT licensed. See [LICENSE](LICENSE).

CUA is an optional external integration with both MIT and source-available
components. The MIT license on this repository does not relicense CUA,
Herdr, Crew, or other third-party
source, and this bootstrap does not vendor or install them.
