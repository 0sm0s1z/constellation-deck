# Security

## Reporting

Report vulnerabilities through [GitHub's private vulnerability reporting](https://github.com/0sm0s1z/constellation-deck/security/advisories/new).
Do not open a public
issue, pull request, or discussion that includes exploit details, secrets,
or access paths.

## What not to send

Never attach or paste:

- credentials, tokens, cookies, or Keychain exports
- session transcripts, agent memory, or private source
- screenshots that show secrets or private hosts
- live endpoint inventories or internal addresses
- local configuration that replaced `null` setup fields

## Project defaults

- Secrets stay in Keychain or an external credential store. Example
  configuration uses references only (`credentialReference`,
  `connectionReference`) and ships those fields as `null`.
- The proposed service default is a local Unix transport with
  `remoteAccess` set to `false`.
- CUA and Herdr are external. This repository does not install them or
  take ownership of their credentials.

This M0 tree has no running service. Finding a documentation or example
misconfiguration still deserves a private report if it would leak secrets
once a runtime exists.
