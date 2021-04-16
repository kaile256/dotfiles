-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local u_vi_mode = require('rc.feline.utils.vi_mode')
local u_snatch = require('rc.feline.utils.snatch')
local colors = require('rc.feline.colors')
local signs = require('rc.feline.signs')
local sep_right = signs.separator.right

local mode = {
  vi_mode = {},
  snatch = {},
  ultisnips = {},
}

mode.snatch = {
  enabled = u_snatch.get_strategies,
  provider = u_snatch.get_strategies,
}

mode.vi_mode = {
  provider = function()
    local v_bar = signs.separator.symmetry.vertical_bar
    return v_bar .. ' ' .. u_vi_mode.get_mode() .. ' ' .. v_bar
  end,
  hl = function()
    local val = {}
    val.fg = u_vi_mode.get_mode_color()
    val.bg = colors.bg
    val.style = 'bold'
    return val
  end,
  -- right_sep = sep_right.rounded_thin,
}

return mode
