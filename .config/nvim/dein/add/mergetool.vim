" From: git.toml
" Repo: samoshkin/vim-mergetool
" Another: source/mergetool.vim

command! -bar Gresolve        :MergetoolStart | call s:mergetool_config()
command! -bar GmergeToolStart :MergetoolStart
command! -bar GmergeToolStop  :MergetoolStop

function! s:mergetool_config() abort "{{{1
  augroup myMergetoolAutoStop
    au!
    au OptionSet diff
          \ if !&diff
          \ |   MergetoolStop
          \ |   silent! augroup! myMergetoolAutoStop
          \ | endif
  augroup END
endfunction
