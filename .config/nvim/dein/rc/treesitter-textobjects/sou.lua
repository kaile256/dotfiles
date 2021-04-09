-- TOML: treesitter.toml
-- Repo: nvim-treesitter/nvim-treesitter-textobjects

require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<C-Del>"] = "@parameter.inner",
      },
      swap_previous = {
        ["<C-BS>"] = "@parameter.inner",
      },
    },

    select = {
      enable = true,

      disable = {
        "lua",
        "toml",
        "vue",
        "yaml",
      },

      keymaps = {
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",

        ["if"] = "@call.inner",
        ["af"] = "@call.outer",

        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["aM"] = "@class.outer",
        ["iM"] = "@class.inner",

        ["in"] = "@comment.outer",

        -- Mnemonic: a loop makes a circle (O).
        ["io"] = "@loop.inner",
        ["ao"] = "@loop.outer",

        -- Mnemonic: Question
        ["iQ"] = "@conditional.inner",
        ["aQ"] = "@conditional.outer",

        ["i,"] = "@parameter.inner",
        ["a,"] = "@parameter.outer",

        ["as"] = "@statement.outer",
      },
    },

    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  }
}
