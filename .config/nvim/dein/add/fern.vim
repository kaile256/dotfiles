" TOML: browse.toml
" Repo: lambdalisue/fern.vim
" Another: source/fern.vim

nmap <A-x><A-r> <A-x>r
xmap <A-x><A-r> <A-x>r
nnoremap <silent> <A-x>r :<C-u>call <SID>fern()<CR>
xnoremap <silent> <A-x>r :<C-u>call <SID>fern()<CR>

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
