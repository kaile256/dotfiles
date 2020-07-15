" TOML: fugitive.toml
" Repo: rbong/vim-flog

augroup myFlogSo
  au FileType floggraph call s:flog_mappings()
augroup END

function! s:flog_mappings() abort
  nmap <buffer> y# <Plug>FlogYank
  " xmap <buffer> y# <Plug>FlogYank
endfunction
