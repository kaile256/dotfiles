" Treat default plugins as loaded

let g:loaded_vimball       = 1
let g:loaded_vimballPlugin = 1
let g:loaded_tarPlugin     = 1
let g:loaded_tar           = 1
let g:loaded_zipplugin     = 1
let g:loaded_zip           = 1
let g:loaded_gzip          = 1

function! s:runtime_tarPlugin() "{{{
  let g:loaded_tarPlugin = 0
  let g:loaded_tar       = 0
  source! /usr/share/nvim/runtime/*/tar*.vim
endfunction "}}}
function! s:runtime_zipPlugin() "{{{
  let g:loaded_zipplugin = 0
  let g:loaded_zip       = 0
  let g:loaded_gzip       = 0
  source! /usr/share/nvim/runtime/*/*zip*.vim
endfunction "}}}
augroup ReloadDefaultPlugins
  au!
  au BufWinEnter * if &ft ==# 'netrw' | setl bufhidden=wipe | endif
  au FileType netrw    ++once runtime netrw.vimrc
  au FileType tar      ++once call <SID>runtime_tarPlugin()
  au FileType zip,gzip ++once call <SID>runtime_zipPlugin()
augroup END
