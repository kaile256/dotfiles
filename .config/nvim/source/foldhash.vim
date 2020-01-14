" From: ftplugin.toml
" Repo: matze/vim-ini-fold
" Fork: kaile256/vim-ini-fold

let g:foldhash#patterns = {}

let g:foldhash#patterns.toml = {
      \ '^\s[#;]*\s*\[[^,]\+$': '>1'
      \ }

let g:foldhash#expand = {
      \ 'toml': ['toml', 'dosini', 'conf', 'desktop'],
      \ }

