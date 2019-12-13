" From: init.vim

" &path; for `:find`
" Note: ';' for upward search.
"       e.g., /usr/share/nvim;/usr will search
"       in /usr, /usr/share, /usr/share/nvim.
" default: .,/usr/include,,
" '.': relative to the directory of the current file
" '':  current directory; keep empty between two commas (i.e., set path+=,,)
set path=../**,/etc

augroup UpdatePathToFind
  au!
  au FileType sh,bash setl path^=/usr/bin/
  au FileType c,cpp   setl path^=/usr/include
  au FileType go      setl path^=/usr/lib/go
  au FileType python  setl path^=/usr/lib/python3.7

  au FileType dosini setl suffixesadd=.conf

  " why ':au BufWinEnter {*vim,dein}/**' doesn't work?
  au BufWinEnter {*vim,dein}/**             call s:path.vim()
  au BufWinEnter **/{.config,dotfiles}/**/* call s:path.dotfiles()
  " seems no use
  "au OptionSet * if expand('<amatch>') =~# 'path' | call s:path.unnecessary()
augroup END

let s:path = {}

function! s:path.dotfiles() abort
  if expand('%:p') =~# '/*vim/' | return | endif

  " Note: ~/dotfiles/** doesn't work, why?
  exe 'setl path='.  $XDG_DATA_HOME   .'/**'
  exe 'setl path^='. '/etc'
  exe 'setl path^='. $GHQ_ROOT        .'/**'
  exe 'setl path^='. $XDG_CONFIG_HOME .'/**'
  "exe 'setl path^='. g:dotfiles_home  .'/nvim/**'
endfunction

function! s:path.vim() abort
  if expand('%:p') !~# '~\&vim\|dein' | return | endif
  if expand('%:p') =~# $GOPATH        | return | endif

  exe 'setl path='.  $XDG_DATA_HOME    .'/nvim/**'
  exe 'setl path^='. $GHQ_ROOT         .'/**'
  exe 'setl path^='. g:dein_github_dir .'**'
  exe 'setl path^='. $XDG_CONFIG_HOME  .'/nvim/**'
  "exe 'setl path^='. g:dotfiles_home   .'/nvim/**'
endfunction

function! s:path.unnecessary() abort
  if &l:path != ''
    setl path-=/etc
  endif

  "" no use?
  "setl path-=~
  "setl path-=.git*/**
  "setl path-=*yarn*/**
  "setl path-=*node*/**
endfunction
