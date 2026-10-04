<div align="center">

# ☾ OccLua

### Lua & Luau Obfuscator

Protect your source. Ship with confidence.

<br>

[![Built with Rust](https://img.shields.io/badge/Built%20with-Rust-111827?style=flat-square&logo=rust&logoColor=white)](#)
[![Lua](https://img.shields.io/badge/Lua-5.1%20%E2%80%93%205.4-2C2D72?style=flat-square&logo=lua&logoColor=white)](#)
[![Luau](https://img.shields.io/badge/Luau-Supported-00A6D6?style=flat-square)](#)
[![License](https://img.shields.io/badge/License-Proprietary-111827?style=flat-square)](LICENSE.md)

<br>

<img src="docs/assets/occlua-demo.gif" alt="OccLua" width="850">

</div>

---

## ☾ OccLua

OccLua is a native Lua and Luau obfuscator built in Rust.

It transforms source code into a harder-to-read and harder-to-analyse form while keeping the workflow simple for developers.

Choose the protection tier that fits your project, configure your target, and obfuscate from one place.

---

## Protection Tiers

OccLua has three tiers, ranging from a useful fully offline free tier to backend-native enterprise protection.

| Feature | **Basic · Free** | **Standard · Pro** | **Enterprise** |
|:--|:--:|:--:|:--:|
| Deployment | Offline / static | Offline / static | Backend-dependent |
| VM virtualization | Lowest-strength | Full strength + randomized opcodes | Full strength + server-split |
| Control-flow obfuscation | — | ✓ | ✓ |
| Anti-tamper | — | ✓ | ✓ |
| Runtime backend gating | — | Partial | Full |
| Watermarking / leak tracing | — | — | ✓ |
| License enforcement | Build-time | Build-time | Build-time + runtime |

### Basic · Free

A genuinely useful offline tier for developers who want straightforward source protection without a paid subscription.

- Identifier renaming and layout/comment stripping
- Global access indirection
- String encryption and constant pooling
- Lowest-strength VM virtualization
- No backend dependency
- No control-flow obfuscation or anti-tamper
- Free key with a usage limit and cooldown

### Standard · Pro

A stronger offline protection tier with advanced transformations while remaining capable of standalone deployment.

- Everything in Basic
- Full-strength VM virtualization
- Per-build randomized opcode encoding
- Control-flow flattening
- Opaque predicates and bogus branches
- Call indirection
- Anti-tamper protections
- Debug-hook detection
- String re-encryption after use
- Build-time license validation
- Limited runtime backend gating

### Enterprise

The highest protection tier for software that needs backend-native protection and operational controls.

- Everything in Standard
- Full runtime fragment delivery
- Server-side sensitive function storage
- Incremental runtime delivery
- Session-bound execution
- Hardware/build fingerprint binding
- Non-replayable runtime fragments
- Per-build watermarking and leak tracing
- License revocation
- Runtime license enforcement
- Priority support
- White-label options

> Enterprise protection depends on the OccLua backend being available.

---

## Supported Targets

| Target | Status |
|:--|:--:|
| Lua 5.1 | Supported |
| Lua 5.2 | Supported |
| Lua 5.3 | Supported |
| Lua 5.4 | Supported |
| Luau | Supported |

---

## Built for Developers

- Native Rust implementation
- Lua and Luau targeting
- Configurable protection tiers
- Project-based configuration
- Persistent settings
- Interactive terminal interface
- Command autocomplete
- Offline-capable protection
- Backend-assisted protection on supported tiers

---

## Installation

### Windows

```powershell
irm https://occlua.dev/install.ps1 | iex
```

Then:

```powershell
occlua
```

The installer downloads the appropriate prebuilt OccLua binary. Rust and Cargo are not required.

---

## Accounts & Licensing

OccLua uses license keys to connect your installation to the protection tier available to your account.

### Free

The Basic tier is available with a free key and a rolling usage limit. Once the limit is reached, the account enters a cooldown before more protected builds can be made.

### Pro & Enterprise

Paid subscriptions are managed through the OccLua website. After purchasing a subscription, your license key is issued to your account and can be loaded into the OccLua CLI.

Keys can be stored through the CLI for normal use or supplied through an environment variable for automated workflows.

```text
occlua auth login <key>
```

For CI environments:

```text
OCCLUA_LICENSE_KEY
```

License validation is designed so the CLI can reject invalid keys locally before making unnecessary backend requests. Usage limits, subscription status, revocation and runtime-gated features are handled by the OccLua service where required.

---

## Configuration

OccLua keeps project configuration alongside your workflow, allowing settings such as the target version and protection tier to be configured without repeatedly entering them.

```text
project
 ├── target
 ├── tier
 └── configuration
```

---

## Licensing

OccLua is **proprietary commercial software**.

The repository may be publicly visible, but OccLua is not open-source software. Use, copying, redistribution, modification, reverse engineering, resale and derivative use are governed by [`LICENSE.md`](LICENSE.md).

---

<div align="center">

**☾ OccLua**

*Protect your Lua. Keep your code yours.*

</div>
