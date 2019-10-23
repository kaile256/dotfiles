" From: appearance.toml

" FAQ: 'g:lightline' is undefined; Define on top itself as a dict.
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'

let g:lightline.active = {
      \ 'left': [
      \         [ 'mode', 'paste' ],
      \         [ 'fugitive', 'filename' ] ,
      \         [ 'cocstatus', 'readonly', 'filename', 'modified' ],
      \         ]
      \ }

let g:lightline.component = {
      \ 'modified':     "&ft ==# 'help\|defx' ? '' : &modified ? '&m' : &modifiable ? '' : '!&m'",
      \ }
let g:lightline.component_function = {
      \ 'cocstatus':    'coc#status',
      \
      \ 'readonly':     "l:readonly",
      \ 'filename':     "l:filename",
      \ 'fileformat':   "",
      \ 'filetype':     "",
      \ 'fileencofing': "",
      \ 'mode':         ""
      \ }

let l:readonly = execute(&ft !=# 'help\|defx' && &ro ? '&ro' : '!&ro')

let l:filename = {-> return
      \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
      \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
      \  &ft == 'unite' ? unite#get_status_string() :
      \  &ft == 'vimshell' ? vimshell#get_status_string() :
      \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
      \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
      \ }

function! s:fugitive() abort
  if &ft ==# 'defx' && exists('fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction
