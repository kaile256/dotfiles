" From: finder.toml
" Repo: dominickng/fzf-session.vim

let s:fzf_data_home    = $XDG_DATA_HOME  .'/fzf'
let s:fzf_session_path = s:fzf_data_home .'/sessions'

if !isdirectory(s:fzf_data_home)
  exe '!mkdir' shellescape(expand(s:fzf_data_home))
endif

if !filereadable(s:fzf_session_path)
  exe '!touch' shellescape(expand(s:fzf_session_path))
endif
