-- TOML: browse.toml
-- Repo: liuchengxu/vim-clap

local vim = _G.vim
local g = vim.g
local fn = vim.fn

vim.cmd [[
hi! link ClapPreview NormalFloat
]]

g.clap_provider_alias = {
  ['hist:'] = 'command_history',
  gfiles = 'git_files',
}
--  g.clap_theme = ''

g.clap_enable_icon = 1
g.clap_provider_grep_enable_icon = 1

--  g.clap_open_preview = 'on_move'

-- Only supports 'ctrl-*'
g.clap_open_action = {
  ['ctrl-o'] = 'split',
}

g.clap_layout = {
  relative = 'editor',

  row = '5%',
  col = '5%',

  width =  '90%',
  height = '90%',
}

-- _G.clap_format = function()
--   local cwd = g.__clap_provider_cwd or fn.getcwd()
--   return '%spinner% ' .. fn.pathshorten(cwd) .. ':'
-- end
--
-- --  g.ClapPrompt = vim.v.lua.clap_format
-- vim.cmd [[
-- let g:ClapPrompt = function('v:lua.clap_format')
-- ]]
