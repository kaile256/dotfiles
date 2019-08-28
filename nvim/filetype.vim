function! s:ft_detection()
  "if exists(b:did_load_filetypes)
  "  finish
  "endif

  au BufWinEnter *.txt       ++once setl syn=help

  au BufWinEnter *.vim!      ++once setl ft=vim
  au BufWinEnter *.vimrc!    ++once setl ft=vim
  au BufWinEnter i3/*/config ++once setl ft=i3
  au BufWinEnter *.snip      ++once setl ft=neosnippet

  au BufWinEnter *.jl        ++once setl ft=julia
  au BufWinEnter *.idr       ++once setl ft=idris
  au BufWinEnter *.lidr      ++once setl ft=lidris
  au BufWinEnter *.lfe       ++once setl ft=lfe
endfunction

augroup AppendFileType
  au!
  au BufAdd * call <SID>ft_detection()
augroup END

augroup AutoDeleteWhiteSpace
  au!
  au BufWritePre * keeppatterns %s/\s\+$//ge
augroup END
