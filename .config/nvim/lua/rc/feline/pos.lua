-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

vim.cmd [[
setglobal noshowmode
]]

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

require('feline').setup({
  default_bg = '#1F1F23',
  default_fg = '#D0D0D0',
  components = require('rc.feline.components'),
  properties = require('rc.feline.properties'),
  vi_mode_colors = vi_mode_colors,
})
