"""" XDG Base Repository
set undodir=$XDG_DATA_HOME/vim/undo
set directory=$XDG_DATA_HOME/vim/swap
set backupdir=$XDG_DATA_HOME/vim/backup
"set viminfo='1000,n$XDG_DATA_HOME/vim/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

"""" PATH: for the cmd ':find'
"let s:xdg_config_path='~/.config/**'
"set path+=s:xdg_config_path
set path+=../**
set path+=~/.config/**
set path+=~/.cache/nvim/dein/repos/github.com/**

set path-=~
set path-=.git/**
set path-=*yarn*/**
set path-=*node*/**

"let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
"let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
"let g:ruby_host_prog = '/home/linuxbrew/.linuxbrew/bin/ruby'

if has('python3')
  let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')
endif

if has('python2')
let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
endif

let g:ruby_host_prog = '~/.cargo/bin'
