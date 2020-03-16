" From: git.toml
" Repo: aacunningham/vim-fuzzy-stash

let g:fuzzystash#actions = {
      \ 'ctrl-x': 'drop',
      \ 'return': 'pop',
      \ 'ctrl-o': 'apply',
      \ }

"command! -nargs=? Gstash :call fuzzystash#create_stash(<q-args>)

"command! -nargs=? GstashList :call fuzzystash#list_stash(<q-args>)
command! -nargs=? Gstashes    :call fuzzystash#list_stash(<q-args>)
