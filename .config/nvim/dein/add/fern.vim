" TOML: browse.toml
" Repo: lambdalisue/fern.vim
" Another: source/fern.vim

nnoremap <silent> <A-x>f :<C-u>call <SID>fern()<CR>
xnoremap <silent> <A-x>f :<C-u>call <SID>fern()<CR>

function! s:fern() abort
  if &bt ==# ''
    Fern -drawer %:h -reveal=%
    return
  endif
  if &ft ==# 'fern'
    Fern -drawer . -reveal=%
  endif
  if &bt ==# 'terminal'
  endif
endfunction
