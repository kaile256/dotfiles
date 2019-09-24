" CAUTION: No Feature is available.

function! advanced_HML#higher() abort
  let l:wanted_height = winheight(0)/4
  norm H
  let l:lastline = 1
  while winline() < l:wanted_height
    echo winline()
    norm gj
    if l:lastline == winline()
      break
    endif
    let l:lastline = winline()
  endwhile
  return cursor(l:lastline, '.')
endfunction

function! advanced_HML#lower() abort
  let l:wanted_height = winheight(0)/4*3
  norm M
  let l:lastline = 1
  while winline() < l:wanted_height 
    echo winline()
    norm gj
    if l:lastline == winline()
      call winline()
      break
    endif
    let l:lastline = winline()
  endwhile
endfunction

command! AdvancedH :call advanced_HML#higher()<cr>
command! AdvancedL :call advanced_HML#lower()<cr>
