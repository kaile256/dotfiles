-- TOML: appearance.toml
-- Repo: lukas-reineke/indent-blankline.nvim

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = true

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

-- Note: The palettes derive primarily from https://coolors.co/334152.
local color_palettes = {
  square = {
    "#334152",
    "#523350",
    "#524433",
    "#335234",
  },
  monochromatic = {
    -- "#334152",
    "#4d637c",
    "#6884a7",
    "#82a6d1",
    "#9dc8fc",
    -- "#191f27",
  },
  tints = {
    -- "#334152",
    "#3d4e62",
    "#485b73",
    "#526883",
    "#5d7594",
    "#6a83a2",
  },
  analogus = {
    "#334152",
    "#334d52",
    "#334752",
    "#334152",
    "#333b52",
    "#333552",
  },
}

-- Append all the items but the first and the last ones in reverse order, i.e., convert `{"foo", "bar", "baz", "qux"}`
-- into `{"foo", "bar", "baz", "qux", "baz", "bar"}`.
---@diagnostic disable-next-line: unused-function
local tbl_make_back_and_forth = function(array)
  local new_array = vim.deepcopy(array)
  local i = #array - 1
  while i > 1 do
    table.insert(new_array, array[i])
    i = i - 1
  end
  return new_array
end

-- Define vim's syntaxes, and return an array of highlights in the defined order.
local generate_highlight_list = function(colors)
  local hl_list = {}
  for idx, hex in pairs(colors) do
    local prefix = "IndentBlankline"
    local syntax_name = prefix .. idx
    local options = "guibg=" .. hex .. " gui=nocombine"
    vim.cmd("highlight! " .. syntax_name .. " " .. options)
    table.insert(hl_list, syntax_name)
  end
  return hl_list
end

local color_table = tbl_make_back_and_forth(color_palettes.tints)

local highlight_list = generate_highlight_list(color_table)
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
