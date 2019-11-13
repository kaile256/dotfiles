" From: ftplugin.toml
" Repo: mhinz/vim-lookup

augroup LookupCallMyFunc
  au!
  au FileType vim call s:lookup_keymaps()
  function! s:lookup_keymaps() abort
    nnoremap <silent><buffer> <c-]>         :<c-u>call     lookup#lookup()<cr>zv
    xnoremap <silent><buffer> <c-]>         :call          lookup#lookup()<cr>zv
    nnoremap <silent><buffer> <c-w>]        :<c-u>sp<bar>  call lookup#lookup()<cr>zv
    xnoremap <silent><buffer> <c-w>]        :sp<bar>       call lookup#lookup()<cr>zv
    nnoremap <silent><buffer> <c-w>g]       :<c-u>tabe<cr> call lookup#lookup()<cr>zv
    xnoremap <silent><buffer> <c-w>g]       :tabe<cr>      call lookup#lookup()<cr>zv
    nnoremap <silent><buffer> <c-w><space>] :<c-u>vs<bar>  call lookup#lookup()<cr>zv
    xnoremap <silent><buffer> <c-w><space>] :vs<bar>       call lookup#lookup()<cr>zv
    " Jump back
    nnoremap <silent><buffer> <c-t> :<c-u>call lookup#pop()<cr>zv
  endfunction
augroup END
