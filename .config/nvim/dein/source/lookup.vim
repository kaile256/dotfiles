" From: ftplugin.toml
" Repo: mhinz/vim-lookup

if exists('#myLookupSource') | au! myLookupSource
endif
augroup myLookupSource
  au FileType vim call s:lookup_keymaps()
  function! s:lookup_keymaps() abort
    nnoremap <silent><buffer> <c-]>         :<c-u>call     lookup#lookup()<cr>zvzt
    xnoremap <silent><buffer> <c-]>         :call          lookup#lookup()<cr>zvzt
    nnoremap <silent><buffer> <c-w>]        :<c-u>sp<bar>  call lookup#lookup()<cr>zvzt
    xnoremap <silent><buffer> <c-w>]        :sp<bar>       call lookup#lookup()<cr>zvzt
    nnoremap <silent><buffer> <c-w>g]       :<c-u>tabe<cr> call lookup#lookup()<cr>zvzt
    xnoremap <silent><buffer> <c-w>g]       :tabe<cr>      call lookup#lookup()<cr>zvzt
    nnoremap <silent><buffer> <c-w><space>] :<c-u>vs<bar>  call lookup#lookup()<cr>zvzt
    xnoremap <silent><buffer> <c-w><space>] :vs<bar>       call lookup#lookup()<cr>zvzt
    " Jump back
    nnoremap <silent><buffer> <c-t> :<c-u>call lookup#pop()<cr>zvzt
  endfunction
augroup END
