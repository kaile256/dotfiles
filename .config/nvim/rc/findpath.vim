" From: init.vim

" &path; for `:find`
" Help: *file-searching*
" Note: ';' for upward search.
"       e.g., /usr/share/nvim;/usr will search
"       in /usr, /usr/share, /usr/share/nvim.
" default: .,/usr/include,,
" '.': relative to the directory of the current file
" '':  current directory; keep empty between two commas (i.e., set path+=,,)
set path=,,./*,../
set isfname-=,
set isfname+=@-@

function! MyIncludeExpr(fname) abort
  let fname = a:fname
  let fname = substitute(fname, '\$.\{-}/', '', 'g')
  let fname = substitute(fname, '@$', '', '')
  let fname = substitute(fname, '^\/', '', '')
  return fname
endfunction
let &g:includeexpr = MyIncludeExpr(v:fname)

augroup myFindPathRc
  au FileType sh setl path^=/usr/bin/
  "au FileType java   setl path^=/usr/lib/jvm/
  au FileType go      exe 'setl path^='. $GOPATH .'/src/**,/usr/lib/go/src/**'
  au FileType python  exe 'setl path^='. $XDG_DATA_HOME
        \ .'/../lib/python3.8/site-packages**,/usr/lib/python3.8**'

  au FileType dosini setl suffixesadd=.conf
  "au BufNewFile,BufRead {*vim,dein}**/* setl suffixesadd=.toml

  " Apache
  au BufNewFile,BufRead */httpd/* setl path^=/etc/httpd/**
  au BufNewFile,BufRead */lampp/* setl path^=/opt/lampp/**

  au BufNewFile,BufRead */{.config,dotfiles}/*/* call s:path.dotfiles()

  exe 'au' TermOpen '* call s:path.vim()'
  au BufNewFile,BufRead */{*vim,dein}/*/* call s:path.vim()
  au FileType startuptime call s:path.vim()

  au BufNewFile,BufRead $GHQ_ROOT/*/* call s:path.ghq()
augroup END

let s:path = {} "{{{1

function! s:path.dotfiles() abort
  const path = expand('%:p')
  if path =~# '/[n.]\?vim/' | return | endif

  if path !~# $DOTFILES_HOME
    exe 'setlocal path+='. $DOTFILES_HOME .'/.config/*'
  endif

  exe 'setlocal path-='. &g:path
endfunction

function! s:path.vim() abort
  const path = expand('%:p')

  setlocal suffixesadd=_release,.lua
  " Note: Upward search by `;` with `lua` path fails to search paths which
  " doesn't contain 'lua' directory.  Upward search with '*' also also fails.
  exe 'setlocal path+='. $DEIN_GITHUB_DIR .'/*/*/lua'
  exe 'setlocal path+='. $DEIN_GITHUB_DIR .'/*/*'
  exe 'setlocal path+='. $DEIN_GITHUB_DIR .'/*'
  exe 'setlocal path+='. $DEIN_GITHUB_DIR

  const nvim_source_home = $GHQ_ROOT .'/github.com/neovim/neovim'
  exe 'setlocal path+='. nvim_source_home

  if path =~# $DOTFILES_HOME
    " Note: resolve path in dotfiles to keep under git control.
    const nvim_config_home = $DOTFILES_HOME .'/.config/nvim'
    const plugin_config_home = nvim_config_home .'/dein'
    exe 'setlocal path^='. plugin_config_home
    exe 'setlocal path^='. plugin_config_home .'/lua'
    exe 'setlocal path^='. plugin_config_home .'/toml/*'
    exe 'setlocal path^='. nvim_config_home .'/lua'
    exe 'setlocal path^='. nvim_config_home .'/after'
  endif

  exe 'setl path-='. &g:path

  setlocal keywordprg=:help
endfunction

function! s:path.ghq() abort
  const path = expand('%:p')
  if path !~# '/[n.]\?vim/' | return | endif

  if path !~# $GHQ_ROOT
    exe 'setl path+='. s:project_root($GHQ_ROOT)
  endif

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

  return path .'/*'
endfunction
