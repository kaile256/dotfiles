-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim
local colors = require('rc.feline.colors')

local vi_mode = {}

vi_mode.get_mode = function()
  local m = vim.fn.mode(1)

  if m:find('o') then return 'OPERATOR' end
  if m:find('ni') then return 'TEMPORARY' end
  if m:find('i') then return 'INSERT' end
  if m:find('R') then return 'REPLACE' end
  if m:find('r') then return 'PROMPT' end

  if m == '!' then return 'SHELL' end
  if m == 'c' then return 'COMMAND' end
  if m:find('c') then return 'Ex Mode' end

  if m == 'v' then return 'VISUAL' end
  if m == 's' then return 'SELECT' end
  if m == 'V' then return 'V-LINE' end
  if m == 'S' then return 'S-LINE' end
  if m == '' then return 'V-BLOCK' end
  if m == '' then return 'S-BLOCK' end

  if m == 't' then return 'TERM' end
  return 'NORMAL'
end

vi_mode.get_mode_color = function()
  -- Change color according the vim mode

  local normal   = colors.green
  local insert   = colors.violet
  local visual   = colors.yellow
  local select   = colors.cyan
  local replace  = colors.red
  local command  = colors.orange
  local prompt   = colors.skyblue
  local shell    = colors.magenta
  local terminal = colors.oceanblue

  local m = vim.fn.mode(1)

  if m:find('R') then return replace end
  if m:find('i') then return insert end
  if m:find('r') then return prompt end
  if m:find('c') then return command end

  if m == 't' then return terminal end
  if m == '!' then return shell end

  if m == '' then return visual end
  if m == '' then return select end
  m = m:lower()
  if m == 'v' then return visual end
  if m == 's' then return select end

  return normal
end

-- function vi_mode.update_hl_group(hl)
--   local name = 'ViMode'
--   utils.add_component_highlight(name, hl.fg, hl.bg, hl.style)
--   local name_inv = name .. 'Inv'
--   utils.add_component_highlight(name_inv, hl.fg, hl.bg, hl.style)
-- end

return vi_mode

