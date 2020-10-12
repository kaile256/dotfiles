" TOML: browse.toml
" Repo: liuchengxu/vim-clap

hi! link ClapPreview NormalFloat

" only supports 'ctrl-*'
let g:clap_open_action = {
      \ 'ctrl-o': 'split'
      \ }

let g:clap_layout = {
      \ 'relative': 'editor',
      \
      \ 'row': '5%',
      \ 'col': '5%',
      \
      \ 'width':  '90%',
      \ 'height': '90%',
      \ }
