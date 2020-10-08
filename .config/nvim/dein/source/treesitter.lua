-- TOML: syntax.toml
-- Repo: nvim-treesitter/nvim-treesitter
-- From: source/treesitter.vim

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
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
  }
}
