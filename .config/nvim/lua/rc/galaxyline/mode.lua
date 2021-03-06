-- Init: $DEIN_RC_DIR/galaxyline/pos.lua

local vim = vim
local colors = require('rc.galaxyline.colors')
local icons = require('rc.galaxyline.icons')

local get_snatch_mode = function()
  local stat = vim.fn['snatch#status']()
  if stat.is_sneaking ~= nil and not stat.is_sneaking then
    return nil
  end

  local m = stat.prev_mode
  return (m == 'i' and 'i')
  or (m:match '^[-:>/?@=]$' and 'c')
  or nil
end

local set_color = function()
  -- Change color according the vim mode

  local normal = colors.green
  local insert = colors.violet
  local visual = colors.yellow
  local select = colors.cyan
  local replace = colors.red
  local command = colors.orange
  local prompt = colors.blue
  local shell = colors.magenta
  local terminal = colors.blue

  local m = get_snatch_mode() or vim.fn.mode(1)

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

local get_mode = function()
  local m = get_snatch_mode() or vim.fn.mode(1)
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

local ViMode = {
  provider = function()
    local fg = colors.bg
    -- Set default value. It's too hard to fix unexpected `nil`.
    local bg = set_color() or colors.fg
    vim.api.nvim_command('hi GalaxyViMode gui=bold guifg='.. fg .. ' guibg=' .. bg)
    vim.api.nvim_command('hi GalaxyViModeInv gui=bold,reverse guifg='.. fg .. ' guibg=' .. bg)
    local name = get_mode()
    if vim.g.loaded_eskk then
      local eskk_mode = vim.fn['eskk#statusline']():gsub('eskk:', '')
      if eskk_mode ~= '' then
        name = name:match('...') .. eskk_mode
      end
    end
    return '  ' .. name .. ' '
  end;

  separator = icons.filled_separator_left,
  separator_highlight = 'GalaxyViModeInv',
}

local ViModeSepLeft = {
  provider = function() return icons.filled_separator_left end;
  highlight = 'GalaxyViModeInv',
}

local ViModeSepRight = {
  provider = function() return icons.filled_separator_right end;
  highlight = 'GalaxyViModeInv',
}

local ViModeLinearSepLeft = {
  provider = function() return icons.linear_separator_left end;
  highlight = 'GalaxyViMode',
}
local ViModeLinearSepRight = {
  provider = function() return icons.linear_separator_right end;
  highlight = 'GalaxyViMode',
}

local SnatchStatus = {
  provider = function()
    local stat = vim.fn['snatch#status']()
    if stat.is_sneaking ~= nil and not stat.is_sneaking then return end

    local prev_mode = stat.prev_mode
    local strategies = stat.snatch_by
    local m = (prev_mode == 'i' and 'INSERT') or (prev_mode == 'cmdline' and 'COMMAND') or 'ERROR'
    local s = '[' .. table.concat(strategies, '|') .. ']'
    return 'SNATCH:' .. s .. ' ' .. icons.linear_separator_left
  end;
  highlight = 'GalaxyViModeInv',
}

local Mode = {
  ViMode = {ViMode=ViMode},

  ViModeSepLeft        = { ViModeSepLeft        = ViModeSepLeft },
  ViModeSepRight       = { ViModeSepRight       = ViModeSepRight },
  ViModeLinearSepLeft  = { ViModeLinearSepLeft  = ViModeLinearSepLeft },
  ViModeLinearSepRight = { ViModeLinearSepRight = ViModeLinearSepRight },

  SnatchStatus = {SnatchStatus=SnatchStatus},
}

return Mode
