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

  keybindings = {
    toggle_query_editor = 'o',
    toggle_hl_groups = 'i',
    toggle_injected_languages = 't',
    toggle_anonymous_nodes = 'a',
    toggle_language_display = 'I',

    focus_language = 'f',
    unfocus_language = 'F',

    update = 'R',
    goto_node = '<CR>',

    show_help = '?',
  },
}

