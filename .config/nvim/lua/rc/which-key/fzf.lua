-- TOML: default.toml
-- Repo: liuchengxu/vim-which-key

local fzf = {
  N = {':Nmaps', 'Show Nmaps'},
  I = {':Imaps', 'Show Imaps'},
  X = {':Xmaps', 'Show Xmaps'},
  S = {':Smaps', 'Show Smaps'},
  V = {':Vmaps', 'Show Vmaps'},
  C = {':Cmaps', 'Show Cmaps'},
  O = {':Omaps', 'Show Omaps'},
  T = {':Tmaps', 'Show Tmaps'},
}

-- TODO: Resolve to which-key
local search_root = {
  ['.'] = "$DOTFILES_HOME",
  ['<C-h>'] = "$MY_TRASH_HOME",
  ['<space>'] = "<C-r>=FindRootDirectory()<CR>",


  w = "%:p:h",
  h = "$HOME",
  l = "$XDG_DATA_HOME",
  f = "$XDG_CONFIG_HOME",

  q = "$GHQ_ROOT",
  d = "$MY_DEV",
  m = "$MY_MEMO/note",

  r = "$VIMRUNTIME",
  s = "$SNIPPETS_HOME",
  c = "$DEIN_CACHE_HOME",
  t = "$VIM_TEMPLATE_HOME",
  v = "$DOTFILES_HOME/.vim",

}

local fzf_cmds = {
  'Fzf',
  'Rg',
  'Ag',
}

for _, cmd in pairs(fzf_cmds) do
  for key, path in pairs(search_root) do
    local command = '<Cmd>cd <bar>' .. cmd .. ' ' .. path .. '<CR>'
    local description = 'at ' .. path
    fzf[key] = {command, description}
  end
end

return fzf
