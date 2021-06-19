-- TOML: git.toml
-- Repo: lewis6991/gitsigns.nvim

require"gitsigns".setup {
  current_line_blame = false,

  watch_index = {
    interval = 1000,
  },
  -- attach_to_untracked = false,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present

  -- Sign
  sign_priority = 90,
  numhl = false,
  linehl = false,
  signcolumn = true, -- Unstable to update yet, use gitgutter's.
  signs = {
    add          = {text = '│', hl = 'DiffAdd',    numhl='DiffAddNr',    linehl='DiffAddLn'},
    change       = {text = '│', hl = 'DiffChange', numhl='DiffChangeNr', linehl='DiffChangeLn'},
    delete       = {text = '_', hl = 'DiffDelete', numhl='DiffDeleteNr', linehl='DiffDeleteLn'},
    topdelete    = {text = '‾', hl = 'DiffDelete', numhl='DiffDeleteNr', linehl='DiffDeleteLn'},
    changedelete = {text = '~', hl = 'DiffChange', numhl='DiffChangeNr', linehl='DiffChangeLn'},
  },

  keymaps = {
    noremap = false,
    buffer = false,
  },
}
