augroup OnTermMode "{{{
  au!

  " Open Terminal as Startpage
  "if @% == '' && &filetype ==# '' && &buftype ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  au TermOpen * if &bt ==# 'terminal' | setlocal nonumber signcolumn=no modifiable
  au TermOpen * if &bt ==# 'terminal' | norm zH | startinsert

augroup END "}}}

" Color; TUI Color {{{
if $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors "Enables 24-bit RGB color in TUI.
elseif $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
  set notermguicolors
elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
  if $XTERM_VERSION != ''
    set termguicolors
  elseif $KONSOLE_PROFILE_NAME != ''
    set termguicolors
  elseif $VTE_VERSION != ''
    set termguicolors
  else
    set notermguicolors
  endif
elseif $TERM =~ ...
  ... and so forth ...
endif
"}}}
