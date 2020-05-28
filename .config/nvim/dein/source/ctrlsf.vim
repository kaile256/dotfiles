" TOML: browse.toml
" Repo: dyng/ctrlsf.vim
" Another: add/ctrlsf.vim
" Another: post/ctrlsf.vim

let g:ctrlsf_auto_preview = 1
let g:ctrlsf_case_sensitive = 'yes'

let g:ctrlsf_default_root = 'project+ff'
let g:ctrlsf_extra_root_markers = [
      \ 'src/',
      \ 'dein/',
      \ 'nvim/',
      \ '\.config/',
      \ '\.cache/',
      \ 'runtime/',
      \ ]

" let g:ctrlsf_default_view_mode = 'compact'

" Note: Mappings to Ctrl+Shift+key fails to work in either formats, <c-N> or
" <C-S-n>; rather, make other mappings work unexpectedly, too.
let g:ctrlsf_mapping = {
      \ 'pquit'   : '',
      \ 'popen'   : 'p',
      \ 'popenf'  : '',
      \
      \ 'quit'    : '',
      \ 'open'    : ['<CR>', 'o'],
      \ 'openb'   : 'O',
      \
      \ 'split'   : '<C-O>',
      \ 'vsplit'  : '',
      \
      \ 'tab'     : 'gO',
      \ 'tabb'    : '',
      \
      \ 'next'    : '<C-n>',
      \ 'prev'    : '<C-p>',
      \
      \ 'chgmode' : '',
      \ 'loclist' : '',
      \ 'stop'    : '<C-C>',
      \ }
