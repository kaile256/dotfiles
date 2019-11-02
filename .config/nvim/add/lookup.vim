" From: ftplugin.toml
" Repo: mhinz/vim-lookup

augroup LookupMyConf
  au!
  au FileType vim call <SID>lookup_my_keymaps()
  function! s:lookup_my_keymaps() abort
    nmap <silent><buffer> <c-]>  :call lookup#lookup()<cr>
    xmap <silent><buffer> <c-]>  :call lookup#lookup()<cr>
    nmap <silent><buffer> <c-w>] :sp   <bar> call lookup#lookup()<cr>
    xmap <silent><buffer> <c-w>] :sp   <bar> call lookup#lookup()<cr>
    nmap <silent><buffer> <c-w>g] :tabe<cr>call lookup#lookup()<cr>
    xmap <silent><buffer> <c-w>g] :tabe<cr>call lookup#lookup()<cr>
    nmap <silent><buffer> <c-w><space>] :vs <bar> call lookup#lookup()<cr>
    xmap <silent><buffer> <c-w><space>] :vs <bar> call lookup#lookup()<cr>
    " Jump back
    nmap <silent><buffer> <c-t> :call lookup#pop()<cr>
  endfunction
augroup END
