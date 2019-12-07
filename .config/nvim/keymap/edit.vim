" From: init.vim

noremap! <c-x>h     ~/
noremap! <c-x><c-h> ~/
tnoremap <c-x>h     ~/
tnoremap <c-x><c-h> ~/

" makes <c-o>u work as if <c-u>
"nnoremap o o<c-g>u
"nnoremap O O<c-g>u

" Macro "{{{1
nnoremap \<space> q
nnoremap <space>\ q
" Write&Quit {{{1
if mapcheck('q', 'n') == ''
  nnoremap q <Nop>
endif
if mapcheck('Q', 'n') == ''
  nnoremap Q <Nop>
endif
" Write&Quit; wq
"nnoremap <silent> <space>w :<c-u>w  <cr>
"nnoremap <silent> <space>W :<c-u>w! <cr>
"" Note: <space>q is sometimes mistyped, intending <space>w.
"nnoremap <silent> <space>q :<c-u>w  <cr>
" Note: :undojoin causes an error just after :undo.
" TODO: make :undojoin work on :write
nnoremap <silent> <space>w :<c-u>silent! undojoin <bar> w  <bar>silent! undojoin<cr>
nnoremap <silent> <space>W :<c-u>silent! undojoin <bar> w! <bar>silent! undojoin<cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap <silent> <space>q :<c-u>silent! undojoin <bar> w  <bar>silent! undojoin<cr>

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
" CAUTION: d:/y: disturbs expected behavior on visualmode
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
