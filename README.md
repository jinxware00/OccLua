<div align="center">

# ☾ OccLua

**Lua Obfuscator**

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

*A native Lua/Luau protection tool.*

</div>

---

## Overview

**OccLua** is a Lua and Luau obfuscator written in Rust.

### What it does

| Profile | What happens |
|:--|:--|
| `Basic` | Removes comments |
| `Standard` | Compacts whitespace |
| `Strong` | Compacts code and renames locals |
| `Max` | Uses the strongest available transformations |

## Features

- **Lua 5.1, 5.2, 5.3 and 5.4 and Luau support**
- Multiple protection configuration
- Local identifier renaming
- Whitespace compaction
- Comment removal
- Project-based configuration
- Interactive terminal interface
- Command autocomplete
- Persistent configuration

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

**Input**

```lua
local message = "Hello, world!"

print(message)
```

**Protected**

```lua
local a="Hello, world!"print(a)
```

The result depends on the selected profile and target version.

## Project Status

OccLua is actively developed.

### Available

- [x] Native protection core
- [x] Interactive CLI
- [x] Project management
- [x] Configuration
- [x] Protection profiles
- [x] Lua version selection
- [x] Interactive autocomplete
- [x] License interface

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

</div>
