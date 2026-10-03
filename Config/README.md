# Proposed Deck configuration

`deck.example.json` is a **proposed** operator configuration. No runtime in
this repository reads it. Copying it does not enable Constellation, Herdr,
CUA, or a Deck service.

`null` leaves a value unresolved. `dataDirectory` will use the operating
system's per-user Application Support location by default; integration
connection fields require operator setup before their capability is enabled. Do not replace
example `null`s with personal paths, live URLs, or secrets in a committed
file. Secrets are references only: a Keychain or external-store name, never
the secret material.

Local overrides belong in gitignored files such as `Config/deck.json` or
`Config/deck.local.json`.

## Top level

| Field | Example | Meaning |
| --- | --- | --- |
| `schemaVersion` | `deck.config/v1` | Document schema identifier. |
| `mode` | `fixture` | Example data is fixture-labeled, not a live integration. |
| `dataDirectory` | `null` | Use the future runtime's per-user Application Support default. |

## `constellation`

Constellation owns inference routing and seat policy. Deck does not become a
second model router.

| Field | Example | Meaning |
| --- | --- | --- |
| `enabled` | `false` | Integration off until configured. |
| `baseURL` | `null` | Operator-supplied base URL; not shipped. |
| `credentialReference` | `null` | Reference to a credential store entry, not a token. |
| `modelPolicy` | `router-default` | Follow Constellation's default routing policy. |

## `herdr`

Herdr owns terminal processes. Deck must not take lifecycle ownership of the
same worker.

| Field | Example | Meaning |
| --- | --- | --- |
| `enabled` | `false` | Herdr attachment off. |
| `socketPath` | `null` | Operator-local control socket; not shipped. |

## `cua`

CUA owns attached computer capabilities and remains an optional external
integration with both MIT and source-available components. The Deck MIT license does not relicense CUA.

| Field | Example | Meaning |
| --- | --- | --- |
| `enabled` | `false` | CUA attachment off. |
| `connectionReference` | `null` | Reference to a stored connection, not a secret. |

## `orchestration`

MVP orchestration is external. Automatic continuation starts off. The operator
can enable bounded continuation for a reviewed goal contract; an external
orchestrator cannot bypass that authorization by issuing a fresh command.

| Field | Example | Meaning |
| --- | --- | --- |
| `mode` | `external` | External orchestrators, not an in-process autopilot. |
| `automaticContinuation` | `false` | Operator must authorize a goal's bounded continuation policy before automatic corrections. |
| `maxCorrectiveAttempts` | `3` | Cap on corrective loops once a runtime exists. |
| `maxRunMinutes` | `60` | Wall-clock cap for an execution cycle including corrective attempts; correction does not reset it. |
| `repeatedFailureLimit` | `2` | Stop after this many repeated failures. |

## `capture`

| Field | Example | Meaning |
| --- | --- | --- |
| `continuousRecording` | `false` | No always-on capture by default. |
| `artifactRetentionDays` | `30` | Proposed retention once artifacts exist. |

Do not commit recordings, transcripts, or screenshots.

## `service`

| Field | Example | Meaning |
| --- | --- | --- |
| `transport` | `unix` | Proposed local Unix-domain transport. |
| `remoteAccess` | `false` | Remote listeners stay off. |
