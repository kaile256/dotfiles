" From: init.vim

" instead
tnoremap <c-x>h     ~/
tnoremap <c-x><c-h> ~/
noremap! <c-x>h     ~/
noremap! <c-x><c-h> ~/

"imap <a-space> <esc><space>
tmap <a-space> <c-\><c-n><space>

" Keymap; Write&Quit {{{
"" Write&Quit; Evacuation for Macro
nnoremap q<space> q
"" Write&Quit; wq
nnoremap <silent> <space>w :<c-u>w  <cr>
nnoremap <silent> <space>W :<c-u>w! <cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap <silent> <space>q :<c-u>w  <cr>
nnoremap <silent> Q <Nop>
"}}}
" Keymap; Cancel {{{
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
"}}}
" Improve; i_<c-g> {{{
inoremap <c-g><c-h> <Left>
inoremap <c-g>h     <Left>
inoremap <c-g><c-l> <Right>
inoremap <c-g>l     <Right>
inoremap <c-g><c-b> <S-Left>
inoremap <c-g>b     <S-Left>
inoremap <c-g><c-w> <S-Right>
inoremap <c-g>w     <S-Right>
"}}}
" Improve; i_<c-o> {{{
" TODO: make <c-o>yi work, as <c-o>di, <c-o>ci.
"inoremap <c-o>y <esc>
"      \ :au TextYankPost * ++once norm! gi<cr>
"      \ y
"}}}

" CAUTION: Never careless mapping on <i_a-hjkl>
" Alt-ESC; <a-hjkl> {{{
"  make sure <a-hjkl> work as <esc>hjkl, e.g., while pop-up menu shows.
" CAUTION: Remember n_<a-hjkl> for Win-Leap
inoremap <nowait> <a-h> <esc>h
inoremap <nowait> <a-j> <esc>j
inoremap <nowait> <a-k> <esc>k
inoremap <nowait> <a-l> <esc>l
snoremap <a-h> <esc>h
snoremap <a-j> <esc>j
snoremap <a-k> <esc>k
snoremap <a-l> <esc>l
"}}}
" Alt-ESC; <a-web> {{{
inoremap <nowait> <a-w>   <esc>w
inoremap <nowait> <a-b>   <esc>b
inoremap <nowait> <a-e>   <esc>e
inoremap <nowait> <a-s-w> <esc>W
inoremap <nowait> <a-s-b> <esc>B
inoremap <nowait> <a-s-e> <esc>E
"}}}
" Alt-ESC; <a-ydcup> {{{
inoremap <nowait> <a-y>   <esc>y
inoremap <nowait> <a-x>   <esc>x
inoremap <nowait> <a-d>   <esc>d
inoremap <nowait> <a-c>   <esc>c
inoremap <nowait> <a-u>   <esc>u
inoremap <nowait> <a-c-r> <esc><c-r>
inoremap <nowait> <a-p>   <c-g>u<esc>p
inoremap <nowait> <a-s-p> <c-g>u<esc>P
inoremap <nowait> <a-s-y> <esc>y$
inoremap <nowait> <a-s-x> <esc>X
inoremap <nowait> <a-s-d> <esc>D
inoremap <nowait> <a-s-c> <esc>C
snoremap <nowait> <a-y>   <esc>y
snoremap <nowait> <a-x>   <esc>x
snoremap <nowait> <a-d>   <esc>d
snoremap <nowait> <a-c>   <esc>c
snoremap <nowait> <a-u>   <esc>u
snoremap <nowait> <a-c-r> <esc><c-r>
snoremap <nowait> <a-p>   <c-g>u<esc>p
snoremap <nowait> <a-s-p> <c-g>u<esc>P
snoremap <nowait> <a-s-y> <esc>y$
snoremap <nowait> <a-s-x> <esc>X
snoremap <nowait> <a-s-d> <esc>D
snoremap <nowait> <a-s-c> <esc>C

" Note: 'U' respects vi-compatible way of `uu`.
inoremap <nowait> <a-s-u> <esc>U
inoremap <nowait> <a-s-p> <c-g>u<esc>P
snoremap <nowait> <a-s-u> <esc>U
snoremap <nowait> <a-s-p> <c-g>u<esc>P

""" A-ydcup; for another type {{{
inoremap <nowait> <a-y><a-y> <esc>yy
inoremap <nowait> <a-y><a-i> <esc>yi
inoremap <nowait> <a-y><a-a> <esc>ya

inoremap <nowait> <a-y><a-w> <esc>yw
inoremap <nowait> <a-y><a-b> <esc>yb
inoremap <nowait> <a-y><a-e> <esc>ye

inoremap <nowait> <a-d><a-d> <esc>dd
inoremap <nowait> <a-d><a-i> <esc>di
inoremap <nowait> <a-d><a-a> <esc>da

inoremap <nowait> <a-d><a-w> <esc>dw
inoremap <nowait> <a-d><a-b> <esc>db
inoremap <nowait> <a-d><a-e> <esc>de

inoremap <nowait> <a-c><a-c> <esc>cc
inoremap <nowait> <a-c><a-i> <esc>ci
inoremap <nowait> <a-c><a-a> <esc>ca

inoremap <nowait> <a-c><a-w> <esc>cw
inoremap <nowait> <a-c><a-b> <esc>cb
inoremap <nowait> <a-c><a-e> <esc>ce
"}}}
"}}}
" Alt-ESC; <a-iao> "{{{
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <nowait> <a-a>   <esc>la
inoremap <nowait> <a-i>   <esc>i
inoremap <nowait> <a-o>   <esc>o
inoremap <nowait> <a-s-o> <esc>O
inoremap <nowait> <a-s-i> <esc>I
inoremap <nowait> <a-s-a> <esc>A
"}}}

" CAUTION: <c-d> increases indent on Insert Mode.
" Undo Break; {{{
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
"}}}
augroup AdditionalUndoBreakOnFileType "{{{
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END "}}}
" Undo Keep; Inc/Decrement {{{
" Too slow.
"nnoremap <c-x> <c-g>U<c-x>
"nnoremap <c-a> <c-g>U<c-a>
"}}}

" Fold; Uniquely Open Fold {{{
" i.e., close all the others
noremap zU zMzv
"}}}

function! s:spell_suggestion() abort
  if &spell != 1
    setl spell
    au! CompleteDone * ++once setl nospell
  endif

  " TODO: always start suggestion at the end of <cword>;
  "       sometimes shifted to the left by one char.
  if mode() !=# 'i'
    call feedkeys("wgei", 'n') " move cursor on the end of <cword> and startinsert.
  endif
  " Note: <c-x>s takes cursor back to the last non-comment text.
  call feedkeys("\<c-x>s", 'n') " start spell-completion
  call feedkeys("\<c-p>", 'n') " keep the word from being replaced at first
endfunction

nnoremap <silent> gs     :<c-u>call <SID>spell_suggestion()<cr>
" Note: <c-s> freezes screen in some unix-like OS.
inoremap <silent> <c-x>s <Cmd>call  <SID>spell_suggestion()<cr>

function! s:send_to_cmdline(delete) abort range "{{{
  " TODO: start reverse highlight the cmd-edit mode at the first-line,
  "       which had better be removed when VimLeave.
  if visualmode()
    let l:start = column("'<")
    let l:end   = column("'>")
    " TODO: restrict only in visualized area.
    exe getline("'<", "'>")
    if a:delete ==# 'delete' | *delete _ | endif
    return
  endif

  exe getline('.')
  if a:delete ==# 'delete' | delete _ | endif
endfunction "}}}

" TODO: I prefer to use <c-o> in insert-mode.
noremap <silent> g: :call <SID>send_to_cmdline('delete')<cr>
noremap <silent> z: :call <SID>send_to_cmdline('keep')<cr>
