# LuaU Feature Matrix

## Profiles
- `Lua51`: Lua 5.1 compatibility mode (default).
- `LuaU-safe`: LuaU syntax features that are currently supported end-to-end in the pipeline.
- `LuaU-typed`: Enables typed-syntax feature flags (typed constructs not implemented still fail explicitly).

## Tokenizer
- Lua51 tokens: ✅
- LuaU tokens (continue, compound operators, Luau symbols): ✅

## Parser
- `continue`: ✅ in LuaU-safe / LuaU-typed, ❌ in Lua51
- Compound assignment (`+=`, `-=`, `*=`, `/=`, `%=` `^=`, `..=`): ✅ in LuaU-safe / LuaU-typed, ❌ in Lua51
- If-else expression (`if cond then a else b`): ❌ by default profile flags (explicit error) to avoid VM compiler incompatibility
- Type assertion (`::`): ❌ (fails with explicit error)
- Typed declarations / annotations (`type`, `export`, `declare`, `:`, `->`, `?`, `|`, `&`): ❌ (strict explicit errors when typed syntax is disabled or unsupported)

## AST / Unparser
- Core Lua + LuaU continue/compound expression nodes: ✅
- If-else expression AST/unparse exists, but is disabled in default compatibility profiles pending VM compiler support
- Typed AST nodes: ❌ (not yet implemented)

## VM/Steps
- Steps now validate Lua version compatibility via `SupportedLuaVersions`.
- Generated helper snippets in `AntiTamper`, `ConstantArray`, and `EncryptStrings` now parse using active pipeline Lua version.

## Security Notes
- Random seed fallback is hardened with mixed entropy when OpenSSL is unavailable.
- AntiTamper now supports `FailMode` (`error`, `return`, `loop`) and uses randomized tamper messages.
