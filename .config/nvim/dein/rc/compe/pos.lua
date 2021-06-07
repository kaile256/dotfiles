-- TOML: insert.toml
-- Repo: hrsh7th/nvim-compe

vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'disable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,

  -- See *complete-item* for the details.
  max_abbr_width = 50, -- Truncate text candidates if they are longer than the value.
  max_kind_width = 15,  -- `kind` like 'Variable', 'Function', etc.
  max_menu_width = 10, -- `menu` indicates which source supplies the candidate, like [TN], [Buffer], [LSP].

  documentation = true,

  -- Look for available sources in nvim-compe/after/plugin
  source = {
    spell = true,
    buffer = {
      menu = "[B]",
      ignored_filetypes = {
        'gitcommit',
      },
    },
    path = true,

    emoji = {
      filetypes = {
        'markdown',
        'gitcommit',
      },
    },
    -- calc = true,
    -- treesitter = true, -- Possibly slower.
    nvim_lsp = {
      ignored_filetypes = {
        "gitcommit",
      }
    },
    nvim_lua = {
      -- Completion support for vim.g.foo, vim.fn[bar], etc.
      menu = "[vim]",
    },
    luasnip = {
      menu = "[LuaSnip]",
    },
    ultisnips = {
      menu = "[UltiSnips]",
    },

    -- Repo: tzachar/compe-tabnine
    tabnine = {
      priority = 80,
      sort = false,
      show_prediction_strength = true,
      max_num_results = 6, -- The number of items at most in pum.
      max_line = 50, -- The number of lines around cursor to yield suggestions.
      ignore_pattern = [[[({]|^['"]| = ?$]], -- Candidates won't include the patterns.
    },
  },
}
