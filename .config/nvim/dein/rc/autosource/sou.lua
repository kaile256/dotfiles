-- TOML: vimscript.toml
-- Repo: jenterkin/vim-autosource

local g = vim.g

g.autosource_hashdir = vim.env.HOME .. "/.cache/vim_autosource_hashes"

g.autosource_conf_names = {
  ".local.vimrc",
  ".vimrc.lua",
}
