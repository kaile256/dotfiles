" TOML: vimscript.toml
" Repo: mhinz/vim-lookup

augroup myLookupSource
  au FileType vim call s:lookup_keymaps()
  function! s:lookup_keymaps() abort
    " " Jump back
    " nnoremap <silent><buffer> <c-t> :<c-u>call lookup#pop()<cr>zvzt

    nnoremap <silent><buffer> gd :<C-u>call lookup#lookup()<cr>zvzt
    xnoremap <silent><buffer> gd :call      lookup#lookup()<cr>zvzt
    nnoremap <silent><buffer> <C-w>d :<c-u>call <SID>split_lookup()<CR>
    xnoremap <silent><buffer> <C-w>d :call <SID>split_lookup()<CR>
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
