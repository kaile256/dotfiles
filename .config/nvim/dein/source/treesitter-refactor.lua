-- TOML: syntax.toml
-- Repo: nvim-treesitter/nvim-treesitter-refactor

require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = {
      enable = true,
    },

    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = ']u',
        goto_previous_usage = "[u",
      },
    },
  },
}
