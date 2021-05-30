" TOML: vimscript.toml
" Repo: mhinz/vim-lookup

augroup myLookupSource
  au FileType vim,vimspec call s:lookup_keymaps()
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
  if exists('*CocAction')
    echo '[coc] searching the definition...'
    silent let success = CocAction('jumpDefinition', 'edit')
    echo ''
    if success | return | endif
  endif

  echo '[lookup] searching the definition...'
  silent let is_found = lookup#lookup()
  echo ''
  if is_found | return | endif

  echohl ErrorMsg
  echo '[lookup] definition not found'
  echohl None
endfunction

function! s:split_lookup() abort
  if exists('*CocAction')
    echo '[coc] searching the definition...'
    silent let success = CocAction('jumpDefinition', sensible#split())
    echo ''
    if success | return | endif
  endif

  SensibleSplit
  echo '[lookup] searching the definition...'
  silent let is_found = lookup#lookup()
  echo ''
  if is_found | return | endif

  quit
  echohl ErrorMsg
  echo '[lookup] definition not found'
  echohl None
endfunction
