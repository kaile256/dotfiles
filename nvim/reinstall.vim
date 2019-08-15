"" If Something Wrong, try to ':source %' by vim.

"" Dein
if isdirectory(g:dein_itself)
  !git clone https://github.com/Shougo/dein.vim
endif

"""" Denite/Defx
UpdateRemotePlugins

"""" Coc
call coc#util#install()
