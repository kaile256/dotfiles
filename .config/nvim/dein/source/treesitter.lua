-- TOML: syntax.toml
-- Repo: nvim-treesitter/nvim-treesitter
-- From: source/treesitter.vim
-- Another: post/treesitter.lua

-- Ref: Use rainbow bracket together with treesitter
--      https://github.com/luochen1990/rainbow/issues/151
require'nvim-treesitter.highlight'
local hlmap = vim.treesitter.highlighter.hl_map
hlmap["punctuation.bracket"] = nil

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
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["aM"] = "@class.outer",
        ["iM"] = "@class.inner",
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ["+"] = "@parameter.inner",
      },
      swap_previous = {
        ["-"] = "@parameter.inner",
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
  },
}
