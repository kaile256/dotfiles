" Ref: phrase.vim
" Ref: easymotion/vim-easymotion/autoload/EasyMotion/overwin.vim
" Ref: junegunn/fzf.vim/autoload/fzf/vim.vim
" coc.nvim_release/autoload

" Save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

let g:sensible_K#tab_if_less_than = {
      \ 'width': '40',
      \ 'height': '',
      \ 'conj': 'OR'
      \ }
let g:sensible_K#vertical_if_less_than = {
      \ 'location': 'bot',
      \ 'width': '150',
      \ 'height': '',
      \ 'conj': 'no'
      \ }

let g:sensible_K#horizontal_location = 'bot'

function! s:sensible_K(ft) abort
  " Remove before flight
  "if exists('b:loaded_sensible_K')
  "  finish
  "endif
  if a:ft == ''
    let g:sensible_K#current_arg = &l:ft
  else
    let g:sensible_K#current_arg = a:ft
  endif
  if a:ft ==# 'vim' || &l:ft ==# 'vim'
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

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
