" From: init.vim

augroup UpdatePathToFind
  au!
  au FileType python setl path^=/usr/lib/python3.7/
  au FileType go     setl path^=/usr/lib/go/
  au BufWinEnter *{vim,dein}** call s:path.vim()
  au OptionSet path call s:path.unnecessary()
augroup END

let s:path = {}

function! s:path.unnecessary() abort
  " &path; negative
  setl path-=~
  setl path-=.git*/**
  setl path-=*yarn*/**
  setl path-=*node*/**
endfunction

function! s:path.vim() abort
  exe 'setl path^='. $XDG_DATA_HOME    .'/nvim/**'
  exe 'setl path^='. g:dein_github_dir .'/**'
  exe 'setl path^='. $XDG_CONFIG_HOME  .'/nvim/**'
endfunction
