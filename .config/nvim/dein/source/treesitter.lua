-- TOML: syntax.toml
-- Repo: nvim-treesitter/nvim-treesitter
-- From: source/treesitter.vim

-- Ref: Use rainbow bracket together with treesitter
--      https://github.com/luochen1990/rainbow/issues/151
require'nvim-treesitter.highlight'
local hlmap = vim.treesitter.highlighter.hl_map

hlmap.error = nil
hlmap["punctuation.bracket"] = nil
hlmap["punctuation.delimiter"] = "Delimiter"


require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = false,
    disable = {},
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "<space>v",
      -- scope_incremental = "g<C-a>",
      node_decremental = "<C-x>",
      node_incremental = "<C-a>",
    }
  },
}
