" Treat default plugins as loaded

function! s:my_netrw_config() "{{{
  " where .netrwhist is located.
  let g:netrw_home = '$XDG_CACHE_HOME/nvim/netrw'
  " 0:show all, including hidden files.
  let g:netrw_hide = 0
  " 'H':show bytes like 5K, 4M, 3G
  let g:netrw_sizestyle ='H'
  " 'v' opens on right.
  let g:netrw_altv = 1
  " 'o' opens on below.
  let g:netrw_alto = 1
  " 2: always show tree view at first.
  "let g:netrw_liststyle = 2
endfunction "}}}

let g:loaded_tarPlugin = 1
let g:loaded_tar       = 1
let g:loaded_zipplugin = 1
let g:loaded_zip       = 1
let g:loaded_gzip      = 1
function! s:runtime_tarPlugin() "{{{
  let g:loaded_tarPlugin = 0
  let g:loaded_tar       = 0
  source! /usr/share/nvim/runtime/*/tar*.vim
endif
endfunction "}}}
function! s:runtime_zipPlugin() "{{{
  let g:loaded_zipplugin = 0
  let g:loaded_zip       = 0
  let g:loaded_gzip       = 0
  source! /usr/share/nvim/runtime/*/*zip*.vim
endfunction "}}}
augroup ReloadDefaultPlugins
  au!
  au FileType netrw setl bt=quickfix
  au FileType netrw    ++once call <SID>my_netrw_config()
  au FileType tar      ++once call <SID>runtime_tarPlugin()
  au FileType zip,gzip ++once call <SID>runtime_zipPlugin()
augroup END
