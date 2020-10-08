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
      init_selection = "<space>v",
      node_decremental = "<space><C-x>",
      node_incremental = "<space><C-a>",
      scope_incremental = "<space>g<C-a>",
    }
  }
}
