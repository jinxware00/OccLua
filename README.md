<div align="center">

# ☾ OccLua

**Lua & Luau Obfuscator built with Rust**

Protect your source. Ship with confidence.

<br>

[![Built with Rust](https://img.shields.io/badge/Built%20with-Rust-111827?style=flat-square&logo=rust&logoColor=white)](#)
[![Lua](https://img.shields.io/badge/Lua-5.1%20%E2%80%93%205.4-2C2D72?style=flat-square&logo=lua&logoColor=white)](#)
[![Luau](https://img.shields.io/badge/Luau-Supported-00A6D6?style=flat-square)](#)
[![License](https://img.shields.io/badge/License-Proprietary-111827?style=flat-square)](LICENSE.md)

</div>

---

<div align="center">

### 🌙

*A native Lua/Luau protection tool designed around speed, simplicity, and control.*

</div>

---

## Overview

**OccLua** is a Lua and Luau obfuscator written entirely in **Rust**.

It provides configurable protection profiles through a fast native core and a developer-focused CLI, making it straightforward to protect scripts without getting buried in configuration.

```text
Source
  │
  ▼
┌─────────────────┐
│     OccLua      │
│                 │
│  Transform      │
│  Compact        │
│  Rename         │
│  Validate       │
└────────┬────────┘
         │
         ▼
Protected Source
```

## Features

- **Rust-powered core** for fast local processing
- **Lua 5.1, 5.2, 5.3 and 5.4**
- **Luau support**
- Multiple protection profiles
- Local identifier renaming
- Whitespace compaction
- Comment removal
- Project-based configuration
- Interactive terminal interface
- Command autocomplete
- Persistent configuration

## Protection Profiles

| Profile | Protection |
|:--|:--|
| `Basic` | Comment removal |
| `Standard` | Whitespace compaction |
| `Strong` | Compaction + local renaming |
| `Max` | Maximum available transformations |

> Profiles will expand as the protection engine develops.

## Quick Start

### Direct CLI

```powershell
occlua script.lua
```

### Interactive mode

```powershell
occlua
```

Then use:

```text
❯ /obfuscate
```

Other useful commands:

```text
/status
/version
/project
/projects
/profile
/config
/activity
/license
/help
```

## Supported Versions

```text
Lua 5.1
Lua 5.2
Lua 5.3
Lua 5.4
Luau
```

Change the target from inside OccLua:

```text
❯ /version
```

## Built with Rust

OccLua is a Rust workspace split between the protection engine and CLI:

```text
OccLua/
├── core/       # Obfuscation engine
├── cli/        # Interactive CLI
├── scripts/    # Build & installation scripts
├── Cargo.toml
└── Cargo.lock
```

The **Rust core is the source of truth** for the transformation pipeline.

## Development

Clone the repository:

```bash
git clone <repository-url>
cd OccLua
```

Build:

```bash
cargo build --release
```

Run:

```bash
cargo run --release
```

Test:

```bash
cargo test
```

## Example

### Input

```lua
local message = "Hello, world!"

print(message)
```

### Output

```lua
local a="Hello, world!"print(a)
```

Output varies depending on the selected protection profile and target version.

## Project Status

OccLua is actively developed.

### Available

- [x] Rust workspace
- [x] Native protection core
- [x] Interactive CLI
- [x] Project management
- [x] Configuration
- [x] Protection profiles
- [x] Lua version selection
- [x] Interactive autocomplete
- [x] Licence interface

### Planned

- [ ] Expanded transformation pipeline
- [ ] Expanded Luau support
- [ ] Commercial licence infrastructure
- [ ] Additional protection profiles

## Licensing

OccLua is **proprietary commercial software**.

The repository may be publicly visible, but the source is not released under an open-source licence. Copying, redistribution, resale, modification, reverse engineering and derivative use are restricted by the terms of [`LICENSE.md`](LICENSE.md).

---

<div align="center">

**☾ OccLua**

*Protect your Lua. Keep your code yours.*

Built with Rust.

</div>
