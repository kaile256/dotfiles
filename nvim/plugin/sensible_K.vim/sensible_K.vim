" Ref: open-browser.vim
" Ref: clever_split.vim
" Ref: autoload/clever_split.vim

" Save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

" TODO: can adjust via `let` {{{1
let g:sensible_K#tab_if_height_is_less_than = 50
let g:sensible_K#tab_if_width_is_less_than = 80
"let g:sensible_K#tab_if_less_than = {
"      \ 'width': '40',
"      \ 'height': '',
"      \ 'conj': 'OR'
"      \ }
let g:sensible_K#vertical_if_less_than = 150
"let g:sensible_K#vertical_if_less_than = {
"      \ 'location': 'bot',
"      \ 'width': '150',
"      \ 'height': '',
"      \ 'conj': 'no'
"      \ }
"}}}
let g:sensible_K#help_engine = {
      \ 'coc-setting.json': 'help',
      \ 'toml/*.toml': 'help'
      \ }

function! s:sensible_K() abort
  " TODO: if no entry of help, try camelcase-wise
  " Remove before flight
  "if exists('b:loaded_sensible_K')
  "  finish
  "endif
  " TODO: precise error notification
  "if exists('g:sensible_K#horizontal_location')
  "  && g:sensible_K#horizontal_location !=# 'abo\%[veleft]'
  "  && g:sensible_K#horizontal_location !=# 'lefta\%[bove]'
  "  && g:sensible_K#horizontal_location !=# 'to\%[pleft]'
  "  && g:sensible_K#horizontal_location !=# 'bel\%[owright]'
  "  && g:sensible_K#horizontal_location !=# 'rightb\%[elow]'
  "  && g:sensible_K#horizontal_location !=# 'bo\%[tright]'
  "  "throw ' Allowed arg is in 
  "endif
  let tab_help =
        \ (winheight('.') > g:sensible_K#tab_if_height_is_less_than
        \ || winwidth('.') > g:sensible_K#tab_if_width_is_less_than)
  let vert_help = (winwidth('.') > g:sensible_K#vertical_if_less_than)
  "let engine = g:sensible_K#help_engine[bufname('.')]
  if &l:ft ==# 'vim'
    if tab_help
      setl keywordprg=:tab\ help
    elseif vert_help
      setl keywordprg=:vert\ help
    else
      if exists('g:sensible_K#horizontal_location')
        let direction = g:sensible_K#horizontal_location
      else
        let direction = 'bel'
      endif
      exe 'setl keywordprg=:'. direction .'\ help'
    endif
  endif
  "let b:loaded_sensible_K = 1
endfunction

command! SensibleK :call <SID>sensible_K()

augroup SensibleKCallFunc
  au!
  " TODO: sensible to resize of current window.
  au WinEnter,BufWinEnter,BufWinLeave * call <SID>sensible_K()
augroup END

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
