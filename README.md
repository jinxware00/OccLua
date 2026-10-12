<div align="center">

# ☾ OccLua

### Lua & Luau obfuscator

Protect your source. Keep your code yours.

<br>

[![Built with Rust](https://img.shields.io/badge/Built%20with-Rust-111827?style=flat-square&logo=rust&logoColor=white)](#)
[![Lua](https://img.shields.io/badge/Lua-5.1%20%E2%80%93%205.4-2C2D72?style=flat-square&logo=lua&logoColor=white)](#)
[![Luau](https://img.shields.io/badge/Luau-Supported-00A6D6?style=flat-square)](#)
[![License](https://img.shields.io/badge/License-Proprietary-111827?style=flat-square)](LICENSE.md)

</div>

---

OccLua is a native Lua and Luau obfuscator written in Rust. It rewrites source
into a form that is harder to read and analyse while keeping the program's
behaviour. It ships as a command-line tool with an interactive terminal, and it
targets five dialects: Lua 5.1 through 5.4, and Luau.

This repository is the **distribution home** for OccLua. It holds release
binaries, the installer, and this documentation. The source code is not
published here.

---

## Install

Windows (PowerShell):

```powershell
irm https://occlua.vercel.app/install.ps1 | iex
```

Then:

```powershell
occlua
```

The installer detects your architecture, downloads the matching binary,
verifies its SHA-256 against `releases.json`, installs it to
`%USERPROFILE%\.occlua\bin`, and adds that directory to your user `PATH`. Rust
and Cargo are not required. Binaries are **not** code signed.

### Manual install

Grab the assets from the [latest release](https://github.com/jinxware00/OccLua/releases/latest):

| Asset | What it is |
|:--|:--|
| `occlua-<version>-windows-x86_64.exe` | The CLI by itself |
| `occlua-<version>-windows-x86_64.zip` | The CLI plus the install scripts |
| `releases.json` | Manifest: `url` and `sha256` per platform |
| `SHA256SUMS` | Checksums for every asset |

Verify a download before running it:

```powershell
Get-FileHash .\occlua-0.1.0-windows-x86_64.exe -Algorithm SHA256
```

The hash must match the `sha256` field for that asset in `releases.json`.

---

## Quickstart

```powershell
occlua script.lua                 # writes script.obf.lua beside the input
occlua script.lua -o out.lua      # choose the output path
occlua script.lua -p basic --seed 7 --verbose
occlua - < script.lua > out.lua   # read stdin, write stdout
occlua                            # open the interactive terminal
```

A protected file starts with a provenance comment:

```lua
-- This file was protected using OccLua v0.1.0
```

Pass `--no-banner` to omit it.

---

## Protection tiers

OccLua has three tiers. `Basic · Free` is genuinely useful and runs with no
account. `Standard · Pro` and `Enterprise` need a key.

| Transforms | Basic · Free | Standard · Pro | Enterprise |
|:--|:--:|:--:|:--:|
| Regenerate source, strip comments, compact whitespace | Yes | Yes | Yes |
| Rename local identifiers | Yes | Yes | Yes |
| Encrypt string literals | Yes | Yes | Yes |
| Scramble and pool numeric literals | Yes | Yes | Yes |
| Split encrypted strings into fragments | — | Yes | Yes |
| Rename global identifiers | — | — | Yes |
| Runs on your machine, offline | Yes | No | No |
| Needs a license key | No | Yes | Yes |

**Basic · Free** — regenerate source, remove comments, compact whitespace,
rename locals, encrypt strings and numbers. Runs entirely offline.

**Standard · Pro** — everything in Basic, plus split encrypted strings. Builds
are processed by the OccLua service, which verifies the license server-side.

**Enterprise** — everything in Standard, plus rename globals. Also processed by
the OccLua service.

Legacy tier names still resolve: `free`/`low` → Basic, `pro`/`medium`/`strong`/
`high` → Standard, `max`/`maximum` → Enterprise.

### Tiers vs. presets

A **tier** is what your license unlocks. A **preset** is how hard the transforms
push. They are separate, and a preset never grants a tier your key does not
already cover.

| Preset | Intent |
|:--|:--|
| `basic` | fast, low overhead |
| `standard` | balanced size and protection |
| `strong` | more aggressive transforms |
| `maximum` | most protection, most overhead |

```powershell
occlua script.lua --level strong     # push a licensed tier harder
```

---

## Supported targets

| Target | Flag | Aliases |
|:--|:--|:--|
| Lua 5.1 | `lua51` | `5.1`, `lua5.1` |
| Lua 5.2 | `lua52` | `5.2`, `lua5.2` |
| Lua 5.3 | `lua53` | `5.3`, `lua5.3` |
| Lua 5.4 | `lua54` | `5.4`, `lua5.4`, `lua` |
| Luau | `luau` | — |

Every generated dialect is re-parsed and checked. Behavioural equivalence is
tested by running a case under a real interpreter, protecting it, running the
result under the same interpreter, and comparing stdout and exit status. This
runs against Lua 5.4 and (via LuaJIT) Lua 5.1 wherever those interpreters are
present.

---

## Command reference

```
occlua                       Open the interactive terminal
occlua <input> [options]     Obfuscate a file using global defaults
occlua obfuscate [input]     Use the active project's paths and settings
occlua project create <name> [directory]
occlua project list
occlua project open <name>
occlua project close
occlua config [global|project] [show|path|set <key> <value>|reset <key>]
occlua configs [...]         Individual protection settings
occlua check <file>          Analyse a script without obfuscating it
occlua info                  Version, platform, dialects, directories
occlua init                  Write a starter occlua.toml
occlua profile [name]
occlua auth register <email>
occlua auth login <email>
occlua auth redeem <key>
occlua auth status
occlua auth logout
```

### Obfuscate options

| Option | Meaning |
|:--|:--|
| `-o, --output <file>` | Output file; `-` writes Lua to stdout |
| `-p, --profile <tier>` | `basic` \| `standard` \| `enterprise` |
| `--level <preset>` | `basic` \| `standard` \| `strong` \| `maximum` |
| `--target <version>` | `lua51` \| `lua52` \| `lua53` \| `lua54` \| `luau` |
| `-d` | Short for `--target` |
| `-s, --seed <n>` | Reproducible non-negative integer seed |
| `--config <file>` | Read settings from this TOML file |
| `--debug` | Keep development detail in the output |
| `--license-key <key>` | License key for this run only |
| `--force` | Replace an existing output file |
| `--verbose` | Report passes, sizes and timing |
| `--quiet` | Print nothing but the output |
| `--no-banner` / `--banner` | Omit / force the provenance comment |
| `-h, --help` / `-V, --version` | Help / version |

Without `-o`, a file input produces `<name>.obf.lua` beside it. Use `-` as the
input to read Lua from stdin. Progress and errors go to **stderr**, so
`-o -` gives you clean Lua on stdout. Use `--` before an input whose name starts
with `-` or matches a command name.

---

## Configuration

Settings resolve in this order: **flags → `--config` file → project overrides →
global defaults**.

```powershell
occlua init                      # write a starter occlua.toml
occlua configs                   # list every setting and its value
occlua configs keys              # every key with the values it accepts
occlua configs strings           # one section
occlua configs set strings.split on
occlua configs preset strong
occlua configs save my-build
occlua configs load my-build
```

`configs` writes an `occlua.toml` in the current directory, kept separate from
the global config so license material is never mixed into a project file. An
`occlua.toml` that exists but does not parse fails the build, naming the setting
at fault. Project settings live under `occlua project`; show them with
`occlua config project path`.

---

## Licensing

Basic is free and always works, with no account and no network access.

Standard and Enterprise are licensed. Every account gets a free key the moment
it is created; register or sign in, then redeem the key from your purchase email
to merge its tier and remaining time into that key. The source key is spent once
it lands, so it can be handed to exactly one account.

```powershell
occlua auth register <email>
occlua auth login <email>
occlua auth redeem <key>
occlua auth status
```

A purchase is made as a **top-up** (add time to your own key; the tier rises to
the stronger of the two and any time left carries over) or a **gift** (a fresh
key you hand to someone else).

The licensing server is the source of truth. When a key is needed the CLI
consults, in order:

1. `--license-key <key>`
2. the `OCCLUA_LICENSE_KEY` environment variable
3. the key saved by `occlua auth login` (`license.key`)
4. `license_key` under `[defaults]` in `config.toml`

A key that does not verify is never written to disk, and a rejected or lapsed
key leaves Basic working.

---

## Using OccLua in CI

OccLua is scriptable. The pieces that matter in automation:

- `--quiet` prints nothing but the protected output.
- `-o -` writes clean Lua to stdout (all progress goes to stderr).
- `--force` replaces an existing output file.
- `--seed` makes a build reproducible.
- `OCCLUA_LICENSE_KEY` supplies a key without touching disk.
- The process exits non-zero on failure.

GitHub Actions example:

```yaml
jobs:
  protect:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install OccLua
        shell: pwsh
        run: |
          irm https://occlua.vercel.app/install.ps1 | iex
          "$env:USERPROFILE\.occlua\bin" | Out-File -Append -FilePath $env:GITHUB_PATH

      - name: Obfuscate
        shell: pwsh
        run: occlua src/main.lua -o dist/main.lua --seed ${{ github.run_number }} --force --quiet
        env:
          OCCLUA_LICENSE_KEY: ${{ secrets.OCCLUA_LICENSE_KEY }}
```

The `GITHUB_PATH` line makes `occlua` visible to later steps, since the
installer's `PATH` change only applies to new shells.

---

## Reproducible builds

`--seed` pins the build. The same input, target, tier and seed produce a
byte-identical output; a different seed produces different output.

```powershell
occlua script.lua -o a.lua --seed 1 --force
occlua script.lua -o b.lua --seed 1 --force
occlua script.lua -o c.lua --seed 2 --force

(Get-FileHash a.lua -Algorithm SHA256).Hash -eq (Get-FileHash b.lua -Algorithm SHA256).Hash  # True
(Get-FileHash a.lua -Algorithm SHA256).Hash -eq (Get-FileHash c.lua -Algorithm SHA256).Hash  # False
```

---

## Benchmarks

Measured with the release CLI (v0.1.0) on Windows 11, x86_64, single-threaded,
tier `basic`. Times are the engine's own reported elapsed, over several runs.

| Input | Input size | Output size | Time |
|:--|--:|--:|:--|
| Site demo | 1,259 B | 2,438 B | 2–3 ms |
| 2,000-function corpus | 547,613 B | 775,881 B | 0.25–0.44 s (median 0.31 s) |

That is roughly **1.8 MB/s in** and **2.5 MB/s out** on the larger file. The demo
and corpus files were fixed inputs; the seed was pinned. Machine: Intel Core
i5-1135G7 @ 2.40 GHz, 4 cores, 8 GB RAM.

These figures cover the offline `basic` tier. Standard and Enterprise run on the
OccLua service, so their end-to-end time includes a network round-trip.

---

## Limitations

These are current gaps, listed plainly. None of them change the behaviour of a
protected script; they only mean a feature is not doing work yet.

- **Control-flow flattening is opt-in.** It is implemented, but only runs when
  `controlflow.enabled` and `controlflow.flatten` are both on; the `strong` and
  `maximum` presets set them. It is off in the default and `basic`/`standard`
  presets. `break_loops`, `dispatcher` and `max_nesting` are accepted but not
  read yet.
- **Dead-code insertion is not implemented.** The `deadcode` settings exist and
  currently do nothing.
- **The VM is not built.** `vm.enabled` has no effect.
- **Some identifier settings are not wired up.** `strategy`, `upvalues` and
  `reserved_words` are inert; `locals`, `parameters`, `functions`, name length
  and charset are active.
- **Only plain decimal integer literals are rewritten.** Floats, exponents and
  literals that already carry a radix prefix are left alone, so numeric
  semantics cannot shift.
- **Binary literals (`0b...`) are never generated.** Stock Lua rejects them and
  only LuaJIT accepts them.
- Standard and Enterprise build on the server, so they require network access
  and a valid key.

---

## Roadmap

Planned, not yet shipped:

- Randomised dead code, and the flattening dispatcher's `computed` shape.
- A register-based virtual machine with per-build randomised opcode encoding.
- Per-build watermarking.
- A source map for `--debug`.
- `--watch` rebuild-on-change.

Anything listed here is a plan, not a feature. Nothing is described as working
until a test proves it.

---

## Troubleshooting

**`occlua` is not recognised after install.**
Open a new terminal so the updated `PATH` is picked up. Confirm the install with
`& "$env:USERPROFILE\.occlua\bin\occlua.exe" --version`.

**The installer is blocked by the execution policy.**
Run it for the current session with
`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`, or call the script
with `powershell -ExecutionPolicy Bypass -File install.ps1`.

**"that does not look like an OccLua license key".**
Keys are issued by the site and redeemed once. Use the key exactly as sent, with
`occlua auth redeem <key>`; redeeming merges its tier and remaining time into
your account's key and spends the source key.

**Paid tiers fail but Basic works.**
Standard and Enterprise need a reachable service and a valid key. Check
`occlua auth status`. Basic never needs either.

**"Output exists ... Use --force to replace it."**
OccLua will not overwrite a file without `--force`, and it never overwrites the
input.

**A script fails to parse.**
Run `occlua check <file>` to see syntax and target-compatibility details without
producing output.

---

## License

OccLua is **proprietary commercial software**. This repository is publicly
visible, but that is not a grant of rights. Use, copying, redistribution,
modification, reverse engineering and derivative use are governed by
[`LICENSE.md`](LICENSE.md).

---

<div align="center">

**☾ OccLua**

*Protect your Lua. Keep your code yours.*

</div>
