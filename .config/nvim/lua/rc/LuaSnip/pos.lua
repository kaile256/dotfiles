-- TOML: insert.toml
-- Repo: L3MON4D3/LuaSnip

local luasnip = require"luasnip"
local new_snippet = luasnip.s -- Define a snippet
local snippet = luasnip.sn -- ?
local text = luasnip.t -- Expand as a plain text
local tabstop = luasnip.i -- tabstop
local func = luasnip.f -- Accept only function arguemnt
local one_of = luasnip.c -- Choose one from multiple options.
local dynamic = luasnip.d -- No doc. Its node may be generated up to other node objects.

new_snippet({trig = 'feat'})
