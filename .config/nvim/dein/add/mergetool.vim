" From: git.toml
" Repo: samoshkin/vim-mergetool
" Another: source/mergetool.vim

command! -bar GmergeToolStart :call s:mergetool_start()
command! -bar GmergeToolStop  :call s:mergetool_stop()

function! s:mergetool_start() abort "{{{1
  MergetoolStart

  augroup myMergetoolAutoStop
    au BufWinLeave <buffer> call s:mergetool_stop()
    au OptionSet diff if !&diff | call s:mergetool_stop() | endif
  augroup END
endfunction

function! s:mergetool_stop() abort "{{{1
    MergetoolStop
    silent! augroup! myMergetoolAutoStop
endfunction
