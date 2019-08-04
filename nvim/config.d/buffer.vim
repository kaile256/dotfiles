"""" From: nvim/init.vim

"""" KEYMAP
augroup AppendFileType
  au!
  au BufNewFile,BufRead *.vim!   setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc  setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc! setlocal filetype=vim
  au BufNewFile,BufRead i3/*/config setlocal filetype=i3
augroup END

augroup OnTermMode
  au!
  au TermOpen * silent setlocal nonumber
  au TermOpen,BufEnter * if &buftype ==# 'terminal' | startinsert | endif
augroup END

augroup NoBufListed
"  au!
  " Why: setlocal buflisted DOESN'T work.
"  au WinLeave * if &filetype ==# 'netrw' | bd <c-r>=bufnr('%')
augroup END

augroup AdjustOnFileType
  """ Treat as QuickFix
  au FileType help setlocal buftype=quickfix
  "" Cursor Locates on the Middle
  au FileType help norm zz

  """" PLUGINS
  au FileType vista setlocal nobuflisted
  """ Treat as QuickFix
  """ Help in Buffer-list
  au BufLeave * if &filetype ==# 'help' | drop % | endif
  au BufEnter * if expand('%') ==# 'netrw' | setlocal &buftype=quickfix | endif
  au FileType fugitive,defx,vista setlocal buftype=quickfix

  """ Quit immediately upon WinLeave
  "" NOTICE: fzf works on terminal; CANNOT change buftype.
  au WinLeave * if &filetype ==# 'fzf' | quit | endif
augroup END
