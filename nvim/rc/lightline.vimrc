scriptencoding utf-8
" ERORR: 'g:lightline' is undefined.
" From: Init.toml

let g:lightline.colorscheme = 'wombat'

      "\ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ }

let g:lightline.component_function = {
      \ 'cocstatus':    'coc#status',
      \
      \ 'modified':     'LightlineModified',
      \ 'readonly':     'LightlineReadonly',
      \ 'fugitive':     'LightlineFugitive',
      \ 'filename':     'LightlineFFilename',
      \ 'fileformat':   'LightlineFileformat',
      \ 'filetype':     'LightlineFiletype',
      \ 'fileencofing': 'LightlineFileencoding',
      \ 'mode':         'LightlineMode'
      \ }

function! LightlineModified()
  return &ft ==# 'help\|defx' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !=# 'help\|defx' && &readonly ? 'x' : '-'
endfunction

function! LightlineFilename()
  return ( '' !=# LightlineReadonly() ? LightlineReadonly() . ' ' : '' )
endfunction

function! LightlineFugitive()
  if &ft ==# 'defx' && exists('fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction
