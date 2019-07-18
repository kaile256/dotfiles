"au! BufReadPost,BufEnter * call AlertReadOnly()
"au! BufReadPost,BufEnter * call RetabToSpaces()
"
"function AlertReadOnly()
"  " inactive this function on :help.
"  if &readonly && &buftype ==# ""
"    colorscheme morning
"  endif
"endfunction
" 
"function RetabToSpaces()
"    " replace all tab-chars with tab-settings on vimrcs.
"    " if replace spaces, too, ':retab!'.
"  if ! &readonly || &modifiable
"    retab
"  endif
"endfunction

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

augroup GrepOnQuickfix
  au! QuickFixCmdPost *grep* cwindow
augroup END
