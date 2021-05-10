-- TOML: git.toml
-- Repo: lewis6991/gitsigns.nvim

local vim = vim

vim.cmd [[
source $DEIN_LUA_DIR/gitsigns/keymap.vim
]]

require('gitsigns').setup {
  current_line_blame = false,

  watch_index = {
    interval = 1000,
  },
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present

  -- Sign
  sign_priority = 90,
  numhl = false,
  linehl = false,
  signs = {
    add          = {text = '│', hl = 'DiffAdd',    numhl='DiffAddNr',    linehl='DiffAddLn'},
    change       = {text = '│', hl = 'DiffChange', numhl='DiffChangeNr', linehl='DiffChangeLn'},
    delete       = {text = '_', hl = 'DiffDelete', numhl='DiffDeleteNr', linehl='DiffDeleteLn'},
    topdelete    = {text = '‾', hl = 'DiffDelete', numhl='DiffDeleteNr', linehl='DiffDeleteLn'},
    changedelete = {text = '~', hl = 'DiffChange', numhl='DiffChangeNr', linehl='DiffChangeLn'},
  },

  keymaps = {
    noremap = true,
    buffer = true,

    -- ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    -- ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    --
    -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    -- ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    --
    -- -- Text objects
    -- ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    -- ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
}

-- TODO: Delete the command to disable gitgutter on signcolumn after migration on Neovim.
vim.cmd [[
GitGutterSignsDisable
]]
