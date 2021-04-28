-- TOML: default.toml
-- Repo: liuchengxu/vim-which-key

local vim = vim

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
  ['.'] = '$DOTFILES_HOME',
  ['<space>'] = '<C-r>=FindRootDirectory()<CR>',

  c = '$DEIN_CACHE_HOME',
  d = '$MY_DEV',
  f = '$XDG_CONFIG_HOME',
  h = '$HOME',
  l = '$XDG_DATA_HOME',
  m = '$MY_MEMO/note',
  n = '%:p:h',
  q = '$GHQ_ROOT',
  r = '$VIMRUNTIME',
  s = '$SNIPPETS_HOME',
  t = '$MY_TRASH_HOME',
  v = '$DOTFILES_HOME/.vim',
  w = '%:p:h',
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
