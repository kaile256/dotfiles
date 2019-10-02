" From: filetype.vim

set diffopt=iwhite,vertical
setl wrap

augroup TurnOffDiffMode
  au!
  " Turn off diff mode, without any other windows.
  au WinEnter *
        \ if (winnr('$') == 1)
        \ && (getbufvar(winbufnr('.'), '&diff')) == 1 |
        \     diffoff! |
        \ endif
augroup END
