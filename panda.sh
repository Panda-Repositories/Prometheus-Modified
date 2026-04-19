#!/usr/bin/env bash
# Panda Obfuscator v1.3 - Unix wrapper
# Uses bundled ./bin/lua5.1 if present, otherwise falls back to system lua/luajit.

set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -x "$ROOT/bin/lua5.1" ]; then
    exec "$ROOT/bin/lua5.1" "$ROOT/cli.lua" "$@"
fi

if command -v lua5.1 >/dev/null 2>&1; then
    exec lua5.1 "$ROOT/cli.lua" "$@"
fi

if command -v lua >/dev/null 2>&1; then
    exec lua "$ROOT/cli.lua" "$@"
fi

if command -v luajit >/dev/null 2>&1; then
    exec luajit "$ROOT/cli.lua" "$@"
fi

echo "Lua interpreter not found. Install Lua 5.1 or LuaJIT:" >&2
echo "  Debian/Ubuntu: sudo apt install lua5.1" >&2
echo "  macOS (brew):  brew install lua@5.1" >&2
exit 1
