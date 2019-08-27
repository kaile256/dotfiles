if exists('loaded_lazy_terminal')
  finish
endif
let g:loaded_lazy_terminal = 1

" Keymap; ESC & Alt {{{
" esc n the same way as in the other mode.
tnoremap <c-[> <c-\><c-n>
tnoremap <esc> <c-\><c-n>
tnoremap <a-;> <c-\><c-n>:
tnoremap <a-:> <c-\><c-n>:
" esc & hjkl
" <a-b> is useful on bash
tnoremap <a-h> <c-\><c-n>h
tnoremap <a-j> <c-\><c-n>j
tnoremap <a-k> <c-\><c-n>k
tnoremap <a-l> <c-\><c-n>l
"tnoremap <a-h> <c-\><c-n><c-w>h
"tnoremap <a-j> <c-\><c-n><c-w>j
"tnoremap <a-k> <c-\><c-n><c-w>k
"tnoremap <a-l> <c-\><c-n><c-w>l
"}}}

augroup OnTerminalBuffer "{{{
  au!

  " Open Terminal as Startpage
  "if @% == '' && &filetype ==# '' && &buftype ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  au TermOpen * if &bt ==# 'terminal' | setl nonumber signcolumn=no modifiable
  au TermOpen * if &bt ==# 'terminal' | norm zH | startinsert

augroup END "}}}

" Color; Set TUI Color {{{
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
endif
"}}}
