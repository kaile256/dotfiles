-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

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
    fg = 'black',
    bg = 'skyblue',
    style = 'bold'
  },
}

return buffer
