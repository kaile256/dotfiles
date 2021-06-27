if &filetype !=# 'man' | finish | endif

if exists('$MANWIDTH')
  let &colorcolumn = $MANWIDTH + 1
endif

setlocal signcolumn= nolist foldlevel=0
setlocal bufhidden=hide
