# :panda_face: Panda Obfuscator v1.3
[![Test](https://github.com/Panda-Repositories/Prometheus-Modified/actions/workflows/Test.yml/badge.svg)](https://github.com/Panda-Repositories/Prometheus-Modified/actions/workflows/Test.yml)

Panda Obfuscator is a Lua obfuscator written in pure Lua, based on Prometheus.
It uses AST-based transformations including Control-Flow Flattening, Constant Encryption, VM virtualization, and hardened handler polymorphism.

Panda Obfuscator targets both **Lua 5.1** and **Roblox Luau** and ships a Xenon-safe preset that avoids high-UNC APIs (`debug.sethook`, `string.dump`, `hookfunction`, `getrawmetatable`).

<p align="center">
  <img src="assets/readme/obfuscation-preview.gif" alt="Panda Obfuscator preview" width="900" />
</p>

## Installation

```batch
git clone https://github.com/Panda-Repositories/Prometheus-Modified.git
cd Prometheus-Modified
```

### Ready-to-use (Windows)
Run the installer once — it downloads Lua 5.1.5 into `.\bin\`:
```batch
powershell -ExecutionPolicy Bypass -File install.ps1
```
Then obfuscate with the `panda.bat` wrapper:
```batch
panda.bat --preset Panda-Xenon your_script.lua
```

### Ready-to-use (Linux / macOS)
Install Lua 5.1 via your package manager:
```bash
sudo apt install lua5.1         # Debian / Ubuntu
brew install lua@5.1            # macOS
```
Then run:
```bash
chmod +x ./panda.sh
./panda.sh --preset Panda-Xenon your_script.lua
```

### Manual
Requires LuaJIT or Lua 5.1. Binaries: https://sourceforge.net/projects/luabinaries/files/5.1.5/Tools%20Executables/
```batch
lua ./cli.lua --preset Medium your_script.lua
```

## Usage
```batch
panda.bat --preset Panda-Xenon your_script.lua
panda.bat --preset Panda-Roblox-Strong your_script.lua
panda.bat --preset Medium --out out.lua your_script.lua
```

### Presets
- `Minify` – whitespace/rename only
- `Weak` / `Medium` / `Strong` – Lua 5.1 pipelines
- `LuaU-Safe` / `LuaU-Typed` – Luau pipelines (compat profiles)
- `Panda-Xenon` – Luau, low-UNC safe for Xenon and similar executors
- `Panda-Roblox-Strong` – heaviest Luau pipeline with double Vmify

### Compatibility profiles
- `Lua51` (default)
- `LuaU-safe`
- `LuaU-typed` – accepts type annotations; obfuscation strips them

```batch
lua ./cli.lua --profile LuaU-safe --LuaU ./your_file.lua
lua ./cli.lua --preset Panda-Xenon ./roblox_script.lua
```

### LuaU feature matrix
See `doc/luau-feature-matrix.md`.

## Tests
```batch
lua ./tests.lua [--Linux]
```

## License and Attribution

Panda Obfuscator is a derivative work of **Prometheus** by Elias Oelschner (levno-710), licensed under the Prometheus License (MIT-style with attribution).

> Based on Prometheus by Elias Oelschner, https://github.com/prometheus-lua/Prometheus

Any commercial product, wrapper, or service (including SaaS) built on Panda Obfuscator must include visible attribution to the upstream Prometheus project as required by its license. Obfuscated output files do not need to include any license notice.

Full upstream license text: [Prometheus License](https://github.com/levno-710/Prometheus/blob/master/LICENSE)
