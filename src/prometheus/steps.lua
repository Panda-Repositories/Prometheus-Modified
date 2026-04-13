-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- steps.lua
--
-- This Script provides a collection of obfuscation steps.

local Enums = require("prometheus.enums")

local WrapInFunction = require("prometheus.steps.WrapInFunction")
local SplitStrings = require("prometheus.steps.SplitStrings")
local Vmify = require("prometheus.steps.Vmify")
local ConstantArray = require("prometheus.steps.ConstantArray")
local ProxifyLocals = require("prometheus.steps.ProxifyLocals")
local AntiTamper = require("prometheus.steps.AntiTamper")
local EncryptStrings = require("prometheus.steps.EncryptStrings")
local NumbersToExpressions = require("prometheus.steps.NumbersToExpressions")
local AddVararg = require("prometheus.steps.AddVararg")
local WatermarkCheck = require("prometheus.steps.WatermarkCheck")

local allVersions = {
	[Enums.LuaVersion.Lua51] = true,
	[Enums.LuaVersion.LuaU] = true,
}

WrapInFunction.SupportedLuaVersions = allVersions
SplitStrings.SupportedLuaVersions = allVersions
Vmify.SupportedLuaVersions = allVersions
ConstantArray.SupportedLuaVersions = allVersions
ProxifyLocals.SupportedLuaVersions = allVersions
AntiTamper.SupportedLuaVersions = allVersions
EncryptStrings.SupportedLuaVersions = allVersions
NumbersToExpressions.SupportedLuaVersions = allVersions
AddVararg.SupportedLuaVersions = allVersions
WatermarkCheck.SupportedLuaVersions = allVersions

return {
	WrapInFunction = WrapInFunction,
	SplitStrings = SplitStrings,
	Vmify = Vmify,
	ConstantArray = ConstantArray,
	ProxifyLocals = ProxifyLocals,
	AntiTamper = AntiTamper,
	EncryptStrings = EncryptStrings,
	NumbersToExpressions = NumbersToExpressions,
	AddVararg = AddVararg,
	WatermarkCheck = WatermarkCheck,
}
