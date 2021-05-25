-- TOML: motion.toml
-- Repo: phaazon/hop.nvim

local api = vim.api

local opt = {
  silent = true,
}

api.nvim_set_keymap('', 'S', '<Cmd>HopChar1<CR>', opt)
