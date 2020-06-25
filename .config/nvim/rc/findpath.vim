" From: init.vim

" &path; for `:find`
" Note: ';' for upward search.
"       e.g., /usr/share/nvim;/usr will search
"       in /usr, /usr/share, /usr/share/nvim.
" default: .,/usr/include,,
" '.': relative to the directory of the current file
" '':  current directory; keep empty between two commas (i.e., set path+=,,)
set path=./**,/etc
set isfname-=,
set isfname-==

augroup myFindPathRc
  if exists('#myFindPathRc') | au! myFindPathRc
  endif

  au FileType sh setl path^=/usr/bin/
  "au FileType java   setl path^=/usr/lib/jvm/
  au FileType go      exe 'setl path^='. $GOPATH .'/src/**,/usr/lib/go/src/**'
  au FileType python  exe 'setl path^='. $XDG_DATA_HOME
        \ .'/../lib/python3.8/site-packages**,/usr/lib/python3.8**'

  au FileType dosini setl suffixesadd=.conf
  "au BufNewFile,BufRead {*vim,dein}**/* setl suffixesadd=.toml

  " Apache
  au BufRead */httpd/* setl path^=/etc/httpd/**
  au BufRead */lampp/* setl path^=/opt/lampp/**

  au BufNewFile,BufRead {.config,dotfiles}**/* call s:path.dotfiles()

  exe 'au' TermOpen '* call s:path.vim()'
  au BufNewFile,BufRead {*vim,dein}**/* call s:path.vim()

  au BufNewFile,BufRead $MY_MEMO**/*   call s:path.memo()
  au BufNewFile,BufRead $GHQ_ROOT**/* call s:path.ghq()
augroup END

let s:path = {} "{{{1

function! s:path.dotfiles() abort
  if expand('%:p') =~# '/*vim/' | return | endif

  exe 'setl path+='. $DOTFILES_HOME .'/.config**'
  " exe 'setl path+='. $GHQ_ROOT       .'/github.com/neovim/neovim**'
  " exe 'setl path+='. '/etc'
  exe 'setl path+='. $XDG_DATA_HOME  .'**'

  exe 'setl path-='. &g:path
endfunction

function! s:path.vim() abort
  if expand('%:p') =~# $GHQ_ROOT | return | endif

  exe 'setl path+='. $DOTFILES_HOME   .'/.config/nvim**'
  exe 'setl path+='. g:dein_github_dir .'**'
  exe 'setl path+='. $GHQ_ROOT         .'/github.com/neovim/neovim**'
  exe 'setl path+='. $XDG_DATA_HOME    .'/nvim**'

  exe 'setl path-='. &g:path
endfunction

function! s:path.memo() abort
  exe 'setl path+='. $MY_MEMO
  "call s:path.dotfiles()
endfunction

function! s:path.ghq() abort
  if expand('%:p') !~# '/*vim/' | return | endif

  exe 'setl path+='. s:project_root($GHQ_ROOT)

  exe 'setl path-='. &g:path
  exe 'setl path+='. '/etc'
endfunction

function! s:project_root(path) abort "{{{2
  let path = expand('%:p')
  let project_pattern = '/[^/]\+/[^/]\+[^/]\+'

  if path[len(a:path) - 2 : ] !~# project_pattern
    " TODO: make sure it work
    echoerr 'This function is NOT appropriate on' a:path
  endif

  let repo_path = a:path . project_pattern .'$'

  while path !~# repo_path
    let path = fnamemodify(path, ':h')
  endwhile

  return path .'**'
endfunction
