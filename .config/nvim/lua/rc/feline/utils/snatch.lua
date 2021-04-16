-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local snatch = {}

snatch.get_strategies = function()
  local stat = vim.fn['snatch#status']()
  if stat.is_sneaking ~= nil and not stat.is_sneaking then
    return nil
  end

  local prev_mode = stat.prev_mode
  local strategies = stat.snatch_by
  local m = (prev_mode == 'i' and 'INSERT') or (prev_mode == 'cmdline' and 'COMMAND') or 'ERROR'
  local s = '[' .. table.concat(strategies, '|') .. ']'
  return s
end

return snatch
