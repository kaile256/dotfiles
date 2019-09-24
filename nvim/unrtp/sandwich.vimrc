" From: motion.toml
" Repo: machakann/vim-sandwich
" Alter: sandwich.vimrc

if execute('nmap sr')
  nunmap sr
endif
if execute('nmap sd')
  nunmap sd
endif
if execute('nmap sa')
  nunmap sa
endif

if execute('xmap sr')
  xunmap sr
endif
if execute('xmap sd')
  xunmap sd
endif
if execute('xmap sa')
  xunmap sa
endif

if execute('omap sr')
  ounmap sr
endif
if execute('omap sd')
  ounmap sd
endif
if execute('omap sa')
  ounmap sa
endif
