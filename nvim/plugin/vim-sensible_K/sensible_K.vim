" Ref: phrase.vim
" Ref: easymotion/vim-easymotion/autoload
" Ref: junegunn/fzf.vim/autoload/fzf/vim.vim
" coc.nvim_release/autoload

function! s:sensible_K(ft) abort
  "if exists('b:loaded_sensible_K')
  "  finish
  "endif
  if a:ft ==# 'vim' || &ft ==# 'vim'
    if winwidth('.') > 150
    "if nvim_win_get_width(win_getid('%')) > 150  " faster?
      setl keywordprg=:vert\ help
    else
      setl keywordprg=:help
    endif
  endif
  "let b:loaded_sensible_K = 1
endfunction

augroup AdjustKeywordprgDirection
  au!
  " Quite Slow
  au BufWinEnter,BufWinLeave,WinEnter * call <SID>sensible_K('')
  "au BufWinEnter * call <SID>adjust_keywordprg()
augroup END

command! -nargs=1 ModifiedK :call <SID>sensible_K('q-args')<cr>
