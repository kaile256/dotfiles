if fnamemodify(@%, ':p') !~# 'vim' | finish | endif

augroup myTomlFtplugin
  au!
  " Remove Unnecessary part of URL
  au FocusGained *vim**/*.toml call s:get_repo()
augroup END

function! s:get_repo() abort
  let clipboard = @+
  let clipboard = substitute(clipboard, 'https://github.com/', '', '')
  let clipboard = substitute(clipboard, '/blob/.*', '', '')
  let @+ = clipboard
endfunction

