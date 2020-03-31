if expand('%:p') !~# 'vim' | finish | endif

" " especially for dein in private; use lexima instead
" inoreabbr <buffer><expr> #[
"      \ (getline('.') =~# ']')
"      \ ? '#[ ]<Left>'
"      \ : '#['
" "inoreabbr <buffer><expr> #[
" "      \ (getline('.') =~# ']')
" "      \ ? '#[]'
" "      \ : '#['

augroup myTomlFtplugin "{{{1
  if exists('#myTomlFtplugin') | au! myTomlFtplugin
  endif
  " Remove Unnecessary part of URL
  au BufWritePre *vim**/*.toml call s:dein_reduce_url()
augroup END

function! s:dein_reduce_url() abort "{{{2
  keeppatterns %s;https://github.com/;;ge
endfunction

" TODO: make it automatically
" if execute('au myTomlFtpluginRecache') ==# "\n--- Autocommands ---" "{{{1
"   augroup myTomlFtpluginRecache
"     au TextChanged,TextChangedI,TextChangedP *vim**/*.toml
"          \ call s:dein_recache_waiting()
"   augroup END
" endif

" function! s:dein_recache_waiting() abort "{{{2
"   augroup myTomlFtpluginRecache
"     au!
"     au BufWritePost *vim**/*.toml :call s:dein_recache_ready()
"   augroup END
" endfunction

" function! s:dein_recache_ready() abort "{{{2
"   augroup myTomlFtpluginRecache
"     au!
"     au VimLeavePre,FocusLost * call dein#recache_runtimepath()
"          \ | silent! au! myTomlFtpluginRecache
"   augroup END
" endfunction
