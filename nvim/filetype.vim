augroup AppendFileType

  au!
  au BufWinEnter *.txt       setl syn=help

  au BufWinEnter *.vim!      setl ft=vim
  au BufWinEnter *.vimrc!    setl ft=vim
  au BufWinEnter i3/*/config setl ft=i3
  au BufWinEnter *.jl        setl ft=julia
  au BufWinEnter *.idr       setl ft=idris
  au BufWinEnter *.lidr      setl ft=lidris
  au BufWinEnter *.lfe       setl ft=lfe

augroup END

augroup AutoDeleteWhiteSpace "{{{
  au!

  "" Delete; WhiteSpace Unnecessary
  au BufWritePre * silent keepjumps keeppatterns %s/\s\+$//ge

augroup END "}}}
