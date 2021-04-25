-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

vim.cmd [[
setglobal noshowmode
]]

local colors = require('rc.feline.colors')

require('feline').setup({
  components = require('rc.feline.components'),
  properties = require('rc.feline.properties'),

  default_fg = colors.fg,
  default_bg = colors.bg,

  colors = colors.vivid,
  -- vi_mode_colors = require('rc.feline.utils.vi_mode').colors_for_builtin,
})
