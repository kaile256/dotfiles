if has('gui_running')
  set guioptions=
  set go+=a " autoselect on Visual mode to the unnamed-register
  set go+=i " use a Vim icon
  " set guioptions-=m
  " set guioptions-=b
  " set guioptions-=T
  " set guioptions-=R
  " set guioptions-=L
  " set guioptions-=l
  " set guioptions-=r

  " Note: Linux prefers 1.5x font size; Mac prefers 2x; Win prefers any size.
  if has('unix')
    " Tips: Try `:set guifont=*`, then get the format by `:set guifont?`.
    try
      let &guifont   = 'JetBrainsMonoMedium Nerd Font 10.5'
      let &printfont = 'JetBrainsMonoMedium Nerd Font 10.5'
      set linespace=1
    catch
      set guifont=Monospace\ 12
      set printfont=Monospace\ 12
    endtry
  elseif has('win64') || has('win32')
    try
      set guifont=JetBrainsMonoMedium_Nerd_Font:h12
      set printfont=JetBrainsMonoMedium_Nerd_Font:h12
    catch
      set guifont=Monospace:h12
      set printfont=Monospace:h12
    endtry
  endif
endif
