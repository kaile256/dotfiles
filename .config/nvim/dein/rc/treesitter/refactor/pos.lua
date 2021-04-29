-- TOML: treesitter.toml
-- Repo: nvim-treesitter/nvim-treesitter-refactor

require'nvim-treesitter.configs'.setup {

  refactor = {

    highlight_definitions = {
      enable = true,
    },

    highlight_current_scope = {
      enable = false,
    },

    smart_rename = {
      enable = {
        "teal"
      },
      keymaps = {
        smart_rename = "cs",
      },
    },

    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<Plug>(ts-refactor-goto-definition)",
        list_definitions = "<Plug>(ts-refactor-list-definition)",
        list_definitions_toc = "<Plug>(ts-refactor-toc-definition)",

        goto_next_usage = "<Plug>(ts-refactor-usage-next)",
        goto_previous_usage = "<Plug>(ts-refactor-usage-prev)",
      },
    },

  },
}
