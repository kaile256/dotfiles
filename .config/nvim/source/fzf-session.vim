" From: finder.toml
" Repo: dominickng/fzf-session.vim

let s:fzf_data_home    = $XDG_DATA_HOME  .'/fzf'
let g:fzf_session_path = g:fzf_data_home .'/sessions'

if !isdirectory(s:fzf_data_home)
  exe '!mkdir' shellescape(expand(s:fzf_data_home))
endif

if !filereadable(g:fzf_session_path)
exe '!touch' shellescape(expand(g:fzf_session_path))
endif
