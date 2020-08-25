" TOML: vimscript.toml
" Repo: mhinz/vim-lookup

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

function! s:split_lookup() abort
  try
    SensibleSplit
  catch /E492/
    split
  endtry

  let is_moved = lookup#lookup()

  if is_moved | return | endif
  quit
endfunction
