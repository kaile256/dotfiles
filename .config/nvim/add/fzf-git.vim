" From: myplug.toml
" Repo: kaile256/vim-fzf-git

" Note: do NOT use ctrl-j/ctrl-a and so on which are used in fzf-terminal
let g:fzf#git#stash#actions = {
      \ 'ctrl-x': 'drop',
      \ 'ctrl-o': 'apply',
      \ 'return': 'pop',
      \ 'alt-a': 'apply',
      \ 'alt-s': 'show',
      \ }

command! -nargs=? Gstashes :call fzf#git#stash#list(<q-args>)
"command! -nargs=? GstashList :call fzf#git#stash#list(<q-args>)
