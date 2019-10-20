" From: ftplugin.toml
" Repo: mhinz/vim-lookup

augroup LookupMyConf
  au!
  au FileType vim call <SID>lookup_my_keymaps()
  function! s:lookup_my_keymaps() abort
    nmap <buffer> <c-]>  :call lookup#lookup()<cr>zz
    xmap <buffer> <c-]>  :call lookup#lookup()<cr>zz
    nmap <buffer> <c-w>] :sp   <bar> call lookup#lookup()<cr>zz
    xmap <buffer> <c-w>] :sp   <bar> call lookup#lookup()<cr>zz
    nmap <buffer> <c-w>g] :tabe<cr>call lookup#lookup()<cr>zz
    xmap <buffer> <c-w>g] :tabe<cr>call lookup#lookup()<cr>zz
    nmap <buffer> <c-w><space>] :vs <bar> call lookup#lookup()<cr>zz
    xmap <buffer> <c-w><space>] :vs <bar> call lookup#lookup()<cr>zz
    " Jump back
    nmap <buffer> <c-t> :call lookup#pop()<cr>zz
  endfunction
augroup END
