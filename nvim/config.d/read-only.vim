au! BufReadPost,BufEnter * call AlertReadOnly()
au! BufReadPost,BufEnter * call RetabToSpaces()

function AlertReadOnly()
  " inactive this function on :help.
  if &readonly && &buftype ==# ""
    colorscheme morning
  endif
endfunction
 
function RetabToSpaces()
    " replace all tab-chars with tab-settings on vimrcs.
    " if replace spaces, too, ':retab!'.
  if &modifiable && &readonly
  else
    retab
  endif
endfunction
