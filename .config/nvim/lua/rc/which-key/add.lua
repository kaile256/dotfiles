-- TOML: default_mapping.toml
-- Repo: folke/which-key.nvim

local api = vim.api

api.nvim_set_keymap('n', '<C-S-space>', '<Cmd>WhichKey<CR>',       { silent = true })
api.nvim_set_keymap('x', '<C-S-space>', '<Cmd>WhichKey "" v <CR>', { silent = true })

api.nvim_set_keymap('n', '<Space>', '<Cmd>WhichKey <lt>space><CR>',    { silent = true })
api.nvim_set_keymap('x', '<Space>', '<Cmd>WhichKey <lt>space> v <CR>', { silent = true })

api.nvim_set_keymap('n', '<BSlash>', '<Cmd>WhichKey <BSlash> <CR>',   { silent = true })
api.nvim_set_keymap('x', '<BSlash>', '<Cmd>WhichKey <BSlash> v <CR>', { silent = true })
