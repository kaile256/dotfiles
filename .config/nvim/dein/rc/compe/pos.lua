-- TOML: insert.toml
-- Repo: hrsh7th/nvim-compe

-- Note: With `longest`, unexpected deletion happens by <space> with pumvisible().
vim.o.completeopt = 'menu,preview'

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  -- Look for available sources in nvim-compe/after/plugin
  source = {
    spell = true,
    buffer = {
      ignored_filetypes = {
        'gitcommit',
      },
    },
    path = true,
    tabnine = {
      --  priority = 90,
      sort = false,
      show_prediction_strength = true,
      max_num_results = 6, -- The number of items at most in pum.
      max_line = 50, -- The number of lines around cursor to yield suggestions.
      --  ignore_pattern = '',
      },
    emoji = {
      filetypes = {
        'markdown',
        'gitcommit',
      },
    },
    -- calc = true,
    -- treesitter = true, -- Possibly slower.
    nvim_lsp = true,
    nvim_lua = true, -- like vim.
    luasnip = true,
    ultisnips = true,
  },
}
