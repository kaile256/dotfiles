-- TOML: appearance.toml
-- Repo: lukas-reineke/indent-blankline.nvim

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false

vim.g.indent_blankline_buftype_exclude = { "acwrite", "help", "nofile", "nowrite", "quickfix", "terminal", "prompt" }

vim.g.indent_blankline_filetype_exclude = {
  "agit",
  "agit_diff",
  "agit_stat",
  "defx",
  "fugitive",
  "git",
  "gitcommit",
  "gitrebase",
  "netrw",
  "twiggy",
}

local color_table =
  vim.g.colors_name == "spring-night"
  and {
    Red    = "#ff6a6f",
    Orange = "#fd8489",
    Yellow = "#fedf81",
    Green  = "#a9dd9d",
    Blue   = "#7098e6",
    Indigo = "#a8d2eb",
    Violet = "#e7d5ff"
  } or {
    Red    = "#ff0000",
    Orange = "#ffa500",
    Yellow = "#ffff00",
    Green  = "#008000",
    Blue   = "#0000ff",
    Indigo = "#4b0082",
    Violet = "#ee82ee"
  }

for color, hex in pairs(color_table) do
  local prefix = "IndentBlankline"
  local syntax_name = prefix .. color
  local options = "guifg=" .. hex .. " gui=nocombine"
  vim.cmd("highlight! " .. syntax_name .. " " .. options)
end

vim.g.indent_blankline_char_highlight_list= {
  "IndentBlanklineRed",
  "IndentBlanklineOrange",
  "IndentBlanklineYellow",
  "IndentBlanklineGreen",
  "IndentBlanklineBlue",
  "IndentBlanklinePurple",
  "IndentBlanklinePink",
}
