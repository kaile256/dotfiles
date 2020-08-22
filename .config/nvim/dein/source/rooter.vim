" TOML: default.toml
" Repo: airblade/vim-rooter
" Another: add/rooter.vim

let g:rooter_manual_only = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

let g:rooter_change_directory_for_non_project_files = ''

let g:rooter_patterns = []

let g:rooter_patterns += [
      \ '.bzr/',
      \ '.git',
      \ '.git/',
      \ '.hg/',
      \ '.svn/',
      \ '_darcs/',
      \ ]

let g:rooter_patterns += [
      \ 'Rakefile',
      \ ]

let g:rooter_patterns += [
      \ $GHQ_ROOT,
      \ $MY_DEV .'/',
      \ $MY_DEV .'/atcoder',
      \ 'github.com/',
      \ ]

let g:rooter_patterns += [
      \ $XDG_CONFIG_HOME,
      \ '.cache/',
      \ '.local/',
      \ ]
