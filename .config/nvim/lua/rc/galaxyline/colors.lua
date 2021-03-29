local vim = vim

local theme = {}

theme.default = {
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',

  bg       = '#202328',
  fg       = '#bbc2cf',
}

vim.api.nvim_command('hi! GalaxyDefault guifg='.. theme.default.fg .. ' guibg=' .. theme.default.bg)

return theme.default
