-- LuaU type-annotation stripping regression.
-- The obfuscator must accept typed Roblox-style code without erroring,
-- even when AllowTypedSyntax is false (LuaU-safe profile).

type Point = { x: number, y: number }
export type Vector = { x: number, y: number, z: number }

local function add(a: number, b: number): number
	return a + b
end

local function identity<T>(value: T): T
	return value
end

local function clamp(value: number, min: number?, max: number?): number
	local lo: number = min or 0
	local hi: number = max or 100
	if value < lo then return lo end
	if value > hi then return hi end
	return value
end

local p: Point = { x = 1, y = 2 } :: Point

local total: number = add(p.x, p.y) + identity(3) + clamp(150, 0, 100)
assert(total == 103)
print(total)
