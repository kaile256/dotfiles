-- TOML: motion.toml
-- Repo: phaazon/hop.nvim

local api = vim.api

local opt = {
  silent = true,
}

api.nvim_set_keymap('n', 'S', '<Cmd>HopChar1<CR>', opt)
api.nvim_set_keymap('o', 'S', '<Cmd>HopChar1<CR>', opt)
api.nvim_set_keymap('x', 'S', '<Cmd>HopChar1<CR>', opt)
