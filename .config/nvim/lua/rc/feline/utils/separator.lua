local separator = {}

setmetatable(separator, {
  __concat = function()
    -- TODO: concat at `hl.str`.
end
  })

---Convert args into a table.
-- @param sep_fg string: hex color for foreground like #000000
-- @param sep_bg string: hex color for background like #FFFFFF
-- @return hl table
separator.highlight = function(sep_fg, sep_bg)
  local hl = {
    fg = sep_fg,
    bg = sep_bg,
  }
  return hl
end

---Convert given char with hl (call by need).
-- @param sep_str string
-- @eeturn table: in the format for right_sep/left_sep for a component of feline, i.e.,
--  str = [given str],
--  hl = [lazy eval function to set hl config],
separator.format = function(sep_str)
  local val = function (sep_fg, sep_bg)
    return {
      str = sep_str,
      hl = separator.highlight(sep_fg, sep_bg),
    }
  end
  return val
end

separator.generate = function(seps)
  local new_tbl = {}
  for k, v in pairs(seps) do
    new_tbl[k] = separator.format(v)
  end
  return new_tbl
end

return separator
