-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- presets.lua
--
-- This Script provides the predefined obfuscation presets for Prometheus

return {
	-- Minifies your code. Does not obfuscate it. No performance loss.
	["Minify"] = {
		LuaVersion = "Lua51",
		CompatibilityProfile = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {},
	},

	-- Weak obfuscation. Very readable, low performance loss.
	["Weak"] = {
		LuaVersion = "Lua51",
		CompatibilityProfile = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true
				},
			},
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- This is here for the tests.lua file.
	-- It helps isolate any problems with the Vmify step.
	-- It is not recommended to use this preset for obfuscation.
	-- Use the Weak, Medium, or Strong for obfuscation instead.
	["Vmify"] = {
		LuaVersion = "Lua51",
		CompatibilityProfile = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "Vmify", Settings = {} },
		},
	},

	-- Medium obfuscation. Moderate obfuscation, moderate performance loss.
	["Medium"] = {
		LuaVersion = "Lua51",
		CompatibilityProfile = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "AntiTamper",
				Settings = {
					UseDebug = false,
				},
			},
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					LocalWrapperThreshold = 0,
				},
			},
			{ Name = "NumbersToExpressions", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- Strong obfuscation, high performance loss.
	["Strong"] = {
		LuaVersion = "Lua51",
		CompatibilityProfile = "Lua51",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "Vmify", Settings = {} },
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "AntiTamper",
				Settings = {
					UseDebug = false,
				},
			},
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					LocalWrapperThreshold = 0
				},
			},
			{
				Name = "NumbersToExpressions",
				Settings = {
					NumberRepresentationMutaton = true
				},
			},
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	["LuaU-Safe"] = {
		LuaVersion = "LuaU",
		CompatibilityProfile = "LuaU-safe",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					LocalWrapperThreshold = 0,
				},
			},
			{ Name = "NumbersToExpressions", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	["LuaU-Typed"] = {
		LuaVersion = "LuaU",
		CompatibilityProfile = "LuaU-typed",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{ Name = "EncryptStrings", Settings = {} },
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Threshold = 1,
					StringsOnly = true,
					Shuffle = true,
					Rotate = true,
					LocalWrapperThreshold = 0,
				},
			},
			{ Name = "NumbersToExpressions", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- Xenon / low-UNC safe preset. Avoids debug.sethook, string.dump, debug.getupvalue,
	-- and other APIs commonly stubbed or absent on sandboxed Roblox executors.
	-- Distinct from Medium/Strong: adds SplitStrings + ProxifyLocals, silent-fail AntiTamper,
	-- custom-function string concatenation, number-representation mutation, and vararg noise.
	["Panda-Xenon"] = {
		LuaVersion = "LuaU",
		CompatibilityProfile = "LuaU-safe",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{
				Name = "SplitStrings",
				Settings = {
					Treshold = 1,
					MinLength = 3,
					MaxLength = 6,
					ConcatenationType = "custom",
					CustomFunctionType = "local",
				},
			},
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "ProxifyLocals",
				Settings = {
					LiteralType = "any",
				},
			},
			{
				Name = "AntiTamper",
				Settings = {
					XenonSafe = true,
					UseDebug = false,
					FailMode = "silent",
				},
			},
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Treshold = 1,
					StringsOnly = false,
					Shuffle = true,
					Rotate = true,
					LocalWrapperTreshold = 1,
					LocalWrapperCount = 4,
				},
			},
			{
				Name = "NumbersToExpressions",
				Settings = {
					Threshold = 1,
					InternalThreshold = 0.4,
					NumberRepresentationMutaton = true,
				},
			},
			{ Name = "AddVararg", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},

	-- Heaviest Roblox / Luau pipeline. Two Vmify passes + double constant pooling +
	-- re-encrypted strings between passes. Substantially slower + larger than Panda-Xenon.
	-- Use when anti-decompilation outweighs runtime cost.
	["Panda-Roblox-Strong"] = {
		LuaVersion = "LuaU",
		CompatibilityProfile = "LuaU-safe",
		VarNamePrefix = "",
		NameGenerator = "MangledShuffled",
		PrettyPrint = false,
		Seed = 0,
		Steps = {
			{
				Name = "SplitStrings",
				Settings = {
					Treshold = 1,
					MinLength = 2,
					MaxLength = 5,
					ConcatenationType = "custom",
					CustomFunctionType = "local",
				},
			},
			{ Name = "EncryptStrings", Settings = {} },
			{
				Name = "ProxifyLocals",
				Settings = {
					LiteralType = "dictionary",
				},
			},
			{
				Name = "AntiTamper",
				Settings = {
					XenonSafe = true,
					UseDebug = false,
					FailMode = "silent",
				},
			},
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Treshold = 1,
					StringsOnly = false,
					Shuffle = true,
					Rotate = true,
					LocalWrapperTreshold = 1,
					LocalWrapperCount = 6,
				},
			},
			{ Name = "EncryptStrings", Settings = {} },
			{ Name = "Vmify", Settings = {} },
			{
				Name = "ConstantArray",
				Settings = {
					Treshold = 1,
					StringsOnly = false,
					Shuffle = true,
					Rotate = true,
					LocalWrapperTreshold = 1,
					LocalWrapperCount = 8,
				},
			},
			{
				Name = "NumbersToExpressions",
				Settings = {
					Threshold = 1,
					InternalThreshold = 0.5,
					NumberRepresentationMutaton = true,
				},
			},
			{ Name = "AddVararg", Settings = {} },
			{ Name = "WrapInFunction", Settings = {} },
		},
	},
}
