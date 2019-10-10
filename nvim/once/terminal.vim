" From: init.vim

" Keymap; ESC & Alt {{{
"" esc in the same way as in the other mode.
"tnoremap <c-[> <c-\><c-n>
"tnoremap <esc> <c-\><c-n>
tnoremap <a-;> <c-\><c-n>:
tnoremap <a-:> <c-\><c-n>:
" esc & hjkl
" <a-b> is useful on bash
tnoremap <a-h> <c-\><c-n>h
tnoremap <a-j> <c-\><c-n>j
tnoremap <a-k> <c-\><c-n>k
tnoremap <a-l> <c-\><c-n>l
"}}}
" Keymap; Jump Anyway by <c-i><c-o> {{{
"tmap <c-i> <c-\><c-n><c-i>
tmap <c-o> <c-\><c-n><c-o>
tmap <a-i> <c-\><c-n><a-i>
tmap <a-o> <c-\><c-n><a-o>
tmap <a-p> <c-\><c-n><a-p>
tmap <a-n> <c-\><c-n><a-n>

tnoremap <a-h> <c-\><c-n>h
tnoremap <a-j> <c-\><c-n>j
tnoremap <a-k> <c-\><c-n>k
tnoremap <a-l> <c-\><c-n>l

tnoremap <a-y> <c-\><c-n>y
tnoremap <a-c> <c-\><c-n>c
" TODO: keep <space> as a prefix
tnoremap <a-space> <c-c><c-\><c-n><space>
"}}}

augroup OnTerminalBuffer
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  if has('nvim')
    au TermOpen * setl nonumber signcolumn=
    au TermOpen * norm! 0
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
function! s:grep_heavy_bufnr()
  " TODO: get bufnr('term://') in hidden-buffers to bufdelete them.
  let l:hidden_buffers = execute('ls!')
  " e.g., term://foo
  let l:only_term = substitute(l:hidden_buffers, '[^:\/\/]', '', 'e')
  let l:only_term_bufnr = substitute(l:)
  bwipeout g/term:\/\//
endfunction
