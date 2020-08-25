" From: appearance.toml
" Repo: wellle/context.vim
" Another: add/context.vim

ContextEnable

augroup myContextPost
  " Note: It sometimes brings floating context from the previous buffer,
  " copied.  Because it doesn't happen without wrapper command, keep this
  " config private.
  au BufWinEnter * call s:disable_context_on_buffer()
augroup END

function! s:disable_context_on_buffer() abort
  if &bt !=# 'terminal' | return | endif

  ContextDisableWindow
  augroup myContextPost-tmp
    au BufWinLeave <buffer> ContextEnableWindow
  augroup END
endfunction
