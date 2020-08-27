" TOML: vimscript.toml
" Repo: mhinz/vim-lookup

augroup myLookupSource
  au FileType vim call s:lookup_keymaps()
  function! s:lookup_keymaps() abort
    " " Jump back
    " nnoremap <silent><buffer> <c-t> :<c-u>call lookup#pop()<cr>zvzt

    nnoremap <silent><buffer> gd :<C-u>call <SID>lookup()<cr>zvzz
    xnoremap <silent><buffer> gd :call      <SID>lookup()<cr>zvzz
    nnoremap <silent><buffer> <C-w>d :<c-u>call <SID>split_lookup()<CR>zvzz
    xnoremap <silent><buffer> <C-w>d :call <SID>split_lookup()<CR>zvzz
  endfunction
augroup END

function! s:lookup() abort
  let is_moved = lookup#lookup()

  if is_moved | return | endif

  call CocAction('jumpDefinition')
endfunction

function! s:split_lookup() abort
  try
    SensibleSplit
  catch /E492/
    split
  endtry

  let is_moved = lookup#lookup()

  if is_moved | return | endif
  quit

  call CocAction('jumpDefinition', sensible#split())
endfunction
