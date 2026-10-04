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

## OccLua

OccLua is a native Lua and Luau obfuscator built in Rust.

Designed for developers who want to distribute Lua code without handing
out clean, readable source.

Configure a subscription, choose the protection available to your plan,
and keep the workflow inside OccLua.

---

## Subscriptions

OccLua uses subscription tiers to determine the protection and features
available to you.

| Subscription | Protection |
|:--|:--|
| **Basic** | Comment removal |
| **Standard** | Comment removal + whitespace compaction |
| **Strong** | Standard + local identifier renaming |
| **Max** | Maximum available transformations |

Subscription features may change as OccLua develops.

---

## Supported Targets

| Target | Status |
|:--|:--|
| Lua 5.1 | Supported |
| Lua 5.2 | Supported |
| Lua 5.3 | Supported |
| Lua 5.4 | Supported |
| Luau | Supported |

---

## Built for Developers

- Native Rust implementation
- Interactive terminal interface
- Project-based configuration
- Persistent settings
- Subscription-based protection
- Local identifier renaming
- Comment removal
- Whitespace compaction
- Command autocomplete
- Lua/Luau version targeting

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

> The installer downloads the appropriate prebuilt OccLua binary. Rust
> and Cargo are not required.

---

## Why OccLua?

OccLua is built around a simple idea:

**Give developers control over how their Lua is protected.**

Choose the subscription that fits your needs, configure your project, and
keep the entire workflow inside a native terminal application.

---

## Configuration

OccLua supports project-level configuration, allowing settings and target
versions to stay with the project rather than being repeatedly configured
by hand.

```text
project
 ├── target version
 ├── subscription
 └── configuration
```

---

## Roadmap

- [x] Native Rust protection core
- [x] Lua 5.1–5.4 support
- [x] Luau support
- [x] Interactive terminal UI
- [x] Subscription-aware protection
- [x] Project configuration
- [x] Persistent configuration
- [x] Autocomplete
- [ ] Expanded transformation pipeline
- [ ] Expanded Luau support
- [ ] Additional protection tiers
- [ ] Commercial licensing infrastructure

---

## Licensing

OccLua is **proprietary commercial software**.

The repository may be publicly visible, but OccLua is not open-source
software. Use, copying, redistribution, modification, reverse engineering,
resale and derivative use are governed by [`LICENSE.md`](LICENSE.md).

---

<div align="center">

### ☾

**OccLua**

*Protect your Lua. Keep your code yours.*

</div>
