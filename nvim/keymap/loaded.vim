" Treat default plugins as loaded

function! s:detect_tar() "{{{
  if &l:ft == 'tar'
    let g:loaded_tarPlugin = 0
    let g:loaded_tar       = 0
    source /usr/share/nvim/runtime/*/tar*.vim
  else
    let g:loaded_tarPlugin = 1
    let g:loaded_tar       = 1
  endif
endfunction "}}}

  function! s:detect_zip() "{{{
  if &l:ft == 'zip' || 'gzip'
    let g:loaded_zipPlugin = 0
    let g:loaded_zip       = 0
    let g:loaded_gzip       = 0
    source /usr/share/nvim/runtime/*/*zip*.vim
  else
    let g:loaded_zipPlugin = 1
    let g:loaded_zip       = 1
    let g:loaded_gzip       = 1
  endif
endfunction "}}}

augroup ReloadDefaultPlugins
  au!
  au FileType tar call <SID>detect_tar()
  au FileType zip,gzip call <SID>detect_zip()
augroup END
