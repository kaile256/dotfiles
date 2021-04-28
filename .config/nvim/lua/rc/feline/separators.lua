local separator = require('rc.feline.utils.separator')
local signs = require('rc.feline.signs')
local colors = require('rc.feline.colors')

-- All the signs should be wrapped for LSP completion support.
local separators = {
  left = {},
  symmetry = {},
  right = {},
}

local sep = {}
sep.whitespace = separator.format(' ')
---Convert args into a table.
-- @param sep_bg string: hex color for background like #000000
-- @return hl table
separators.space = function (bg) return sep.whitespace(colors.fg, bg) end

local seps = {}
-- Note: Automated generation is helpless for LSP completion support.
for pos, sep in pairs(signs.separator) do
  seps[pos] = separator.generate(sep)
end

---Convert args into a table.
-- @param sep_fg string: hex color for foreground like #000000
-- @param sep_bg string: hex color for background like #FFFFFF
-- @return hl table
separators.left.triangle_broad = function (fg, bg) return seps.left.triangle_broad(fg, bg) end

---Convert args into a table.
-- @param sep_fg string: hex color for foreground like #000000
-- @param sep_bg string: hex color for background like #FFFFFF
-- @return hl table
separators.right.triangle_broad = function (fg, bg) return seps.right.triangle_broad(fg, bg) end

---Convert args into a table.
-- @param sep_fg string: hex color for foreground like #000000
-- @param sep_bg string: hex color for background like #FFFFFF
-- @return hl table
separators.left.rounded_broad = function (fg, bg) return seps.left.rounded_broad(fg, bg) end

---Convert args into a table.
-- @param sep_fg string: hex color for foreground like #000000
-- @param sep_bg string: hex color for background like #FFFFFF
-- @return hl table
separators.right.rounded_broad = function (fg, bg) return seps.right.rounded_broad(fg, bg) end

return separators
