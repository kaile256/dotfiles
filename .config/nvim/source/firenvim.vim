" From: web.toml
" Repo: glacambre/firenvim

let g:firenvim_config = {}
" Ref: https://medium.com/@cappyzawa/firenvim%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6web%E3%81%A7%E3%82%82vim%E3%82%8B-9147d3c89beb

let g:firenvim_config.localSettings = {
      \ '.*': {
      \   'selector': 'textarea, div[role="textbox"]',
      \   'priority': 0,
      \   }
      \ }

"let g:firenvim_config.localSettings = {
"      \ '.*': {
"      \   'selector': '',
"      \   'priority': 0,
"      \   },
"      \ 'github\.com': {
"      \   'selector': 'textarea',
"      \   'priority': 1,
"      \   },
"      \ }

augroup myFireNvimSourceModFileTypes
  au!
  au BufEnter github.com_*.txt         call s:set_font(s:firenvim_font) | setl filetype=markdown
  au BufEnter play.golang.org_*.txt    call s:set_font(s:firenvim_font) | setl filetype=go
  au BufEnter play.rust-lang.org_*.txt call s:set_font(s:firenvim_font) | setl filetype=rust
augroup END

let s:firenvim_font = 'Migu\ 1M'
function! s:set_font(font) abort
  exe 'set guifontset='. a:font .':h14'
endfunction

augroup myFireNvimSource
  au!
  au TextChanged  * ++nested call s:delay_write()
  au TextChangedI * ++nested call s:delay_write()
augroup END

function! s:write(timer) abort
  let s:nowrite = 0
  write
endfunction

let s:SID = matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')

function! s:delay_write() abort
  if get(s:, 'nowrite', 0) | return | endif

  let s:nowrite = 1
  call timer_start(10000, s:SID .'write')
endfunction
