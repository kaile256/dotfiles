scriptencoding utf-8
" From: appearance.toml
" FAQ: 'g:lightline' is undefined; Define on top itself as a dict.
let g:lightline = {}
let g:lightline.colorscheme = ''

      "\ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ }

let g:lightline.component_function = {
      \ 'cocstatus':    'coc#status',
      \
      \ 'modified':     "&ft ==# 'help'||'defx' ? '' : &modified ? '+' : &modifiable ? '' : '-'",
      \ 'readonly':     "&ft !=# 'help'||'defx' && &readonly ? 'x' : '-'",
      \ 'filename':     "( '' !=# readonly() ? readonly() . ' ' : '' )",
      \ 'fileformat':   "s:lightline_fileformat",
      \ 'filetype':     "s:lightline_filetype",
      \ 'fileencofing': "s:lightline_fileencoding",
      \ 'mode':         "s:lightline_mode"
      \ }

function! s:lightline_fugitive()
  if &ft ==# 'defx' && exists('fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction
