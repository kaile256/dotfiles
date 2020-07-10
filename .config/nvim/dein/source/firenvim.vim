" From: web.toml
" Repo: glacambre/firenvim

let g:firenvim_config = {}
" Ref: https://medium.com/@cappyzawa/firenvim%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6web%E3%81%A7%E3%82%82vim%E3%82%8B-9147d3c89beb

let g:firenvim_config.globalSettings = {
      \ 'alt': 'all',
      \ }

let g:firenvim_config.localSettings = {
      \ '.*': {
      \   'cmdline': 'neovim',
      \   'selector': 'textarea, div[role="textbox"]',
      \   'priority': 0,
      \   'takeover': 'never'
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

if exists('#myFireNvimSourceModFileTypes')
  au! myFireNvimSourceModFileTypes
endif
augroup myFireNvimSourceModFileTypes
  au BufEnter github.com_*.txt         setlocal filetype=markdown
  au BufEnter play.golang.org_*.txt    setlocal filetype=go
  au BufEnter play.rust-lang.org_*.txt setlocal filetype=rust
augroup END

"augroup myFireNvimSource
"" Ref: https://medium.com/@cappyzawa/firenvim%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6web%E3%81%A7%E3%82%82vim%E3%82%8B-9147d3c89beb
"  au!
"  au TextChanged  * ++nested call s:delay_write()
"  au TextChangedI * ++nested call s:delay_write()
"augroup END

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
