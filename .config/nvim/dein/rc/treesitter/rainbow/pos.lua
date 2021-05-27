-- TOML: treesitter.toml
-- Repo: p00f/nvim-ts-rainbow

local vim = _G.vim

require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}


-- Only 1 to 7 colors work.
local colors = {
  {'#dadada', '253'},
  {'#e7cc3e', 'Yellow'},
  {'#be7cf3', 'Magenta'},
  {'#f2b7e2', 'LightRed'},
  {'#fb9270', 'Orange'},
  {'#56cd8e', 'Green cterm=bold'},
  {'#e7585b', 'Red'},
  -- {'#558df5', 'Blue cterm=bold'},
}

local override_highlights = ""
for idx=1, #colors do
  local color = colors[idx]
  override_highlights = override_highlights
    .. "highlight! rainbowcol".. idx
    .. " guifg=" .. color[1]
    .. " ctermfg=" .. color[2]
    .."\n"
end
vim.cmd(override_highlights)
