" From: init.vim

noremap! <c-x>h     ~/
noremap! <c-x><c-h> ~/
tnoremap <c-x>h     ~/
tnoremap <c-x><c-h> ~/

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

" Improve; i_<c-o> {{{1
" TODO: make <c-o>yi work, as <c-o>di, <c-o>ci.
"inoremap <c-o>y <esc>
"      \ :au TextYankPost * ++once norm! gi<cr>
"      \ y

" Cancel {{{2
onoremap <silent> <a-h> <ESC>:call feedkeys('h')<cr>
onoremap <silent> <a-j> <ESC>:call feedkeys('j')<cr>
onoremap <silent> <a-k> <ESC>:call feedkeys('k')<cr>
onoremap <silent> <a-l> <ESC>:call feedkeys('l')<cr>
" Undo Break; {{{1
inoremap <a-U> <esc>:call feedkeys('U')<cr>
inoremap <a-P> <c-g>u<esc>:call feedkeys('P')<cr>

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
" Undo Join; Inc/Decrement {{{1
" Too slow.

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
