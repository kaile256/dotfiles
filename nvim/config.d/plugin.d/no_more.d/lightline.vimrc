"""" From: 'Init.toml'

let g:lightline.colorscheme = 'badwolf'

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ }

let g:lightline.component_function = {
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
  return &ft =~ 'help\|defx\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|defx\|gundo' && &readonly ? 'x' : '-'
endfunction

function! LightlineFilename()
  return ( '' != LightlineReadonly() ? LightlineReadonly() . ' ' : '' )
endfunction

function! LightlineFugitive()
  if &ft =~ 'defx\|gundo' && exists('fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction




