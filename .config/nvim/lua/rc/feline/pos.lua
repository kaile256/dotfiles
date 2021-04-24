-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

vim.cmd [[
setglobal noshowmode
]]

require('feline').setup({
  components = require('rc.feline.components'),
  properties = require('rc.feline.properties'),

  default_bg = '#1F1F23',
  default_fg = '#D0D0D0',
  vi_mode_colors = require('rc.feline.utils.vi_mode').colors_for_builtin,
})
