-- TOML: syntax.toml
-- Repo: nvim-treesitter/nvim-treesitter-refactor

require'nvim-treesitter.configs'.setup {

  refactor = {

    highlight_definitions = {
      enable = true,
    },

    highlight_current_scope = {
      enable = true,
    },

    smart_rename = {
      enable = { "lua" },
      keymaps = {
        smart_rename = "cs",
      },
    },

    -- navigation = {
    --   enable = true,
    --   keymaps = {
    --     goto_definition = "gd",
    --     list_definitions = "gD",
    --     list_definitions_toc = "gO",
    --     goto_next_usage = ']u',
    --     goto_previous_usage = "[u",
    --   },
    -- },

  },
}
