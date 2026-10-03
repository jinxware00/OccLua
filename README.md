<div align="center">

# ☾ OccLua

### Lua & Luau Obfuscation · Rust · Source Protection

**Protect your Lua. Keep your code yours.**

[![Rust](https://img.shields.io/badge/Built%20with-Rust-000000?style=for-the-badge&logo=rust&logoColor=white)](https://www.rust-lang.org/)
[![Version](https://img.shields.io/badge/version-0.1.0-67e8f9?style=for-the-badge)](#)
[![License](https://img.shields.io/badge/license-Proprietary-111827?style=for-the-badge)](LICENSE.md)

</div>

---

<div align="center">

```text
                         .        *          .
             *                       .                 *
                        .-""""-.
                    .  /        \  .
                      |   ◐  ◑   |
                 *    \        /          .
                       '-.__.-'
            .       *      |       *          .
                       ☾   |   ✦
                  .       / \       .
                       OCCLUA
</div>
What is OccLua?

OccLua is a modern Lua and Luau obfuscator written entirely in Rust.

It transforms Lua source code into a harder-to-analyse form while keeping the workflow simple for developers. OccLua is designed around configurable protection levels, a fast native core, and a developer-focused CLI.

Your source goes in. Your protected source comes out.

Built around
🌙 Lua & Luau support
🦀 Native Rust implementation
🔐 Configurable obfuscation profiles
⚡ Fast local processing
🖥️ Interactive terminal interface
📁 Project-based configuration
🛡️ Source-code protection
✦ Protection Profiles

OccLua provides different levels of transformation depending on how much protection you need.

Profile	Transformations
Basic	Comment removal / regeneration
Standard	Whitespace and formatting compaction
Strong	Compaction + local identifier renaming
Max	Maximum available transformation pipeline

Profiles are designed to make it easy to choose a protection level without manually configuring every transformation.

☾ Supported Versions

OccLua is built to work across multiple Lua environments.

Lua 5.1
Lua 5.2
Lua 5.3
Lua 5.4
Luau

Select your target directly from the CLI:

❯ /version
⚡ Quick Start
Install

Download the latest OccLua release and run the installer.

Once installed:

occlua

Or process a file directly:

occlua script.lua

Check the installed version:

occlua --version
🖥️ Interactive CLI

OccLua includes an interactive terminal environment for managing projects, profiles and protection settings.

❯ /help

/status       show current session and workspace details
/obfuscate    run the protection pipeline
/version      change the Lua/Luau version
/project      manage projects
/profile      manage obfuscation profiles
/config       view or change configuration
/activity     view activity
/license      show licence status
/clear        clear the terminal
/exit         exit OccLua

Autocomplete is built directly into the terminal, with keyboard navigation for available commands.

Use:

↑ / ↓ to navigate suggestions
Enter to select a command
Tab to complete a command
Esc to close the completion menu
🔒 Protection Pipeline

OccLua processes source through its native Rust core rather than relying on a collection of shell scripts.

        Lua / Luau source
                │
                ▼
        ┌───────────────┐
        │    Parsing    │
        └───────┬───────┘
                │
                ▼
        ┌───────────────┐
        │ Transformation│
        └───────┬───────┘
                │
                ▼
        ┌───────────────┐
        │   Validation  │
        └───────┬───────┘
                │
                ▼
        Protected source

The generated output is reparsed by the core to help ensure that transformations produce valid source.

🦀 Built with Rust

OccLua's core and CLI are written in Rust.

The project is structured as a Rust workspace:

OccLua/
├── core/
│   └── Obfuscation engine
│
├── cli/
│   └── Interactive CLI
│
├── scripts/
│   └── Build & installation tools
│
├── Cargo.toml
└── README.md

The Rust core is the source of truth for OccLua's transformation pipeline.

🌙 Why OccLua?

OccLua is built around a simple idea:

Protection should not make development painful.

Instead of a complicated interface, OccLua focuses on:

A fast native implementation
Straightforward profiles
Local processing
Persistent projects
Clean terminal UX
Lua and Luau compatibility

No unnecessary dashboard.

No bloated interface.

Just your source, the protection pipeline, and the result.

Example
Input
local message = "Hello, world!"

print(message)
Protected output
local a="Hello, world!"print(a)

The exact output depends on the selected profile and target version.

📁 Projects

OccLua supports persistent projects for keeping configuration and workflows organised.

Projects can be created, opened, listed and closed directly from the CLI.

❯ /project

Project configuration allows settings to be maintained independently rather than repeatedly specifying them for every run.

⚙️ Configuration

Global and project-specific configuration can be managed from inside OccLua.

❯ /config

This allows settings such as the target Lua version and protection profile to be managed without modifying source code.

📊 Activity

OccLua includes a contribution-style activity view for tracking usage and project activity.

❯ /activity

The activity view is designed to give the CLI a quick overview of recent OccLua usage without turning the application into a dashboard.

🔑 Licensing

OccLua uses a proprietary commercial licensing model.

A valid licence may be required to access commercial releases or protected functionality.

Licence status can be viewed directly from the CLI:

❯ /license

For the complete terms governing use, redistribution, modification, reverse engineering and commercial use, see LICENSE.md.

🔐 Source Protection

OccLua is intended for developers who want to make their Lua or Luau source more difficult to inspect and analyse.

Obfuscation can help protect implementation details when distributing scripts, but no obfuscator can guarantee that source code will be impossible to recover or analyse.

OccLua focuses on increasing the effort required to understand protected code while keeping the developer workflow straightforward.

🛠️ Development

Clone the repository:

git clone <repository-url>
cd OccLua

Build the workspace:

cargo build --release

Run OccLua:

cargo run --release

Run the test suite:

cargo test
🧱 Project Structure
OccLua/
│
├── core/
│   ├── Cargo.toml
│   └── src/
│       └── ...
│
├── cli/
│   ├── Cargo.toml
│   └── src/
│       └── ...
│
├── scripts/
│   └── installer.ps1
│
├── Cargo.toml
├── Cargo.lock
├── LICENSE.md
├── README.md
└── .gitignore
🚧 Current Status

OccLua is currently under active development.

The project is evolving toward a more complete Lua/Luau protection pipeline while the CLI, project system, licensing system and transformation engine continue to develop.

Current functionality includes:

 Rust workspace
 Native obfuscation core
 Interactive CLI
 Project management
 Configuration system
 Protection profiles
 Lua version selection
 Interactive autocomplete
 Licence interface
 Commercial licence backend
 Additional transformations
 Expanded Luau support
📜 Licence

OccLua is proprietary software.

The source repository may be publicly visible, but the source code is not licensed for unrestricted copying, redistribution, modification, resale, or creation of derivative products.

Commercial use requires a valid OccLua licence where applicable.

See LICENSE.md for the complete licence terms.

<div align="center">
☾ Protect under the same moon.

OccLua · Built with Rust

Lua · Luau · Rust · Protection

</div> ```
