" From: init.vim

noremap! <c-x>h     ~/
noremap! <c-x><c-h> ~/
tnoremap <c-x>h     ~/
tnoremap <c-x><c-h> ~/

" keep <space> as a prefix {{{1
inoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>
tnoremap <silent> <a-space> <c-c><c-\><c-n>:call feedkeys("\<space>")<cr>

" Keymap; Write&Quit {{{1
nnoremap q <Nop>
nnoremap Q <Nop>
"" Write&Quit; Evacuation for Macro
nnoremap q<space> q
"" Write&Quit; wq
nnoremap <silent> <space>w :<c-u>w  <cr>
nnoremap <silent> <space>W :<c-u>w! <cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap <silent> <space>q :<c-u>w  <cr>

" Keymap; Cancel {{{1
onoremap <a-h> <ESC>h
onoremap <a-j> <ESC>j
onoremap <a-k> <ESC>k
onoremap <a-l> <ESC>l
onoremap <a-w> <ESC>w
onoremap <a-b> <ESC>b
onoremap <a-e> <ESC>e
onoremap <a-s-w> <ESC>W
onoremap <a-s-b> <ESC>B
onoremap <a-s-e> <ESC>E
cnoremap <a-h> <c-c><c-w>h
cnoremap <a-j> <c-c><c-w>j
cnoremap <a-k> <c-c>
cnoremap <a-l> <c-c><c-w>l
" <c-k> enter digraph
cnoremap <c-k><a-k> <c-c>
"
" Improve; i_<c-g> {{{1
inoremap <c-g><c-h> <Left>
inoremap <c-g>h     <Left>
inoremap <c-g><c-l> <Right>
inoremap <c-g>l     <Right>
inoremap <c-g><c-b> <S-Left>
inoremap <c-g>b     <S-Left>
inoremap <c-g><c-w> <S-Right>
inoremap <c-g>w     <S-Right>
"
" Improve; i_<c-o> {{{1
" TODO: make <c-o>yi work, as <c-o>di, <c-o>ci.
"inoremap <c-o>y <esc>
"      \ :au TextYankPost * ++once norm! gi<cr>
"      \ y

" Alt-ESC; <a-hjkl> {{{1
" CAUTION: Never careless mapping on <i_a-hjkl>
" CAUTION: Remember n_<a-hjkl> for Win-Leap
" For: make sure <a-hjkl> work as <esc>hjkl, e.g., while pop-up menu shows.
" Note: <a-h> behaves as <esc> is more instinctive than <esc>h.
inoremap <a-h> <esc>
inoremap <a-j> <esc>j
inoremap <a-k> <esc>k
inoremap <a-l> <esc>l
snoremap <a-h> <esc>h
snoremap <a-j> <esc>j
snoremap <a-k> <esc>k
snoremap <a-l> <esc>l

" Alt-ESC; <a-web> {{{1
inoremap <a-w>   <esc>w
inoremap <a-b>   <esc>b
inoremap <a-e>   <esc>e
inoremap <a-s-w> <esc>W
inoremap <a-s-b> <esc>B
inoremap <a-s-e> <esc>E

" Alt-ESC; <a-ydcup> {{{1
inoremap <a-y>   <esc>y
inoremap <a-x>   <esc>x
inoremap <a-d>   <esc>d
inoremap <a-c>   <esc>c
inoremap <a-u>   <esc>u
inoremap <a-c-r> <esc><c-r>
inoremap <a-p>   <c-g>u<esc>p
inoremap <a-s-p> <c-g>u<esc>P
inoremap <a-s-y> <esc>y$
inoremap <a-s-x> <esc>X
inoremap <a-s-d> <esc>D
inoremap <a-s-c> <esc>C
snoremap <a-y>   <esc>y
snoremap <a-x>   <esc>x
snoremap <a-d>   <esc>d
snoremap <a-c>   <esc>c
snoremap <a-u>   <esc>u
snoremap <a-c-r> <esc><c-r>
snoremap <a-p>   <c-g>u<esc>p
snoremap <a-s-p> <c-g>u<esc>P
snoremap <a-s-y> <esc>y$
snoremap <a-s-x> <esc>X
snoremap <a-s-d> <esc>D
snoremap <a-s-c> <esc>C

" Note: 'U' respects vi-compatible way of `uu`.
inoremap <a-s-u> <esc>U
inoremap <a-s-p> <c-g>u<esc>P
snoremap <a-s-u> <esc>U
snoremap <a-s-p> <c-g>u<esc>P

""" A-ydcup; for another type {{{1
inoremap <a-y><a-y> <esc>yy
inoremap <a-y><a-i> <esc>yi
inoremap <a-y><a-a> <esc>ya

inoremap <a-y><a-w> <esc>yw
inoremap <a-y><a-b> <esc>yb
inoremap <a-y><a-e> <esc>ye

inoremap <a-d><a-d> <esc>dd
inoremap <a-d><a-i> <esc>di
inoremap <a-d><a-a> <esc>da

inoremap <a-d><a-w> <esc>dw
inoremap <a-d><a-b> <esc>db
inoremap <a-d><a-e> <esc>de

inoremap <a-c><a-c> <esc>cc
inoremap <a-c><a-i> <esc>ci
inoremap <a-c><a-a> <esc>ca

inoremap <a-c><a-w> <esc>cw
inoremap <a-c><a-b> <esc>cb
inoremap <a-c><a-e> <esc>ce


" Alt-ESC; <a-iao> "{{{1
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <a-a>   <esc>la
inoremap <a-i>   <esc>i
inoremap <a-o>   <esc>o
inoremap <a-s-o> <esc>O
inoremap <a-s-i> <esc>I
inoremap <a-s-a> <esc>A


" CAUTION: <c-d> increases indent on Insert Mode.
" Undo Break; {{{1
"" Undo Break; New Line
"inoremap <c-j> <c-g>u<c-j>
"inoremap <c-m> <c-g>u<c-m>
" Undo Break; Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Undo Break; Put
inoremap <c-r> <c-g>u<c-r>
inoremap <c-x> <c-g>u<c-x>
" Undo Break; Insert Previously's
inoremap <c-a> <c-g>u<c-a>
inoremap <c-@> <c-g>u<c-@>
" Undo Break; Digraph
inoremap <c-k> <c-g>u<c-k>
" Undo Break; Non-Digit
inoremap <c-q> <c-g>u<c-q>
inoremap <c-v> <c-g>u<c-v>

augroup AdditionalUndoBreakOnFileType "{{{
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END "}}}
" Undo Keep; Inc/Decrement {{{1
" Too slow.
"nnoremap <c-x> <c-g>U<c-x>
"nnoremap <c-a> <c-g>U<c-a>


" Fold; Uniquely Open Fold {{{1
" i.e., close all the others
noremap zU zMzv


function! s:send_to_cmdline(delete) abort range "{{{
  " TODO: start reverse highlight the cmd-edit mode at the first-line,
  "       which had better be removed when VimLeave.
  if mode() =~? 'v'
    " TODO: restrict only in visualized area.
    exe join(getline("'<", "'>"), "\<c-j>")
    if a:delete ==# 'delete' | *delete _ | endif
    return
  endif

  exe getline('.')
  if a:delete ==# 'delete' | delete _ | endif
endfunction "}}}

" TODO: I prefer to use <c-o> in insert-mode.
noremap <silent> g: :call <SID>send_to_cmdline('delete')<cr>
noremap <silent> z: :call <SID>send_to_cmdline('keep')<cr>

function! s:fold_up_vimscript() abort "{{{
  if &readonly && !&modifiable | return | endif

  if mode() =~? 'v'
    silent *g/function!/v/"{{{/norm! A "{{{
    silent *g/endfunction/v/"}}}/norm! A "}}}
    silent *g/augroup/v/END/v/"{{{/norm! A "{{{
    silent *g/augroup/g/END/v/"}}}/norm! A "}}}
  else
    silent g/function!/v/"{{{/norm! A "{{{
    silent g/endfunction/v/"}}}/norm! A "}}}
    silent g/augroup/v/END/v/"{{{/norm! A "{{{
    silent g/augroup/g/END/v/"}}}/norm! A "}}}
  endif
endfunction "}}}

command! -range -bar FoldUpVimscript call s:fold_up_vimscript()
