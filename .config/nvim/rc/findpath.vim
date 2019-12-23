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
  au FileType python  setl path^=/usr/lib/python3.8


  au FileType dosini setl suffixesadd=.conf
  au FileType vim    setl isfname-==

  au BufWinEnter {*vim,dein}**/*        call s:path.vim()
  au BufWinEnter {.config,dotfiles}**/* call s:path.dotfiles()
augroup END

let s:path = {}

function! s:path.dotfiles() abort
  if expand('%:p') =~# '/*vim/' | return | endif

  exe 'setl path+='. g:dotfiles_home .'/.config/**'
  exe 'setl path+='. $GHQ_ROOT       .'/**'
  exe 'setl path+='. '/etc'
  exe 'setl path+='. $XDG_DATA_HOME  .'/**'

  exe 'setl path-='. &g:path
endfunction

function! s:path.vim() abort
  if expand('%:p') !~# '~\&vim\|dein' | return | endif
  if expand('%:p') =~# $GOPATH        | return | endif

  exe 'setl path+='. g:dotfiles_home   .'/.config/nvim/**'
  exe 'setl path+='. g:dein_github_dir .'**'
  exe 'setl path+='. $GHQ_ROOT         .'/**'
  exe 'setl path+='. $XDG_DATA_HOME    .'/nvim/**'

  exe 'setl path-='. &g:path
endfunction
