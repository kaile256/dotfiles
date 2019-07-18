"augroup CheckStartTime
"  au! VimEnter,InsertEnter,WinEnter * checktime
"augroup END

""" Cursor Position
augroup KeepLastCursor
  au!
  au VimLeavePre * exe "normal mp"
  au VimLeavePre * exe "normal mP"
augroup END
"augroup CursorlineOnlyOnActiveWindow
"  au!
"  au VimEnter,BufWinEnter,WinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

"" Read only
augroup AlertReadOnly
  au! BufReadPost,BufEnter *
  " inactive this function on :help.
  if &readonly && &modifiable
    colorscheme morning
  endif
augroup END

augroup RetabToSpaces
  " replace all tab-chars with tab-settings on vimrcs.
  " :retab!; if replace spaces, too.
  au! BufReadPost,BufEnter *
  if ! &readonly || &modifiable
    retab
  endif
augroup END

""" Indent
augroup ResizeIndent
  au!
  au FileType Javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
  au FileType Ruby       setlocal shiftwidth=2 tabstop=2 softtabstop=2
  au FileType Python     setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

""" Grep
augroup GrepOnQuickfix
  au! QuickFixCmdPost *grep* cwindow
augroup END

""" Git
augroup GItSpellCheck
  au! FileType gitcommit setlocal spell

""" QuickFix
augroup QuickFixModifiable
  au! QuickFixCmdPost * setlocal modifiable
augroup END

""" Terminal
if has('nvim' || 'terminal')
  augroup ModifiableTermMode
    au! TermOpen * setlocal modifiable
  augroup END

  augroup NoNumberOnTermMode
    au! TermOpen * setlocal nonumber
  augroup END
endif
