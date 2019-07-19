"""" PATH: for the cmd ':find'
"let s:xdg_config_path='~/.config/**'
"set path+=s:xdg_config_path
set path+=../**,
set path+=~/.config/**,
set path+=~/.cache/nvim/dein/repos/github.com/**,

set path-=.git/**,
set path-=*yarn/**,
set path-=*node/**,

"!source /home/kaile256/.pyenv/versions/pyvenv_neovim/bin/activate.fish
"let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
"let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
"let g:ruby_host_prog = '/home/linuxbrew/.linuxbrew/bin/ruby'
if has('python3')
  let g:python3_host_prog = ''
else
  ""TODO: auto-pkgm-install python3 python3-pip
  ""    : auto-pip3-install neovim neovim-remote
endif
let g:python_host_prog = ''
let g:ruby_host_prog = ''
