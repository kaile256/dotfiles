-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim
local colors = require('rc.feline.colors')

local buffer = {}

local scroll_bar = function()
  local blocks =  {
    '█',
    '▇',
    '▆',
    '▅',
    '▄',
    '▃',
    '▂',
    '▁',
  }
  local width = 2

  local curr_line = vim.fn.line('.')
  local lines = vim.fn.line('$')

  local index = vim.fn.floor(curr_line / lines * (#blocks - 1)) + 1

  return string.rep(blocks[index], width)
end

buffer.scrollbar = {
  provider = scroll_bar,
  hl = {
    fg = colors.black,
    bg = colors.skyblue,
    style = 'bold'
  },
}

return buffer
