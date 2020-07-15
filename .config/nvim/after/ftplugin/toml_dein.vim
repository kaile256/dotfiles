if fnamemodify(@%, ':p') !~# 'vim' | finish | endif

if exists('#myTomlFtplugin') | au! myTomlFtplugin
endif
augroup myTomlFtplugin
  " Remove Unnecessary part of URL
  au FocusGained *vim**/*.toml call s:get_repo()
augroup END

function! s:get_repo() abort
  let clipboard = @+
  let clipboard = substitute(clipboard, 'https://github.com/', '', '')
  let clipboard = substitute(clipboard, '/blob/.*', '', '')
  let @+ = clipboard
endfunction

