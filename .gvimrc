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
    " Note: when 'guifontset' is not empty, it replaces 'guifont'.
    try
      set guifont=Meslo\ LG\ S\ for\ Powerline\ 13.5
      set guifontwide=Meslo\ LG\ S\ for\ Powerline\ 13.5
      set guifontset=Meslo\ LG\ S\ for\ Powerline\ 13.5
      set printfont=Meslo\ LG\ S\ for\ Powerline\ 13.5
      "set linespace=0
    catch
      set guifont=Monospace\ 12
      set printfont=Monospace\ 12
    endtry
  elseif has('win64') || has('win32')
    try
      set guifont=SF_Mono:h12
      set guifont=SF_Mono:h12
      set printfont=SF_Mono:h12
    catch
      set guifont=Monospace\ 12
      set printfont=Monospace\ 12
    endtry
  endif
endif
