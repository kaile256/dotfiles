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
    "#f2c6de",
    "#f9c6c9",
    "#faedcb",
    "#c9e4de",
    "#c6def1",
    "#d1d6f1",
    "#d8cdf0"
  } or {
    "#ff0000",
    "#ffa500",
    "#ffff00",
    "#008000",
    "#0000ff",
    "#4b0082",
    "#ee82ee"
  }

local generate_highlight_list = function()
  local hl_list = {}
  for idx, hex in pairs(color_table) do
    local prefix = "IndentBlankline"
    local syntax_name = prefix .. idx
    local options = "guibg=" .. hex .. " gui=nocombine"
    vim.cmd("highlight! " .. syntax_name .. " " .. options)
    table.insert(hl_list, syntax_name)
  end
  return hl_list
end
local highlight_list = generate_highlight_list()
vim.g.indent_blankline_char_highlight_list =  {}
vim.g.indent_blankline_space_char_highlight_list = highlight_list

vim.g.indent_blankline_char = ""
U.augroup { IndentBlankline_ModifyIndentUnitLengthAsTabstop = {{
  "BufEnter", "*", function()
    local char = (" "):rep(vim.bo.tabstop)
    vim.g.indent_blankline_space_char = char
    vim.g.indent_blankline_space_char_blankline = char
  end}
}}
