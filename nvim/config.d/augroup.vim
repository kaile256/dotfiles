"augroup CheckStartTime
"  au! VimEnter,InsertEnter,WinEnter * checktime
"augroup END

augroup KeepLastCursor
  au!
  au VimLeavePre * exe "normal mp"
  au VimLeavePre * exe "normal mP"
augroup END

augroup ResizeIndent
  au! FileType Javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

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

""" QuickFix
augroup QuickFixModifiable
  au! QuickFixCmdPost * set modifiable
augroup END

""" Grep
augroup GrepOnQuickfix
  au! QuickFixCmdPost *grep* cwindow
augroup END

""" Git
augroup GItSpellCheck
  au! FileType gitcommit setlocal spell
