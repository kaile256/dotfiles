" If Something Wrong, try to ':source %' by vim.

"" Dein
if ! isdirectory(g:dein_itself)
  exe "!mkdir -p" shellescape(expand(g:Shougo_cache_dir))
  exe "!git clone https://github.com/Shougo/dein.vim" shellescape(expand(g:dein_itself))
endif

"""" Denite/Defx
UpdateRemotePlugins

"""" Coc
call coc#util#install()
