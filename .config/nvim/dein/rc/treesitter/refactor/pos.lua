-- TOML: treesitter.toml
-- Repo: nvim-treesitter/nvim-treesitter-refactor

vim.cmd [[
hi! TSCurrentScope cterm=bold gui=bold guibg=NONE
]]

require'nvim-treesitter.configs'.setup {

  refactor = {

    highlight_definitions = {
      enable = false,
    },

    highlight_current_scope = {
      enable = true,
      disable = {
        "toml",
      }
    },

    smart_rename = {
      enable = true,
      disable = {
        "lua",
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
