" From: appearance.toml
" Repo: wellle/context.vim
" Another: source/context.vim
" Another: post/context.vim

ContextEnable

augroup myContextPost
  " FIXME: suppress floating context window on opening gitcommit.
  au BufEnter * call s:disable_context_on_buffer()
augroup END

function! s:disable_context_on_buffer() abort
  if index(g:context_filetype_blacklist, &ft) == -1
        \ && &bt !=# 'terminal'
    return
  endif
  ContextDisableWindow

  augroup myContextPost-tmp
    au! BufWinLeave <buffer> ContextEnableWindow
  augroup END
endfunction

