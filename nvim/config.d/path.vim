"""" From: 'init.vim'

"""" Backup
" Write, on path,vim, the file directory paths.
set nobackup
set nowritebackup
set noswapfile
set noundofile
"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END
"""" XDG Base Repository
"set undodir=~/.local/share/nvim/undo
"set directory="~/.local/share/nvim/swap
"set backupdir=~/.local/share/nvim/backup
"set viminfo='1000,n~/.local/share/nvim/info
"set runtimepath=$XDG_CONFIG_HOME/vim,http://eleclog.quitsq.com/2014/10/arch-on-x220.html?m=1$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
let g:netrw_home = "~/.local/share/nvim"

"""" PATH: for the cmd ':find'
"let s:xdg_config_path='~/.config/**'
"set path+=s:xdg_config_path
set path+=../**
set path+=~/.config/**
set path+=~/.cache/nvim/dein/repos/github.com/**
set path+=~/.local/nvim/**

set path-=~
set path-=.git/**
set path-=*yarn*/**
set path-=*node*/**

"let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
"let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
"let g:ruby_host_prog = '/home/linuxbrew/.linuxbrew/bin/ruby'

if has('python3')
  let g:python3_host_prog = '/usr/bin/python3'
  "let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')
endif

if has('python2')
let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
endif

let g:ruby_host_prog = '/usr/bin/ruby'
