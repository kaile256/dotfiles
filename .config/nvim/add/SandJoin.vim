" From: myplug.toml
" Repo: kaile256/vim-SandJoin

set nojoinspaces

"let g:SandJoin#patterns = {
"      \ '_': [
"      \   ['[^ \t\\]\zs\s\+', ' ', 'GLOBAL'],
"      \ ],
"      \ 'sh': [
"      \   ['\(^\|[;\\]\|do\|then\)\@<!$', '; ', '^bottom'],
"      \   ['[ \t\\]*$', '', '^bottom'],
"      \ ],
"      \ 'vim': [
"      \   ['^\s*\([^"| \t\\]\)\s*', ' | \1', '^top'],
"      \   ['^[ \t\\]*', '', '^top'],
"      \ ],
"      \ }

let g:SandJoin#no_default_mappings = 1

nmap <space>J <Plug>(SandJoin-J)
xmap <space>J <Plug>(SandJoin-J)

nmap gJ <Plug>(SandJoin-gJ)
xmap gJ <Plug>(SandJoin-gJ)
