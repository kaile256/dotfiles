"""" From: nvim/init.vim

"""" KEYMAP
augroup AppendFileType
  au!
  au BufNewFile,BufRead *.vim!   setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc  setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc! setlocal filetype=vim
  au BufNewFile,BufRead */i3/*   setlocal filetype=i3
augroup END

augroup NoBufListed
"  au!
  " Why: setlocal buflisted DOESN'T work.
"  au WinLeave * if &filetype ==# 'netrw' | bd <c-r>=bufnr('%')
augroup END

augroup AdjustOnFileType
  au!
  """ Treat as QuickFix
  au FileType help setlocal buftype=quickfix

  """ Help in Buffer-list
  au BufLeave * if &filetype ==# 'help' | drop % | endif

  """" PLUGINS
  au FileType vista setlocal nobuflisted
  """ Treat as QuickFix
  au FileType fugitive,defx,vista setlocal buftype=quickfix

  """ Quit immediately upon WinLeave
  "" NOTICE: fzf works on terminal; CANNOT change buftype.
  au WinLeave * if &filetype ==# 'fzf' | quit | endif
augroup END
