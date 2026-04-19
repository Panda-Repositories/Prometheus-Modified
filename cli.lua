-- Panda Obfuscator v1.3 (based on Prometheus by Levno_710)
--
-- cli.lua
--
-- Bootstrap wrapper that forwards to src/cli.lua

-- Configure package.path for requiring Prometheus
local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*[/%\\])") or "";
end
package.path = script_path() .. "?.lua;" .. package.path;
require("src.cli");