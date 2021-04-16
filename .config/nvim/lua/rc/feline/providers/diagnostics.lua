local lsp = require('feline.providers.lsp')
local colors = require('rc.feline.colors')

local diagnostics = {}

diagnostics.error = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = colors.red,
  },
}

diagnostics.warning = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = colors.yellow,
  },
}

diagnostics.hint = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = colors.cyan,
  },
}

diagnostics.info = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = colors.skyblue,
  },
}

return diagnostics
