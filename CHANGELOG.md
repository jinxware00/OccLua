# Changelog

## 0.1.0

First public release.

### Added

- Five targets: Lua 5.1, 5.2, 5.3, 5.4 and Luau.
- Three tiers: **Basic · Free** (offline, no account), **Standard · Pro** and
  **Enterprise**.
- Transforms: regenerate source, strip comments, rename locals and globals,
  encrypt string literals, split encrypted strings, and scramble and pool
  numeric literals.
- Four presets (`basic`, `standard`, `strong`, `maximum`) and a TOML config
  surface covering every setting, with `occlua configs` to inspect and edit it.
- Control-flow flattening behind a dispatcher, with opaque predicates. Off by
  default; the `strong` and `maximum` presets enable it, or set it directly
  under `[controlflow]`.
- Accounts: register with an email, receive a free key, and sign in from the
  CLI.
- Licence redemption and top-up: redeem a purchased key to fold its tier and
  remaining time into the account's key, or buy a top-up or a gift for someone
  else.
- Reproducible builds: the same input, target, profile and `--seed` produce a
  byte-identical output.
- A one-line Windows installer, with SHA-256 verification against the release
  manifest.
- An interactive terminal for the same operations as the flags.
