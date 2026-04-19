-- LuaU backtick string interpolation. The tokenizer desugars to string.format.

local name = "Panda"
local version = 13
local greeting = `Hello, {name} v1.{version}!`

assert(greeting == "Hello, Panda v1.13!")

local nested = `sum={1 + 2} pair={({ "a", "b" })[2]}`
assert(nested == "sum=3 pair=b")

local escaped = `literal-brace: \{not-an-expr\}`
assert(escaped == "literal-brace: {not-an-expr}")

print(greeting)
