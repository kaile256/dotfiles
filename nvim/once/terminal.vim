" From: init.vim

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
" Keymap; Jump Anyway by <c-i><c-o> {{{
"tmap <c-i> <c-\><c-n><c-i>
tmap <c-o> <c-\><c-n><c-o>
tmap <a-i> <c-\><c-n><a-i>
tmap <a-o> <c-\><c-n><a-o>
tmap <a-p> <c-\><c-n><a-p>
tmap <a-n> <c-\><c-n><a-n>
"}}}

augroup OnTerminalBuffer
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  if has('nvim')
    au TermOpen * setl nonumber signcolumn=
    au TermOpen * norm zH 
    au TermOpen * startinsert
  endif
augroup END

" Color; Set TUI Color {{{
if $TERM =~# '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors "Enables 24-bit RGB color in TUI.
elseif $TERM =~# '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
  set notermguicolors
elseif $TERM =~# '^\(xterm\)\(-.*\)\?$'
  if $XTERM_VERSION !=# ''
    set termguicolors
  elseif $KONSOLE_PROFILE_NAME !=# ''
    set termguicolors
  elseif $VTE_VERSION !=# ''
    set termguicolors
  else
    set notermguicolors
  endif
endif
"}}}

" Function; ls-grep
" TODO: get bufnr('term://') in hidden-buffers to bufdelete them.
function! s:grep_heavy_bufnr()
  redir => l:hidden_buffers
  silent ls!
  redir END
  bdelete g/term:\/\//
endfunction
"cnoreabbr <expr> bdt (getcmdtype() == ':' && getcmdline() =~ '^bdt$')? 'LsGrep term:// <bar> bwipeout! ' : 'bdt'
