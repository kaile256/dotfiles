-- TOML: treesitter.toml
-- Repo: nvim-treesitter/playground

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},

    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    list_events = {
      "BufWrite",
      "CursorMoved",
    }
  },
}

